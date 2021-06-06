Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.26026.1623000257969781396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2A0EB38C1265
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:18 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.5 FAILED
Message-ID: <MADEUP.16860E22DDC2E2BF.23614@lists.openembedded.org>
X-Groupsio-MsgNum: 152730
Content-Type: multipart/mixed; boundary="===============7158082440084859376=="

--===============7158082440084859376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-utils* to *1.2.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.4-1.2.5.patch
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

--===============7158082440084859376==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.4-1.2.5.patch"

From 5b3ae7723e519208a0961ba1e1e6dd440f758194 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 15:40:47 +0000
Subject: [PATCH] alsa-utils: upgrade 1.2.4 -> 1.2.5

---
 meta/recipes-multimedia/alsa/alsa-utils.inc                     | 2 +-
 .../alsa/{alsa-utils_1.2.4.bb => alsa-utils_1.2.5.bb}           | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.4.bb => alsa-utils_1.2.5.bb} (100%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index f2e8133d2c..1d7f0dd865 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -24,7 +24,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "98ffc2d599de0577d423a48fa5f20a992ca0b82d812ed1f2e58ade49ac6da426"
+SRC_URI[sha256sum] = "09970af05838b30001ca93ba27cb85b24c45056c70a80066c3ece6abe5a19997"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb
-- 
2.17.1


--===============7158082440084859376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1452 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (814 cached, 2 parsed). 1452 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-b53dca7ae7ba16370e61329024e9990463f08d4f"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b53dca7ae7ba16370e61329024e9990463f08d4f"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 224 Local 215 Network 0 Missed 9 Current 560 (95% match, 98% complete)
Removing 1 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 562 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_setscene)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_setscene: Started
NOTE: Running task 1758 of 2434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_fetch)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_setscene: Succeeded
NOTE: Running setscene task 784 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2121 of 2434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_unpack)
NOTE: Running task 2122 of 2434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_patch)
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2423 of 2434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2424 of 2434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_populate_lic)
NOTE: recipe alsa-utils-1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_populate_lic: Started
NOTE: recipe alsa-utils-1.2.5-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-utils-1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2425 of 2434 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_configure)
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Started
ERROR: alsa-utils-1.2.5-r0 do_configure: configure failed
ERROR: alsa-utils-1.2.5-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/temp/run.do_configure.39689' failed with exit code 1:
automake (GNU automake) 1.16.3
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.16
autoreconf: export WARNINGS=cross,no-obsolete
autoreconf: Entering directory '.'
autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/alsa-utils-1.2.5/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
autoreconf: configure.ac: tracing
autoreconf: configure.ac: not using Libtool
autoreconf: configure.ac: not using Intltool
autoreconf: configure.ac: not using Gtkdoc
autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/alsa-utils-1.2.5/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal/ --force
autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/alsa-utils-1.2.5/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal/ --force
autoreconf: running: automake --add-missing --copy --force-missing
alsactl/Makefile.am:68: warning: '%'-style pattern rules are a GNU make extension
alsaucm/Makefile.am:15: warning: '%'-style pattern rules are a GNU make extension
axfer/test/Makefile.am:9: warning: source file '../container.c' is in a subdirectory,
axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
automake: warning: possible forward-incompatibility.
automake: At least a source file is in a subdirectory, but the 'subdir-objects'
automake: automake option hasn't been enabled.  For now, the corresponding output
automake: object file(s) will be placed in the top-level directory.  However,
automake: this behaviour will change in future Automake versions: they will
automake: unconditionally cause object files to be placed in the same subdirectory
automake: of the corresponding sources.
automake: You are advised to start using 'subdir-objects' option throughout your
automake: project, to avoid future incompatibilities.
axfer/test/Makefile.am:9: warning: source file '../container-riff-wave.c' is in a subdirectory,
axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:9: warning: source file '../container-au.c' is in a subdirectory,
axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:9: warning: source file '../container-voc.c' is in a subdirectory,
axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:9: warning: source file '../container-raw.c' is in a subdirectory,
axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../container.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../container-riff-wave.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../container-au.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../container-voc.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../container-raw.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../mapper.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../mapper-single.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
axfer/test/Makefile.am:20: warning: source file '../mapper-multiple.c' is in a subdirectory,
axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
topology/Makefile.am:8: warning: '%'-style pattern rules are a GNU make extension
autoreconf: './config.sub' is updated
autoreconf: './config.guess' is updated
autoreconf: Leaving directory '.'
configure: WARNING: unrecognized options: --with-libtool-sysroot, --disable-static
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot/usr/share/i686-poky-linux_config_site.d/ncurses_config
checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
checking whether build environment is sane... yes
checking for i686-poky-linux-strip... i686-poky-linux-strip
checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking whether to enable maintainer-specific portions of Makefiles... yes
checking for a sed that does not truncate output... (cached) sed
checking whether NLS is requested... yes
checking for msgfmt... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/msgfmt
checking for gmsgfmt... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/msgfmt
checking for xgettext... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/xgettext
checking for msgmerge... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/msgmerge
checking whether make supports the include directive... yes (GNU style)
checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether the compiler supports GNU C... yes
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot accepts -g... yes
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot option to enable C11 features... none needed
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot understands -c and -o together... yes
checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot... none
checking build system type... x86_64-pc-linux-gnu
checking host system type... i686-poky-linux-gnu
checking for ld... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot  
checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot  ) is GNU ld... yes
checking for shared library run path origin... done
checking 32-bit host C ABI... yes
checking how to run the C preprocessor... i686-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time
checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
checking for ELF binary format... yes
checking for the common suffixes of directories in the library search path... lib,lib32,lib
checking for CFPreferencesCopyAppValue... no
checking for CFLocaleCopyPreferredLanguages... no
checking for GNU gettext in libc... yes
checking whether to use NLS... yes
checking where the gettext function comes from... libc
checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot
checking whether the compiler supports GNU C... (cached) yes
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot accepts -g... (cached) yes
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot option to enable C11 features... (cached) none needed
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot understands -c and -o together... (cached) yes
checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot... (cached) none
checking whether ln -s works... yes
checking for a sed that does not truncate output... (cached) sed
checking for i686-poky-linux-pkg-config... no
checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/pkg-config
configure: WARNING: using cross tools not prefixed with host triplet
checking pkg-config is at least version 0.9.0... yes
checking for ALSA CFLAGS... 
checking for dlopen in -lc... no
checking for dlopen in -ldl... yes
checking for ALSA LDFLAGS...  -lasound -lm -ldl -lpthread
checking required libasound headers version... 1.2.5
checking for libasound headers version >= 1.2.5 (1.2.5)... not present.
configure: error: Sufficiently new version of libasound not found.
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/temp/log.do_configure.39689
Log data follows:
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_popul
 ate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/
 autoconf/autoconf_2.71.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-native', 'libtool-native', 'quilt-native', 'gcc-cross-i686', 'glibc', 'pkgconfig-native', 'systemd', 'gcc-runtime', 'patch-native', 'alsa-lib', 'libtool-cross', 'pseudo-native', 'automake-native', 'libsamplerate0', 'ncurses', 'autoconf-native', 'texinfo-dummy-native', 'gettext-minimal-native', 'libmpc-native', 'zlib-native', 'gmp-native', 'flex-native', 'binutils-cross-i686', 'xz-native', 'mpfr-native', 'linux-libc-headers', 'gnu-config-native', 'libcap', 'libxkbcommon', 'update-rc.d', 'shadow-sysroot', 'opkg-utils', 'shadow-native', 'util-linux', 'bash-completion', 'base-passwd', 'shadow', 'acl', 'xz', 'kmod', 'libpam', 'base-files', 'libseccomp', 'initscripts', 'libgcc', 'attr-native', 'libsndfile1', 'm4-native', 'wayland-protocols', 'wayland', 'util-macros', 'libxcb', 'xkeyboard-config', 'zlib', 'libcap-ng', 'libxcrypt', 'util-linux-libuuid', 'attr', 'flex', 'cracklib', 'libvorbis', 'flac', 'libogg', 'libxml2', 'expat', 'lib
 ffi', 'libxdmcp', 'libpthread-stubs', 'xorgproto', 'xcb-proto', 'libxau', 'python3', 'readline', 'gdbm', 'libtirpc', 'bzip2', 'sqlite3', 'libnsl2', 'openssl']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.3
