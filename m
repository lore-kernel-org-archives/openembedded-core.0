Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.39203.1605551303382546693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id D8F1D38C0556
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.16.8 FAILED
Message-ID: <MADEUP.164810676A77F2B3.25243@lists.openembedded.org>
X-Groupsio-MsgNum: 144627
Content-Type: multipart/mixed; boundary="===============8715941550636856201=="

--===============8715941550636856201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.16.8* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.16.7-9.16.8.patch
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

--===============8715941550636856201==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.16.7-9.16.8.patch"

From e542ddf64e47640476191d64567d4830684fca0b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 10:48:23 +0000
Subject: [PATCH] bind: upgrade 9.16.7 -> 9.16.8

---
 ...1-avoid-start-failure-with-bind-user.patch |  0
 ...d-V-and-start-log-hide-build-options.patch |  0
 ...ching-for-json-headers-searches-sysr.patch |  0
 .../bind/{bind-9.16.7 => bind-9.16.8}/bind9   |  0
 .../{bind-9.16.7 => bind-9.16.8}/conf.patch   |  0
 .../generate-rndc-key.sh                      |  0
 ...t.d-add-support-for-read-only-rootfs.patch |  0
 .../make-etc-initd-bind-stop-work.patch       |  0
 .../named.service                             |  0
 .../bind/{bind_9.16.7.bb => bind_9.16.8.bb}   | 26 +++++++++++++++++--
 10 files changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.8}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.8}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.8}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.8}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.8}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.8}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.8}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.8}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.8}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.7.bb => bind_9.16.8.bb} (83%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.8/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.8/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.8/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.8/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.8/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.8/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/bind9 b/meta/recipes-connectivity/bind/bind-9.16.8/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.8/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.8/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.8/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.8/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.8/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.8/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.8/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.8/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.8/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/named.service b/meta/recipes-connectivity/bind/bind-9.16.8/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.8/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.7.bb b/meta/recipes-connectivity/bind/bind_9.16.8.bb
similarity index 83%
rename from meta/recipes-connectivity/bind/bind_9.16.7.bb
rename to meta/recipes-connectivity/bind/bind_9.16.8.bb
index fbe3de63cb..b253aeccaf 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.7.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.8.bb
@@ -1,9 +1,31 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYRIGHT
+# +++ COPYRIGHT
+# @@ -2,7 +2,7 @@
+#  
+#  This Source Code Form is subject to the terms of the Mozilla Public
+#  License, v. 2.0. If a copy of the MPL was not distributed with this
+# -file, You can obtain one at http://mozilla.org/MPL/2.0/.
+# +file, you can obtain one at https://mozilla.org/MPL/2.0/.
+#  
+#   -----------------------------------------------------------------------------
+#  
+# 
+#
+
 SUMMARY = "ISC Internet Domain Name Server"
 HOMEPAGE = "https://www.isc.org/bind/"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=188b8d0644bd6835df43b84e3f180be1"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4673dc07337cace3b93c65e9ffe57b60"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -19,7 +41,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "9f7d1812ebbd26a699f62b6fa8522d5dec57e4bf43af0042a0d60d39ed8314d1"
+SRC_URI[sha256sum] = "9e9b9c563692be86ec41f670f6b70e26c14e72445c742d7b5eb4db7d2b5e8d31"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.20.1


--===============8715941550636856201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 790 .bb files complete (0 cached, 790 parsed). 1369 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 12 Found 5 Missed 7 Current 716 (41% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1621 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.8.bb:do_fetch)
NOTE: recipe bind-9.16.8-r0: task do_fetch: Started
NOTE: recipe bind-9.16.8-r0: task do_fetch: Succeeded
NOTE: Running task 2075 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.8.bb:do_unpack)
NOTE: Running task 2076 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bind-9.16.8-r0: task do_unpack: Started
NOTE: recipe bind-9.16.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bind-9.16.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bind-9.16.8-r0: task do_unpack: Succeeded
NOTE: Running task 2275 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.8.bb:do_patch)
NOTE: recipe bind-9.16.8-r0: task do_patch: Started
NOTE: recipe bind-9.16.8-r0: task do_patch: Succeeded
NOTE: Running task 2276 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2277 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.8.bb:do_populate_lic)
NOTE: recipe bind-9.16.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bind-9.16.8-r0: task do_populate_lic: Started
NOTE: recipe bind-9.16.8-r0: task do_populate_lic: Succeeded
NOTE: recipe bind-9.16.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2278 of 2286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.8.bb:do_configure)
NOTE: recipe bind-9.16.8-r0: task do_configure: Started
ERROR: bind-9.16.8-r0 do_configure: configure failed
ERROR: bind-9.16.8-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/temp/run.do_configure.28313' failed with exit code 1:
automake (GNU automake) 1.16.2
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.16
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/bind-9.16.8/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal/ --force 
autoreconf: configure.ac: tracing
autoreconf: running: libtoolize --copy --force
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/bind-9.16.8/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal/ --force
autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/bind-9.16.8/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal/ --force
autoreconf: configure.ac: not using Automake
autoreconf: running: gnu-configize
autoreconf: Leaving directory `.'
configure: WARNING: unrecognized options: --disable-silent-rules, --disable-dependency-tracking
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot/usr/share/i686-poky-linux_config_site.d/ncurses_config
checking whether to enable maintainer-specific portions of Makefiles... yes
checking build system type... x86_64-pc-linux-gnu
checking host system type... i686-poky-linux-gnu
checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot accepts -g... yes
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to accept ISO C89... none needed
checking how to run the C preprocessor... i686-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
checking for ANSI C header files... (cached) yes
checking for sys/types.h... (cached) yes
checking for sys/stat.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for memory.h... (cached) yes
checking for strings.h... (cached) yes
checking for inttypes.h... (cached) yes
checking for stdint.h... (cached) yes
checking for unistd.h... (cached) yes
checking minix/config.h usability... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... 64
checking for _LARGEFILE_SOURCE value needed for large files... no
checking whether make sets $(MAKE)... yes
checking how to print strings... printf
checking for a sed that does not truncate output... (cached) sed
checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot  
checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot  ) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-nm
checking the name lister (i686-poky-linux-nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot   option to reload object files... -r
checking for i686-poky-linux-objdump... i686-poky-linux-objdump
checking how to recognize dependent libraries... pass_all
checking for i686-poky-linux-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
checking for archiver @FILE support... @
checking for i686-poky-linux-strip... i686-poky-linux-strip
checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
checking for gawk... gawk
checking command to parse i686-poky-linux-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot object... ok
checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot
checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
checking for i686-poky-linux-mt... no
checking for mt... no
checking if : is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot static flag -static works... yes
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot supports -c -o file.o... yes
checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot supports -c -o file.o... (cached) yes
checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot  ) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
checking whether ln -s works... yes
checking for a POSIX-compatible shell... /bin/bash
checking for a thread-safe mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
checking for i686-poky-linux-pkg-config... no
checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/bin/pkg-config
configure: WARNING: using cross tools not prefixed with host triplet
checking pkg-config is at least version 0.9.0... yes
checking whether to enable fuzzing mode... no
checking whether to emulate atomics with mutexes... no
checking for ar... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/ar
checking for w3m... no
checking for pandoc... pandoc
checking for perl5... no
checking for perl... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/perl
checking for Python support... disabled
checking for pytest-3... no
checking for py.test-3... no
checking for pytest... no
checking for pytest-pypy... no
configure: WARNING: pytest not found, some system tests will be skipped
checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot
checking whether we are using the GNU C compiler... (cached) yes
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot accepts -g... (cached) yes
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to accept ISO C89... (cached) none needed
checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to accept ISO C99... none needed
checking for ANSI C header files... (cached) yes
checking for fcntl.h... yes
checking for regex.h... yes
checking for sys/time.h... yes
checking for unistd.h... (cached) yes
checking for sys/mman.h... yes
checking for sys/sockio.h... no
checking for sys/select.h... yes
checking for sys/param.h... yes
checking for sys/sysctl.h... no
checking for net/if6.h... no
checking for sys/socket.h... yes
checking for net/route.h... yes
checking for linux/netlink.h... yes
checking for linux/rtnetlink.h... yes
checking threads.h usability... yes
checking threads.h presence... yes
checking for threads.h... yes
checking for C11 Thread-Local Storage using thread_local... yes
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for working volatile... yes
checking for flexible array members... yes
checking for sysctlbyname... no
checking for mmap... yes
checking for seteuid... yes
checking for setresuid... (cached) yes
checking for setegid... yes
checking for setresgid... yes
checking for size_t... yes
checking for ssize_t... yes
checking for uintptr_t... yes
checking whether time.h and sys/time.h may both be included... yes
checking for uname... yes
checking for GCC noreturn attribute... yes
checking for kqueue... no
checking for epoll_create1... yes
checking whether byte ordering is bigendian... (cached) no
checking for libmaxminddb... no
checking for arc4random... no
checking for arc4random_buf... no
checking for arc4random_uniform... no
checking for getrandom... yes
checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot is Clang... no
checking whether pthreads work with -pthread... yes
checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE
checking whether more special flags are required for pthreads... no
checking for PTHREAD_PRIO_INHERIT... yes
checking for pthread_attr_getstacksize... yes
checking for pthread_attr_setstacksize... yes
checking for PTHREAD_MUTEX_ADAPTIVE_NP... using adaptive lock type
checking sched.h usability... yes
checking sched.h presence... yes
checking for sched.h... yes
checking for library containing sched_yield... none required
checking for sched_yield... yes
checking for pthread_yield... yes
checking for pthread_yield_np... no
checking sys/cpuset.h usability... no
checking sys/cpuset.h presence... no
checking for sys/cpuset.h... no
checking sys/procset.h usability... no
checking sys/procset.h presence... no
checking for sys/procset.h... no
checking for pthread_setaffinity_np... yes
checking for cpuset_setaffinity... no
checking for processor_bind... no
checking for sched_setaffinity... yes
checking for pthread_setname_np... yes
checking for pthread_set_name_np... no
checking for pthread_np.h... no
checking for libuv... checking for libuv >= 1.0.0... yes
checking for uv_handle_get_data... yes
checking for uv_handle_set_data... yes
checking for uv_import... no
checking for flockfile... yes
checking for getc_unlocked... yes
checking for sysconf... yes
checking for libtool... yes
checking for libcrypto... yes
checking for OpenSSL >= 1.0.0 or LibreSSL... yes
checking for CRYPTO_zalloc... yes
checking for EVP_CIPHER_CTX_new... yes
checking for EVP_CIPHER_CTX_free... yes
checking for EVP_MD_CTX_new... yes
checking for EVP_MD_CTX_free... yes
checking for EVP_MD_CTX_reset... yes
checking for HMAC_CTX_new... yes
checking for HMAC_CTX_free... yes
checking for HMAC_CTX_reset... yes
checking for HMAC_CTX_get_md... yes
checking for ECDSA_sign... yes
checking for ECDSA_verify... yes
checking for ECDSA P-256 support... yes
checking for ECDSA P-384 support... yes
checking for Ed25519 support... yes
checking for Ed448 support... yes
checking for EVP_sha1... yes
checking for EVP_sha224... yes
checking for EVP_sha256... yes
checking for EVP_sha384... yes
checking for EVP_sha512... yes
checking for EVP_aes_128_ecb... yes
checking for EVP_aes_192_ecb... yes
checking for EVP_aes_256_ecb... yes
checking for DH_get0_key... yes
checking for ECDSA_SIG_get0... yes
checking for RSA_set0_key... yes
checking whether to enable FIPS mode in OpenSSL library... no
checking for PKCS11 for Public-Key Cryptography... no
checking for clock_gettime... yes
checking for GSSAPI library... disabled
checking for lmdb library... no
checking for json-c >= 0.11... no
checking for zlib... yes
checking for smf_enable_instance in -lscf... no
checking whether C compiler accepts -fno-strict-aliasing... yes
checking whether C compiler accepts -Werror -fno-delete-null-pointer-checks... yes
checking whether to use purify... no
checking whether to use gperftools profiler... no
configure: WARNING: Internal symbol table does not work with libtool.  Disabling symbol table.
checking for IPv6 structures... yes
checking for strlcpy... no
checking for strlcat... no
configure: checking for readline with -lreadline
checking for readline... yes
checking readline/readline.h usability... yes
checking readline/readline.h presence... yes
checking for readline/readline.h... yes
checking readline/history.h usability... yes
checking readline/history.h presence... yes
checking for readline/history.h... yes
checking for chroot... yes
checking whether to enable Linux capabilities... yes
checking sys/capability.h usability... yes
checking sys/capability.h presence... yes
checking for sys/capability.h... yes
checking for library containing cap_set_proc... -lcap
checking sys/un.h usability... yes
checking sys/un.h presence... yes
checking for sys/un.h... yes
checking for tzset... yes
checking for optarg declaration... yes
checking for st_mtim.tv_nsec... checking for if_nametoindex... yes
checking for nanosleep... yes
checking for usleep... yes
checking for explicit_bzero... yes
checking stdatomic.h usability... yes
checking stdatomic.h presence... yes
checking for stdatomic.h... yes
checking for memory model aware atomic operations... stdatomic.h
checking whether -latomic is needed for 64-bit stdatomic.h functions... no
checking stdalign.h usability... yes
checking stdalign.h presence... yes
checking for stdalign.h... yes
checking uchar.h usability... yes
checking uchar.h presence... yes
checking for uchar.h... yes
checking compiler support for __builtin_unreachable()... yes
checking compiler support for __builtin_expect... yes
checking compiler support for __builtin_clz... yes
checking for sphinx-build... :
checking for xelatex... :
checking for latexmk... :
date: CHANGES: No such file or directory
checking for pdflatex... no
checking for latexmk... (cached) :
checking for doxygen... no
checking for curl... curl
checking for cmocka >= 1.0.0... no
checking for linker support for --wrap option... configure: error: in `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/build':
configure: error: cannot run test program while cross compiling
See `config.log' for more details
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/temp/log.do_configure.28313
Log data follows:
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libuv/libuv_1.40.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_po
 pulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.
 2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.69.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sh
 adow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libcap', 'update-rc.d', 'xz-native', 'libuv', 'base-files', 'shadow-native', 'pseudo-native', 'glibc', 'openssl', 'gnu-config-native', 'gcc-cross-i686', 'opkg-utils', 'readline', 'automake-native', 'libtool-native', 'gcc-runtime', 'pkgconfig-native', 'patch-native', 'quilt-native', 'libtool-cross', 'shadow', 'base-passwd', 'autoconf-native', 'shadow-sysroot', 'zlib', 'initscripts', 'gettext-minimal-native', 'linux-libc-headers', 'gmp-native', 'binutils-cross-i686', 'texinfo-dummy-native', 'zlib-native', 'flex-native', 'mpfr-native', 'libmpc-native', 'ncurses', 'libgcc', 'attr-native', 'libxcrypt', 'attr', 'm4-native']
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
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/bind-9.16.8/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/bind-9.16.8/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/bind-9.16.8/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/bind-9.16.8/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: not using Automake
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `.'
| NOTE: Running ../bind-9.16.8/configure  --build=x86_64-linux 		  --host=i686-poky-linux 		  --target=i686-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot  --with-libtool --disable-devpoll --disable-auto-validation --enable-epoll                  --with-gssapi=no --with-lmdb=no --with-zlib                  --sysconfdir=/etc/bind                  --with-openssl=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot/usr  
                --disable-static  --without-libxml2  --without-python --with-readline=-lreadline
