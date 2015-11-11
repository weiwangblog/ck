#!/bin/bash

eval $(grep "^VERSION=" configure )
thisdir=$(basename $(pwd))
cp -a $thisdir ~/rpmbuild/SOURCES/ck-${VERSION}
rm -f ~/rpmbuild/SOURCES/ck-${VERSION}.tar.gz
tar czvf ~/rpmbuild/SOURCES/ck-${VERSION}.tar.gz -C  ~/rpmbuild/SOURCES/ ck-${VERSION}
cd build
rpmbuild -bb ck.spec

cp ~/rpmbuild/RPMS/x86_64/ck-${VERSION}*rpm .
cp ~/rpmbuild/RPMS/x86_64/ck-devel-${VERSION}*rpm .
cp ~/rpmbuild/RPMS/x86_64/ck-debuginfo-${VERSION}*rpm .


