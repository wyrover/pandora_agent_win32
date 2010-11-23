#!/bin/bash
# Build the Pandora Agent installer.
# The installer will be placed in ./installer/output/.
# InstallJammer must be installed and in the PATH.

DIST=`lsb_release -i | awk '{print $3}'`
HOST="i586-mingw32msvc"
if [ "$DIST" == "SUSE" ]; then
	HOST="i686-pc-mingw32"
fi

./autogen.sh && ./configure --host=$HOST && make clean && make && cp PandoraAgent.exe bin/ && installjammer --build installer/pandora.mpi