| configure: WARNING: unrecognized options: --disable-silent-rules, --disable-dependency-tracking
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot/usr/share/i686-poky-linux_config_site.d/ncurses_config
| checking whether to enable maintainer-specific portions of Makefiles... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to accept ISO C89... none needed
| checking how to run the C preprocessor... i686-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for ANSI C header files... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for memory.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking minix/config.h usability... no
| checking minix/config.h presence... no
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking for special C compiler options needed for large files... no
| checking for _FILE_OFFSET_BITS value needed for large files... 64
| checking for _LARGEFILE_SOURCE value needed for large files... no
| checking whether make sets $(MAKE)... yes
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
| checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-nm
| checking the name lister (i686-poky-linux-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot   option to reload object files... -r
| checking for i686-poky-linux-objdump... i686-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for i686-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
| checking for gawk... gawk
| checking command to parse i686-poky-linux-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for i686-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot static flag -static works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot supports -c -o file.o... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot  ) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether ln -s works... yes
| checking for a POSIX-compatible shell... /bin/bash
| checking for a thread-safe mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for i686-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether to enable fuzzing mode... no
| checking whether to emulate atomics with mutexes... no
| checking for ar... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/ar
| checking for w3m... no
| checking for pandoc... pandoc
| checking for perl5... no
| checking for perl... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/perl
| checking for Python support... disabled
| checking for pytest-3... no
| checking for py.test-3... no
| checking for pytest... no
| checking for pytest-pypy... no
| configure: WARNING: pytest not found, some system tests will be skipped
| checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot
| checking whether we are using the GNU C compiler... (cached) yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot accepts -g... (cached) yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to accept ISO C89... (cached) none needed
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to accept ISO C99... none needed
| checking for ANSI C header files... (cached) yes
| checking for fcntl.h... yes
| checking for regex.h... yes
| checking for sys/time.h... yes
| checking for unistd.h... (cached) yes
| checking for sys/mman.h... yes
| checking for sys/sockio.h... no
| checking for sys/select.h... yes
| checking for sys/param.h... yes
| checking for sys/sysctl.h... no
| checking for net/if6.h... no
| checking for sys/socket.h... yes
| checking for net/route.h... yes
| checking for linux/netlink.h... yes
| checking for linux/rtnetlink.h... yes
| checking threads.h usability... yes
| checking threads.h presence... yes
| checking for threads.h... yes
| checking for C11 Thread-Local Storage using thread_local... yes
| checking for an ANSI C-conforming const... yes
| checking for inline... inline
| checking for working volatile... yes
| checking for flexible array members... yes
| checking for sysctlbyname... no
| checking for mmap... yes
| checking for seteuid... yes
| checking for setresuid... (cached) yes
| checking for setegid... yes
| checking for setresgid... yes
| checking for size_t... yes
| checking for ssize_t... yes
| checking for uintptr_t... yes
| checking whether time.h and sys/time.h may both be included... yes
| checking for uname... yes
| checking for GCC noreturn attribute... yes
| checking for kqueue... no
| checking for epoll_create1... yes
| checking whether byte ordering is bigendian... (cached) no
| checking for libmaxminddb... no
| checking for arc4random... no
| checking for arc4random_buf... no
| checking for arc4random_uniform... no
| checking for getrandom... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot is Clang... no
| checking whether pthreads work with -pthread... yes
| checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE
| checking whether more special flags are required for pthreads... no
| checking for PTHREAD_PRIO_INHERIT... yes
| checking for pthread_attr_getstacksize... yes
| checking for pthread_attr_setstacksize... yes
| checking for PTHREAD_MUTEX_ADAPTIVE_NP... using adaptive lock type
| checking sched.h usability... yes
| checking sched.h presence... yes
| checking for sched.h... yes
| checking for library containing sched_yield... none required
| checking for sched_yield... yes
| checking for pthread_yield... yes
| checking for pthread_yield_np... no
| checking sys/cpuset.h usability... no
| checking sys/cpuset.h presence... no
| checking for sys/cpuset.h... no
| checking sys/procset.h usability... no
| checking sys/procset.h presence... no
| checking for sys/procset.h... no
| checking for pthread_setaffinity_np... yes
| checking for cpuset_setaffinity... no
| checking for processor_bind... no
| checking for sched_setaffinity... yes
| checking for pthread_setname_np... yes
| checking for pthread_set_name_np... no
| checking for pthread_np.h... no
| checking for libuv... checking for libuv >= 1.0.0... yes
| checking for uv_handle_get_data... yes
| checking for uv_handle_set_data... yes
| checking for uv_import... no
| checking for flockfile... yes
| checking for getc_unlocked... yes
| checking for sysconf... yes
| checking for libtool... yes
| checking for libcrypto... yes
| checking for OpenSSL >= 1.0.0 or LibreSSL... yes
| checking for CRYPTO_zalloc... yes
| checking for EVP_CIPHER_CTX_new... yes
| checking for EVP_CIPHER_CTX_free... yes
| checking for EVP_MD_CTX_new... yes
| checking for EVP_MD_CTX_free... yes
| checking for EVP_MD_CTX_reset... yes
| checking for HMAC_CTX_new... yes
| checking for HMAC_CTX_free... yes
| checking for HMAC_CTX_reset... yes
| checking for HMAC_CTX_get_md... yes
| checking for ECDSA_sign... yes
| checking for ECDSA_verify... yes
| checking for ECDSA P-256 support... yes
| checking for ECDSA P-384 support... yes
| checking for Ed25519 support... yes
| checking for Ed448 support... yes
| checking for EVP_sha1... yes
| checking for EVP_sha224... yes
| checking for EVP_sha256... yes
| checking for EVP_sha384... yes
| checking for EVP_sha512... yes
| checking for EVP_aes_128_ecb... yes
| checking for EVP_aes_192_ecb... yes
| checking for EVP_aes_256_ecb... yes
| checking for DH_get0_key... yes
| checking for ECDSA_SIG_get0... yes
| checking for RSA_set0_key... yes
| checking whether to enable FIPS mode in OpenSSL library... no
| checking for PKCS11 for Public-Key Cryptography... no
| checking for clock_gettime... yes
| checking for GSSAPI library... disabled
| checking for lmdb library... no
| checking for json-c >= 0.11... no
| checking for zlib... yes
| checking for smf_enable_instance in -lscf... no
| checking whether C compiler accepts -fno-strict-aliasing... yes
| checking whether C compiler accepts -Werror -fno-delete-null-pointer-checks... yes
| checking whether to use purify... no
| checking whether to use gperftools profiler... no
| configure: WARNING: Internal symbol table does not work with libtool.  Disabling symbol table.
| checking for IPv6 structures... yes
| checking for strlcpy... no
| checking for strlcat... no
| configure: checking for readline with -lreadline
| checking for readline... yes
| checking readline/readline.h usability... yes
| checking readline/readline.h presence... yes
| checking for readline/readline.h... yes
| checking readline/history.h usability... yes
| checking readline/history.h presence... yes
| checking for readline/history.h... yes
| checking for chroot... yes
| checking whether to enable Linux capabilities... yes
| checking sys/capability.h usability... yes
| checking sys/capability.h presence... yes
| checking for sys/capability.h... yes
| checking for library containing cap_set_proc... -lcap
| checking sys/un.h usability... yes
| checking sys/un.h presence... yes
| checking for sys/un.h... yes
| checking for tzset... yes
| checking for optarg declaration... yes
| checking for st_mtim.tv_nsec... checking for if_nametoindex... yes
| checking for nanosleep... yes
| checking for usleep... yes
| checking for explicit_bzero... yes
| checking stdatomic.h usability... yes
| checking stdatomic.h presence... yes
| checking for stdatomic.h... yes
| checking for memory model aware atomic operations... stdatomic.h
| checking whether -latomic is needed for 64-bit stdatomic.h functions... no
| checking stdalign.h usability... yes
| checking stdalign.h presence... yes
| checking for stdalign.h... yes
| checking uchar.h usability... yes
| checking uchar.h presence... yes
| checking for uchar.h... yes
| checking compiler support for __builtin_unreachable()... yes
| checking compiler support for __builtin_expect... yes
| checking compiler support for __builtin_clz... yes
| checking for sphinx-build... :
| checking for xelatex... :
| checking for latexmk... :
| date: CHANGES: No such file or directory
| checking for pdflatex... no
| checking for latexmk... (cached) :
| checking for doxygen... no
| checking for curl... curl
| checking for cmocka >= 1.0.0... no
| checking for linker support for --wrap option... configure: error: in `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/build':
| configure: error: cannot run test program while cross compiling
| See `config.log' for more details
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/temp/run.do_configure.28313' failed with exit code 1:
| automake (GNU automake) 1.16.2
| Copyright (C) 2020 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/bind-9.16.8/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/bind-9.16.8/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/bind-9.16.8/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: not using Automake
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `.'
| configure: WARNING: unrecognized options: --disable-silent-rules, --disable-dependency-tracking
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot/usr/share/i686-poky-linux_config_site.d/ncurses_config
| checking whether to enable maintainer-specific portions of Makefiles... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to accept ISO C89... none needed
| checking how to run the C preprocessor... i686-poky-linux-gcc -E --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for ANSI C header files... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for memory.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking minix/config.h usability... no
| checking minix/config.h presence... no
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking for special C compiler options needed for large files... no
| checking for _FILE_OFFSET_BITS value needed for large files... 64
| checking for _LARGEFILE_SOURCE value needed for large files... no
| checking whether make sets $(MAKE)... yes
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
| checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-nm
| checking the name lister (i686-poky-linux-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot   option to reload object files... -r
| checking for i686-poky-linux-objdump... i686-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for i686-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
| checking for gawk... gawk
| checking command to parse i686-poky-linux-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for i686-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot static flag -static works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot supports -c -o file.o... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot  ) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether ln -s works... yes
| checking for a POSIX-compatible shell... /bin/bash
| checking for a thread-safe mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for i686-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether to enable fuzzing mode... no
| checking whether to emulate atomics with mutexes... no
| checking for ar... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/ar
| checking for w3m... no
| checking for pandoc... pandoc
| checking for perl5... no
| checking for perl... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/perl
| checking for Python support... disabled
| checking for pytest-3... no
| checking for py.test-3... no
| checking for pytest... no
| checking for pytest-pypy... no
| configure: WARNING: pytest not found, some system tests will be skipped
| checking for i686-poky-linux-gcc... (cached) i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot
| checking whether we are using the GNU C compiler... (cached) yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot accepts -g... (cached) yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to accept ISO C89... (cached) none needed
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot option to accept ISO C99... none needed
| checking for ANSI C header files... (cached) yes
| checking for fcntl.h... yes
| checking for regex.h... yes
| checking for sys/time.h... yes
| checking for unistd.h... (cached) yes
| checking for sys/mman.h... yes
| checking for sys/sockio.h... no
| checking for sys/select.h... yes
| checking for sys/param.h... yes
| checking for sys/sysctl.h... no
| checking for net/if6.h... no
| checking for sys/socket.h... yes
| checking for net/route.h... yes
| checking for linux/netlink.h... yes
| checking for linux/rtnetlink.h... yes
| checking threads.h usability... yes
| checking threads.h presence... yes
| checking for threads.h... yes
| checking for C11 Thread-Local Storage using thread_local... yes
| checking for an ANSI C-conforming const... yes
| checking for inline... inline
| checking for working volatile... yes
| checking for flexible array members... yes
| checking for sysctlbyname... no
| checking for mmap... yes
| checking for seteuid... yes
| checking for setresuid... (cached) yes
| checking for setegid... yes
| checking for setresgid... yes
| checking for size_t... yes
| checking for ssize_t... yes
| checking for uintptr_t... yes
| checking whether time.h and sys/time.h may both be included... yes
| checking for uname... yes
| checking for GCC noreturn attribute... yes
| checking for kqueue... no
| checking for epoll_create1... yes
| checking whether byte ordering is bigendian... (cached) no
| checking for libmaxminddb... no
| checking for arc4random... no
| checking for arc4random_buf... no
| checking for arc4random_uniform... no
| checking for getrandom... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/recipe-sysroot is Clang... no
| checking whether pthreads work with -pthread... yes
| checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE
| checking whether more special flags are required for pthreads... no
| checking for PTHREAD_PRIO_INHERIT... yes
| checking for pthread_attr_getstacksize... yes
| checking for pthread_attr_setstacksize... yes
| checking for PTHREAD_MUTEX_ADAPTIVE_NP... using adaptive lock type
| checking sched.h usability... yes
| checking sched.h presence... yes
| checking for sched.h... yes
| checking for library containing sched_yield... none required
| checking for sched_yield... yes
| checking for pthread_yield... yes
| checking for pthread_yield_np... no
| checking sys/cpuset.h usability... no
| checking sys/cpuset.h presence... no
| checking for sys/cpuset.h... no
| checking sys/procset.h usability... no
| checking sys/procset.h presence... no
| checking for sys/procset.h... no
| checking for pthread_setaffinity_np... yes
| checking for cpuset_setaffinity... no
| checking for processor_bind... no
| checking for sched_setaffinity... yes
| checking for pthread_setname_np... yes
| checking for pthread_set_name_np... no
| checking for pthread_np.h... no
| checking for libuv... checking for libuv >= 1.0.0... yes
| checking for uv_handle_get_data... yes
| checking for uv_handle_set_data... yes
| checking for uv_import... no
| checking for flockfile... yes
| checking for getc_unlocked... yes
| checking for sysconf... yes
| checking for libtool... yes
| checking for libcrypto... yes
| checking for OpenSSL >= 1.0.0 or LibreSSL... yes
| checking for CRYPTO_zalloc... yes
| checking for EVP_CIPHER_CTX_new... yes
| checking for EVP_CIPHER_CTX_free... yes
| checking for EVP_MD_CTX_new... yes
| checking for EVP_MD_CTX_free... yes
| checking for EVP_MD_CTX_reset... yes
| checking for HMAC_CTX_new... yes
| checking for HMAC_CTX_free... yes
| checking for HMAC_CTX_reset... yes
| checking for HMAC_CTX_get_md... yes
| checking for ECDSA_sign... yes
| checking for ECDSA_verify... yes
| checking for ECDSA P-256 support... yes
| checking for ECDSA P-384 support... yes
| checking for Ed25519 support... yes
| checking for Ed448 support... yes
| checking for EVP_sha1... yes
| checking for EVP_sha224... yes
| checking for EVP_sha256... yes
| checking for EVP_sha384... yes
| checking for EVP_sha512... yes
| checking for EVP_aes_128_ecb... yes
| checking for EVP_aes_192_ecb... yes
| checking for EVP_aes_256_ecb... yes
| checking for DH_get0_key... yes
| checking for ECDSA_SIG_get0... yes
| checking for RSA_set0_key... yes
| checking whether to enable FIPS mode in OpenSSL library... no
| checking for PKCS11 for Public-Key Cryptography... no
| checking for clock_gettime... yes
| checking for GSSAPI library... disabled
| checking for lmdb library... no
| checking for json-c >= 0.11... no
| checking for zlib... yes
| checking for smf_enable_instance in -lscf... no
| checking whether C compiler accepts -fno-strict-aliasing... yes
| checking whether C compiler accepts -Werror -fno-delete-null-pointer-checks... yes
| checking whether to use purify... no
| checking whether to use gperftools profiler... no
| configure: WARNING: Internal symbol table does not work with libtool.  Disabling symbol table.
| checking for IPv6 structures... yes
| checking for strlcpy... no
| checking for strlcat... no
| configure: checking for readline with -lreadline
| checking for readline... yes
| checking readline/readline.h usability... yes
| checking readline/readline.h presence... yes
| checking for readline/readline.h... yes
| checking readline/history.h usability... yes
| checking readline/history.h presence... yes
| checking for readline/history.h... yes
| checking for chroot... yes
| checking whether to enable Linux capabilities... yes
| checking sys/capability.h usability... yes
| checking sys/capability.h presence... yes
| checking for sys/capability.h... yes
| checking for library containing cap_set_proc... -lcap
| checking sys/un.h usability... yes
| checking sys/un.h presence... yes
| checking for sys/un.h... yes
| checking for tzset... yes
| checking for optarg declaration... yes
| checking for st_mtim.tv_nsec... checking for if_nametoindex... yes
| checking for nanosleep... yes
| checking for usleep... yes
| checking for explicit_bzero... yes
| checking stdatomic.h usability... yes
| checking stdatomic.h presence... yes
| checking for stdatomic.h... yes
| checking for memory model aware atomic operations... stdatomic.h
| checking whether -latomic is needed for 64-bit stdatomic.h functions... no
| checking stdalign.h usability... yes
| checking stdalign.h presence... yes
| checking for stdalign.h... yes
| checking uchar.h usability... yes
| checking uchar.h presence... yes
| checking for uchar.h... yes
| checking compiler support for __builtin_unreachable()... yes
| checking compiler support for __builtin_expect... yes
| checking compiler support for __builtin_clz... yes
| checking for sphinx-build... :
| checking for xelatex... :
| checking for latexmk... :
| date: CHANGES: No such file or directory
| checking for pdflatex... no
| checking for latexmk... (cached) :
| checking for doxygen... no
| checking for curl... curl
| checking for cmocka >= 1.0.0... no
| checking for linker support for --wrap option... configure: error: in `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.8-r0/build':
| configure: error: cannot run test program while cross compiling
| See `config.log' for more details
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe bind-9.16.8-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.8.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2278 tasks of which 2271 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.8.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============8715941550636856201==--
