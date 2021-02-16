Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.5171.1613463848621642100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 764A238C1290
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libbsd: upgrading to 0.11.3 FAILED
Message-ID: <MADEUP.16642CD3D078A3EC.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148156
Content-Type: multipart/mixed; boundary="===============1545232700571252000=="

--===============1545232700571252000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libbsd* to *0.11.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libbsd-upgrade-0.10.0-0.11.3.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============1545232700571252000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1428 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (809 cached, 1 parsed). 1428 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-b8c3139362ddcbf13c5a67198a7805881041b9be"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b8c3139362ddcbf13c5a67198a7805881041b9be"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 15 Found 8 Missed 7 Current 120 (53% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 511 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libbsd/libbsd_0.11.3.bb:do_fetch)
NOTE: recipe libbsd-0.11.3-r0: task do_fetch: Started
NOTE: recipe libbsd-0.11.3-r0: task do_fetch: Succeeded
NOTE: Running task 529 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libbsd/libbsd_0.11.3.bb:do_unpack)
NOTE: Running task 530 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libbsd/libbsd_0.11.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libbsd-0.11.3-r0: task do_unpack: Started
NOTE: recipe libbsd-0.11.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libbsd-0.11.3-r0: task do_unpack: Succeeded
NOTE: Running task 531 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libbsd/libbsd_0.11.3.bb:do_patch)
NOTE: recipe libbsd-0.11.3-r0: task do_patch: Started
NOTE: recipe libbsd-0.11.3-r0: task do_patch: Succeeded
NOTE: recipe libbsd-0.11.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 532 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libbsd/libbsd_0.11.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 533 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libbsd/libbsd_0.11.3.bb:do_populate_lic)
NOTE: recipe libbsd-0.11.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libbsd-0.11.3-r0: task do_populate_lic: Started
NOTE: recipe libbsd-0.11.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libbsd-0.11.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 534 of 542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libbsd/libbsd_0.11.3.bb:do_configure)
NOTE: recipe libbsd-0.11.3-r0: task do_configure: Started
ERROR: libbsd-0.11.3-r0 do_configure: configure failed
ERROR: libbsd-0.11.3-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/temp/run.do_configure.12210' failed with exit code 1:
automake (GNU automake) 1.16.2
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.16
autoreconf: export WARNINGS=cross,no-obsolete
autoreconf: Entering directory '.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
autoreconf: configure.ac: tracing
autoreconf: running: libtoolize --copy --force
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
libtoolize: copying file 'build-aux/ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
autoreconf: configure.ac: not using Intltool
autoreconf: configure.ac: not using Gtkdoc
autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force
autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force
autoreconf: running: automake --add-missing --copy --force-missing
configure.ac:25: installing 'build-aux/compile'
configure.ac:9: installing 'build-aux/missing'
src/Makefile.am: installing 'build-aux/depcomp'
autoreconf: 'build-aux/install-sh' is updated
autoreconf: 'build-aux/config.sub' is updated
autoreconf: 'build-aux/config.guess' is updated
autoreconf: Leaving directory '.'
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
checking whether build environment is sane... yes
checking for i686-poky-linux-strip... i686-poky-linux-strip
checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether make supports nested variables... (cached) yes
checking whether make supports the include directive... yes (GNU style)
checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether the compiler supports GNU C... yes
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot accepts -g... yes
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot option to enable C11 features... none needed
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot understands -c and -o together... yes
checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot... none
checking for stdio.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for strings.h... yes
checking for sys/stat.h... yes
checking for sys/types.h... yes
checking for unistd.h... yes
checking for wchar.h... yes
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking whether _XOPEN_SOURCE should be defined... no
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... 64
checking build system type... x86_64-pc-linux-gnu
checking host system type... i686-poky-linux-gnu
checking how to print strings... printf
checking for a sed that does not truncate output... (cached) sed
checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot  
checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot  ) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-nm
checking the name lister (i686-poky-linux-nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot   option to reload object files... -r
checking for i686-poky-linux-objdump... i686-poky-linux-objdump
checking how to recognize dependent libraries... pass_all
checking for i686-poky-linux-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
checking for archiver @FILE support... @
checking for i686-poky-linux-strip... (cached) i686-poky-linux-strip
checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
checking command to parse i686-poky-linux-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot object... ok
checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot
checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
checking for i686-poky-linux-mt... no
checking for mt... no
checking if : is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot static flag -static works... yes
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot supports -c -o file.o... yes
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot supports -c -o file.o... (cached) yes
checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot  ) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking if ld supports --version-script flag... yes
checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot
checking whether the compiler supports GNU C... (cached) yes
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot accepts -g... (cached) yes
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot option to enable C11 features... (cached) none needed
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot understands -c and -o together... (cached) yes
checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot... (cached) none
checking whether ln -s works... yes
checking for unif01_CreateExternGenBits in -ltestu01... no
checking for library containing dlsym... -ldl
checking for library containing MD5Update... no
configure: error: cannot find required MD5 functions in libc or libmd
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/temp/log.do_configure.12210
Log data follows:
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-n
 ative_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gcc-cross-i686', 'gcc-runtime', 'pkgconfig-native', 'automake-native', 'libtool-cross', 'glibc', 'patch-native', 'quilt-native', 'libtool-native', 'pseudo-native', 'autoconf-native', 'xz-native', 'flex-native', 'linux-libc-headers', 'zlib-native', 'gmp-native', 'gnu-config-native', 'texinfo-dummy-native', 'binutils-cross-i686', 'libmpc-native', 'mpfr-native', 'libgcc', 'attr-native', 'm4-native', 'gettext-minimal-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.2