| Copyright (C) 2020 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/alsa-utils-1.2.5/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/alsa-utils-1.2.5/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/alsa-utils-1.2.5/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/alsa-utils-1.2.5/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| alsactl/Makefile.am:68: warning: '%'-style pattern rules are a GNU make extension
| alsaucm/Makefile.am:15: warning: '%'-style pattern rules are a GNU make extension
| axfer/test/Makefile.am:9: warning: source file '../container.c' is in a subdirectory,
| axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
| automake: warning: possible forward-incompatibility.
| automake: At least a source file is in a subdirectory, but the 'subdir-objects'
| automake: automake option hasn't been enabled.  For now, the corresponding output
| automake: object file(s) will be placed in the top-level directory.  However,
| automake: this behaviour will change in future Automake versions: they will
| automake: unconditionally cause object files to be placed in the same subdirectory
| automake: of the corresponding sources.
| automake: You are advised to start using 'subdir-objects' option throughout your
| automake: project, to avoid future incompatibilities.
| axfer/test/Makefile.am:9: warning: source file '../container-riff-wave.c' is in a subdirectory,
| axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:9: warning: source file '../container-au.c' is in a subdirectory,
| axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:9: warning: source file '../container-voc.c' is in a subdirectory,
| axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:9: warning: source file '../container-raw.c' is in a subdirectory,
| axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../container.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../container-riff-wave.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../container-au.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../container-voc.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../container-raw.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../mapper.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../mapper-single.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../mapper-multiple.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| topology/Makefile.am:8: warning: '%'-style pattern rules are a GNU make extension
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../alsa-utils-1.2.5/configure  --build=x86_64-linux 		  --host=i686-poky-linux 		  --target=i686-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot --disable-rst2man --disable-static  --disable-bat  --disable-xmlto --with-udev-rules-dir=/lib/udev/rules.d --enable-nls
| configure: WARNING: unrecognized options: --with-libtool-sysroot, --disable-static
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot/usr/share/i686-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether to enable maintainer-specific portions of Makefiles... yes
| checking for a sed that does not truncate output... (cached) sed
| checking whether NLS is requested... yes
| checking for msgfmt... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/msgfmt
| checking for gmsgfmt... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/msgfmt
| checking for xgettext... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/xgettext
| checking for msgmerge... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/msgmerge
| checking whether make supports the include directive... yes (GNU style)
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot option to enable C11 features... none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot understands -c and -o together... yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot... none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking for ld... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot  ) is GNU ld... yes
| checking for shared library run path origin... done
| checking 32-bit host C ABI... yes
| checking how to run the C preprocessor... i686-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for ELF binary format... yes
| checking for the common suffixes of directories in the library search path... lib,lib32,lib
| checking for CFPreferencesCopyAppValue... no
| checking for CFLocaleCopyPreferredLanguages... no
| checking for GNU gettext in libc... yes
| checking whether to use NLS... yes
| checking where the gettext function comes from... libc
| checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot accepts -g... (cached) yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot... (cached) none
| checking whether ln -s works... yes
| checking for a sed that does not truncate output... (cached) sed
| checking for i686-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking for ALSA CFLAGS...
| checking for dlopen in -lc... no
| checking for dlopen in -ldl... yes
| checking for ALSA LDFLAGS...  -lasound -lm -ldl -lpthread
| checking required libasound headers version... 1.2.5
| checking for libasound headers version >= 1.2.5 (1.2.5)... not present.
| configure: error: Sufficiently new version of libasound not found.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/temp/run.do_configure.39689' failed with exit code 1:
| automake (GNU automake) 1.16.3
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
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/alsa-utils-1.2.5/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/alsa-utils-1.2.5/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/alsa-utils-1.2.5/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| alsactl/Makefile.am:68: warning: '%'-style pattern rules are a GNU make extension
| alsaucm/Makefile.am:15: warning: '%'-style pattern rules are a GNU make extension
| axfer/test/Makefile.am:9: warning: source file '../container.c' is in a subdirectory,
| axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
| automake: warning: possible forward-incompatibility.
| automake: At least a source file is in a subdirectory, but the 'subdir-objects'
| automake: automake option hasn't been enabled.  For now, the corresponding output
| automake: object file(s) will be placed in the top-level directory.  However,
| automake: this behaviour will change in future Automake versions: they will
| automake: unconditionally cause object files to be placed in the same subdirectory
| automake: of the corresponding sources.
| automake: You are advised to start using 'subdir-objects' option throughout your
| automake: project, to avoid future incompatibilities.
| axfer/test/Makefile.am:9: warning: source file '../container-riff-wave.c' is in a subdirectory,
| axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:9: warning: source file '../container-au.c' is in a subdirectory,
| axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:9: warning: source file '../container-voc.c' is in a subdirectory,
| axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:9: warning: source file '../container-raw.c' is in a subdirectory,
| axfer/test/Makefile.am:9: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../container.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../container-riff-wave.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../container-au.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../container-voc.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../container-raw.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../mapper.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../mapper-single.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| axfer/test/Makefile.am:20: warning: source file '../mapper-multiple.c' is in a subdirectory,
| axfer/test/Makefile.am:20: but option 'subdir-objects' is disabled
| topology/Makefile.am:8: warning: '%'-style pattern rules are a GNU make extension
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| configure: WARNING: unrecognized options: --with-libtool-sysroot, --disable-static
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot/usr/share/i686-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether to enable maintainer-specific portions of Makefiles... yes
| checking for a sed that does not truncate output... (cached) sed
| checking whether NLS is requested... yes
| checking for msgfmt... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/msgfmt
| checking for gmsgfmt... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/msgfmt
| checking for xgettext... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/xgettext
| checking for msgmerge... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/msgmerge
| checking whether make supports the include directive... yes (GNU style)
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot option to enable C11 features... none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot understands -c and -o together... yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot... none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking for ld... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot  ) is GNU ld... yes
| checking for shared library run path origin... done
| checking 32-bit host C ABI... yes
| checking how to run the C preprocessor... i686-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for ELF binary format... yes
| checking for the common suffixes of directories in the library search path... lib,lib32,lib
| checking for CFPreferencesCopyAppValue... no
| checking for CFLocaleCopyPreferredLanguages... no
| checking for GNU gettext in libc... yes
| checking whether to use NLS... yes
| checking where the gettext function comes from... libc
| checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot accepts -g... (cached) yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot... (cached) none
| checking whether ln -s works... yes
| checking for a sed that does not truncate output... (cached) sed
| checking for i686-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.5-r0/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking for ALSA CFLAGS...
| checking for dlopen in -lc... no
| checking for dlopen in -ldl... yes
| checking for ALSA LDFLAGS...  -lasound -lm -ldl -lpthread
| checking required libasound headers version... 1.2.5
| checking for libasound headers version >= 1.2.5 (1.2.5)... not present.
| configure: error: Sufficiently new version of libasound not found.
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe alsa-utils-1.2.5-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2425 tasks of which 2418 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============7158082440084859376==--