| Copyright (C) 2020 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
| libtoolize: copying file 'build-aux/ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:25: installing 'build-aux/compile'
| configure.ac:9: installing 'build-aux/missing'
| src/Makefile.am: installing 'build-aux/depcomp'
| autoreconf: 'build-aux/install-sh' is updated
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../libbsd-0.11.3/configure  --build=x86_64-linux 		  --host=i686-poky-linux 		  --target=i686-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot  --disable-static
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether make supports nested variables... (cached) yes
| checking whether make supports the include directive... yes (GNU style)
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot option to enable C11 features... none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot understands -c and -o together... yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot... none
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for special C compiler options needed for large files... no
| checking for _FILE_OFFSET_BITS value needed for large files... 64
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
| checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-nm
| checking the name lister (i686-poky-linux-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot   option to reload object files... -r
| checking for i686-poky-linux-objdump... i686-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for i686-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for i686-poky-linux-strip... (cached) i686-poky-linux-strip
| checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
| checking command to parse i686-poky-linux-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for i686-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot static flag -static works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot supports -c -o file.o... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot  ) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking if ld supports --version-script flag... yes
| checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot accepts -g... (cached) yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot... (cached) none
| checking whether ln -s works... yes
| checking for unif01_CreateExternGenBits in -ltestu01... no
| checking for library containing dlsym... -ldl
| checking for library containing MD5Update... no
| configure: error: cannot find required MD5 functions in libc or libmd
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/temp/run.do_configure.12210' failed with exit code 1:
| automake (GNU automake) 1.16.2
| Copyright (C) 2020 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
| libtoolize: copying file 'build-aux/ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/libbsd-0.11.3/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:25: installing 'build-aux/compile'
| configure.ac:9: installing 'build-aux/missing'
| src/Makefile.am: installing 'build-aux/depcomp'
| autoreconf: 'build-aux/install-sh' is updated
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether make supports nested variables... (cached) yes
| checking whether make supports the include directive... yes (GNU style)
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot option to enable C11 features... none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot understands -c and -o together... yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot... none
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for special C compiler options needed for large files... no
| checking for _FILE_OFFSET_BITS value needed for large files... 64
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
| checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-nm
| checking the name lister (i686-poky-linux-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot   option to reload object files... -r
| checking for i686-poky-linux-objdump... i686-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for i686-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for i686-poky-linux-strip... (cached) i686-poky-linux-strip
| checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
| checking command to parse i686-poky-linux-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for i686-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot static flag -static works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot supports -c -o file.o... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot  ) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking if ld supports --version-script flag... yes
| checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot accepts -g... (cached) yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libbsd/0.11.3-r0/recipe-sysroot... (cached) none
| checking whether ln -s works... yes
| checking for unif01_CreateExternGenBits in -ltestu01... no
| checking for library containing dlsym... -ldl
| checking for library containing MD5Update... no
| configure: error: cannot find required MD5 functions in libc or libmd
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe libbsd-0.11.3-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libbsd/libbsd_0.11.3.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 534 tasks of which 527 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libbsd/libbsd_0.11.3.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============1545232700571252000==
Content-Type: text/x-diff; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libbsd-upgrade-0.10.0-0.11.3.patch"

RnJvbSBhMTdjYjhjNTE3ODEyNGZjZGYwMWE0YTEyMGUxY2EwNGYyZjFhMjc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQGF1aC55b2N0b3Byb2plY3Qu
b3JnPgpEYXRlOiBUdWUsIDE2IEZlYiAyMDIxIDA2OjU1OjAyICswMDAwClN1YmplY3Q6IFtQQVRD
SF0gbGliYnNkOiB1cGdyYWRlIDAuMTAuMCAtPiAwLjExLjMKCi0tLQogLi4uL3tsaWJic2RfMC4x
MC4wLmJiID0+IGxpYmJzZF8wLjExLjMuYmJ9ICAgIHwgMTEyICsrKysrKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDEwOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC97bGliYnNkXzAuMTAuMC5iYiA9PiBsaWJic2Rf
MC4xMS4zLmJifSAoMzIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJz
ZC9saWJic2RfMC4xMC4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYnNkL2xpYmJzZF8w
LjExLjMuYmIKc2ltaWxhcml0eSBpbmRleCAzMiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliYnNkL2xpYmJzZF8wLjEwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmJzZC9saWJic2RfMC4xMS4zLmJiCmluZGV4IDViMzJiOWFmNDEuLjg5ZjYxZjE0ODQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMS4zLmJiCkBAIC0x
LDMgKzEsMTEwIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBi
ZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMg
UGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUg
dGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6
JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRh
dGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlO
RworIyBAQCAtMyw3ICszLDcgQEAKKyMgIEZpbGVzOgorIyAgICoKKyMgIENvcHlyaWdodDoKKyMg
LSBDb3B5cmlnaHQgwqkgMjAwNC0yMDA2LCAyMDA4LTIwMTggR3VpbGxlbSBKb3ZlciA8Z3VpbGxl
bUBoYWRyb25zLm9yZz4KKyMgKyBDb3B5cmlnaHQgwqkgMjAwNC0yMDA2LCAyMDA4LTIwMjEgR3Vp
bGxlbSBKb3ZlciA8Z3VpbGxlbUBoYWRyb25zLm9yZz4KKyMgIExpY2Vuc2U6IEJTRC0zLWNsYXVz
ZQorIyAgCisjICBGaWxlczoKKyMgQEAgLTEwNSw2ICsxMDUsNyBAQAorIyAgIG1hbi9nZXRic2l6
ZS4zYnNkCisjICAgbWFuL2hlYXBzb3J0LjNic2QKKyMgICBtYW4vbmxpc3QuM2JzZAorIyArIG1h
bi9wd2NhY2hlLjNic2QKKyMgICBtYW4vcXVldWUuM2JzZAorIyAgIG1hbi9yYWRpeHNvcnQuM2Jz
ZAorIyAgIG1hbi9yZWFsbG9jYXJyYXkuM2JzZAorIyBAQCAtMTIxLDYgKzEyMiw3IEBACisjICAg
c3JjL2hlYXBzb3J0LmMKKyMgICBzcmMvbWVyZ2UuYworIyAgIHNyYy9ubGlzdC5jCisjICsgc3Jj
L3B3Y2FjaGUuYworIyAgIHNyYy9yYWRpeHNvcnQuYworIyAgIHNyYy9zZXRtb2RlLmMKKyMgICBz
cmMvc3RybW9kZS5jCisjIEBAIC0xMzEsNiArMTMzLDcgQEAKKyMgIENvcHlyaWdodDoKKyMgICBD
b3B5cmlnaHQgwqkgMTk4MCwgMTk4MiwgMTk4NiwgMTk4OS0xOTk0CisjICAgICAgIFRoZSBSZWdl
bnRzIG9mIHRoZSBVbml2ZXJzaXR5IG9mIENhbGlmb3JuaWEuICBBbGwgcmlnaHRzIHJlc2VydmVk
LgorIyArIENvcHlyaWdodCDCqSAxOTkyIEtlaXRoIE11bGxlci4KKyMgICBDb3B5cmlnaHQgwqkg
MjAwMSBNaWtlIEJhcmNyb2Z0IDxtaWtlQEZyZWVCU0Qub3JnPgorIyAgIC4KKyMgICBTb21lIGNv
ZGUgaXMgZGVyaXZlZCBmcm9tIHNvZnR3YXJlIGNvbnRyaWJ1dGVkIHRvIEJlcmtlbGV5IGJ5Cisj
IEBAIC0yNzUsOCArMjc4LDYgQEAKKyMgICBtYW4vZ2V0cGVlcmVpZC4zYnNkCisjICAgbWFuL3Bp
ZGZpbGUuM2JzZAorIyAgIHNyYy9leHBhbmRfbnVtYmVyLmMKKyMgLSBzcmMvaGFzaC9zaGE1MTIu
aAorIyAtIHNyYy9oYXNoL3NoYTUxMmMuYworIyAgIHNyYy9waWRmaWxlLmMKKyMgICBzcmMvcmVh
bGxvY2YuYworIyAgIHNyYy90aW1lY29udi5jCisjIEBAIC0zNjgsNiArMzY5LDcgQEAKKyMgICBz
cmMvYXJjNHJhbmRvbV91bml4LmgKKyMgICBzcmMvYXJjNHJhbmRvbV93aW4uaAorIyAgIHNyYy9j
bG9zZWZyb20uYworIyArIHNyYy9mcmVlemVyby5jCisjICAgc3JjL2dldGVudHJvcHlfYWl4LmMK
KyMgICBzcmMvZ2V0ZW50cm9weV9ic2QuYworIyAgIHNyYy9nZXRlbnRyb3B5X2hwdXguYworIyBA
QCAtMzc4LDYgKzM4MCw3IEBACisjICAgc3JjL2dldGVudHJvcHlfd2luLmMKKyMgICBzcmMvcmVh
ZHBhc3NwaHJhc2UuYworIyAgIHNyYy9yZWFsbG9jYXJyYXkuYworIyArIHNyYy9yZWNhbGxvY2Fy
cmF5LmMKKyMgICBzcmMvc3RybGNhdC5jCisjICAgc3JjL3N0cmxjcHkuYworIyAgQ29weXJpZ2h0
OgorIyBAQCAtMzg5LDcgKzM5Miw3IEBACisjICAgICAgIFRvZGQgQy4gTWlsbGVyIDxUb2RkLk1p
bGxlckBjb3VydGVzYW4uY29tPgorIyAgIENvcHlyaWdodCDCqSAyMDA0IFRlZCBVbmFuZ3N0Cisj
ICAgQ29weXJpZ2h0IMKpIDIwMDggRGFtaWVuIE1pbGxlciA8ZGptQG9wZW5ic2Qub3JnPgorIyAt
IENvcHlyaWdodCDCqSAyMDA4IE90dG8gTW9lcmJlZWsgPG90dG9AZHJpamYubmV0PgorIyArIENv
cHlyaWdodCDCqSAyMDA4LCAyMDEwLTIwMTEsIDIwMTYtMjAxNyBPdHRvIE1vZXJiZWVrIDxvdHRv
QGRyaWpmLm5ldD4KKyMgICBDb3B5cmlnaHQgwqkgMjAxMyBNYXJrdXMgRnJpZWRsIDxtYXJrdXNA
b3BlbmJzZC5vcmc+CisjICAgQ29weXJpZ2h0IMKpIDIwMTQgQm9iIEJlY2sgPGJlY2tAb2J0dXNl
LmNvbT4KKyMgICBDb3B5cmlnaHQgwqkgMjAxNCBCcmVudCBDb29rIDxiY29va0BvcGVuYnNkLm9y
Zz4KKyMgQEAgLTQ1NCwxNyArNDU3LDYgQEAKKyMgICBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4g
VEhFIFNPRlRXQVJFLgorIyAgCisjICBGaWxlczoKKyMgLSBpbmNsdWRlL2JzZC9tZDUuaAorIyAt
IHNyYy9oYXNoL21kNS5jCisjIC1Db3B5cmlnaHQ6CisjIC0gTm9uZQorIyAtTGljZW5zZTogcHVi
bGljLWRvbWFpbi1Db2xpbi1QbHVtYgorIyAtIFRoaXMgY29kZSBpbXBsZW1lbnRzIHRoZSBNRDUg
bWVzc2FnZS1kaWdlc3QgYWxnb3JpdGhtLgorIyAtIFRoZSBhbGdvcml0aG0gaXMgZHVlIHRvIFJv
biBSaXZlc3QuIFRoaXMgY29kZSB3YXMKKyMgLSB3cml0dGVuIGJ5IENvbGluIFBsdW1iIGluIDE5
OTMsIG5vIGNvcHlyaWdodCBpcyBjbGFpbWVkLgorIyAtIFRoaXMgY29kZSBpcyBpbiB0aGUgcHVi
bGljIGRvbWFpbjsgZG8gd2l0aCBpdCB3aGF0IHlvdSB3aXNoLgorIyAtCisjIC1GaWxlczoKKyMg
ICBzcmMvZXhwbGljaXRfYnplcm8uYworIyAgIHNyYy9jaGFjaGFfcHJpdmF0ZS5oCisjICBDb3B5
cmlnaHQ6CisjIEBAIC00NzQsOCArNDY2LDYgQEAKKyMgIAorIyAgRmlsZXM6CisjICAgbWFuL21k
WC4zYnNkCisjIC0gc3JjL2hhc2gvbWQ1aGwuYworIyAtIHNyYy9oYXNoL2hlbHBlci5jCisjICBD
b3B5cmlnaHQ6CisjICAgTm9uZQorIyAgTGljZW5zZTogQmVlcndhcmUKKyMgCisjCisKICMgQ29w
eXJpZ2h0IChDKSAyMDEzIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAjIFJlbGVhc2Vk
IHVuZGVyIHRoZSBNSVQgbGljZW5zZSAoc2VlIENPUFlJTkcuTUlUIGZvciB0aGUgdGVybXMpCiAK
QEAgLTI5LDEzICsxMzYsMTIgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9saWJic2QuZnJlZWRlc2t0
b3Aub3JnL3dpa2kvIgogIyBMaWNlbnNlOiBwdWJsaWMtZG9tYWluLUNvbGluLVBsdW1iCiBMSUNF
TlNFID0gIkJTRC0zLUNsYXVzZSAmIEJTRC00LUNsYXVzZSAmIElTQyAmIFBEIgogTElDRU5TRV8k
e1BOfSA9ICJCU0QtMy1DbGF1c2UgJiBJU0MgJiBQRCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0NPUFlJTkc7bWQ1PTIxMjBiZTAxNzM0NjlhMDZlZDE4NWI2ODhlMGUxYWUwIgorTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YWRmNjE3MjA3NWJjYzU4MzdlMzNhOGE2
ODhlYjdlMjIiCiBTRUNUSU9OID0gImxpYnMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9saWJic2Qu
ZnJlZWRlc2t0b3Aub3JnL3JlbGVhc2VzLyR7QlBOfS0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklb
bWQ1c3VtXSA9ICJlYWQ5NmQyNDBkMDJmYWE1YjkyMWMwYWE1MGM4MTJiNSIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIzNGI4YWRjNzI2ODgzZDBlODViMzExOGZhMTM2MDVlMTc5YTYyYjMxYmE1MWY2
NzYxMzZlY2IyZDBiYzFhODg3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZmOTVjZjgxODQxNTFk
YWNhZTQyNDc4MzJmOGQ0ZWE4ODAwZmExMjdkYmQxNTAzM2VjZmU4MzlmMjg1YjQyYTEiCiAKIGlu
aGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwogCi0tIAoyLjE3LjEKCg==

--===============1545232700571252000==--
