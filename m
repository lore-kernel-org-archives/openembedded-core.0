Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C2FD10DA8
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.149799.1733047556386908493
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NJOBAftE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YXKlnXLn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019381af1649-0af4c086-d88a-4511-a5be-b5d4ccd7a305-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1JFpSt70q4DbRyvM889JDXlOyMqWhcPYRMG2ywEc/tA=;
	b=NJOBAftE8nZ2ZhJFZkPSziIVv5qLAtlrCC2da6NDoq4pGkXiyoDdipblnagQJxXV
	7AoLeywCk1wa44lsrCeXtZgnU2tUqBkQ770X00+c35mJPbk+nQEp+7QZHy425cNDHiw
	1/R/BMxEMw/m3PbQ1ptOqQAELU/bnaavyAJh+pN4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1JFpSt70q4DbRyvM889JDXlOyMqWhcPYRMG2ywEc/tA=;
	b=YXKlnXLnXnQHsO8UtkgS30zNpTYY8Vkd+qkZ/lhf0Sq7vtANQPABm6rm8QHbvTVc
	atBhDe/mvti+hgC5OjNQur6qPh6GvTHJ7QSgOaOBUfZMb8MXb4o0bm4irP0X54MRpYj
	j83xMmTJCd+d4iXVEfuAFyH6rSxa51ObqeNMRYaQ=
Content-Type: multipart/mixed; boundary="===============3838003495827536912=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debugedit: upgrading to 5.1 FAILED
Message-ID: <0101019381af1649-0af4c086-d88a-4511-a5be-b5d4ccd7a305-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208063

--===============3838003495827536912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debugedit* to *5.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-debugedit-upgrade-5.0-5.1.patch
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

-- >8 --
From 9610623424eb41beca7e966a61abac2739d3f49a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 06:50:29 +0000
Subject: [PATCH] debugedit: upgrade 5.0 -> 5.1

---
 .../{debugedit_5.0.bb => debugedit_5.1.bb}          |  6 ++++--
 .../0003-Makefile.am-do-not-update-manual.patch     | 13 +++++--------
 2 files changed, 9 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/debugedit/{debugedit_5.0.bb => debugedit_5.1.bb} (85%)

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
similarity index 85%
rename from meta/recipes-devtools/debugedit/debugedit_5.0.bb
rename to meta/recipes-devtools/debugedit/debugedit_5.1.bb
index 63ad7babd9..43098a1667 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.0.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
@@ -9,14 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz"
+SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz \
+           file://0003-Makefile.am-do-not-update-manual.patch \
+           "
 
 SRC_URI:append:libc-musl = "\
            file://0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch \
            file://0003-Makefile.am-do-not-update-manual.patch \
            "
 
-SRC_URI[sha256sum] = "e9ecd7d350bebae1f178ce6776ca19a648b6fe8fa22f5b3044b38d7899aa553e"
+SRC_URI[sha256sum] = "ee9b688b2ed8fa62551c54cb5dc31aaa05853e7dedbd9e1237c77894ea5e3626"
 
 DEPENDS = "elfutils"
 DEPENDS:append:libc-musl = " musl-legacy-error"
diff --git a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
index de467f5365..9b4a7bd200 100644
--- a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
+++ b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
@@ -1,7 +1,7 @@
-From 4f0d7d2f4900ce8555e09854dc681278b7a3d9a9 Mon Sep 17 00:00:00 2001
+From 23f5c12c62a980d6e516c82a561bc7b0e795b7ab Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 23 Mar 2023 13:09:23 +0800
-Subject: [PATCH 3/3] Makefile.am: do not update manual
+Subject: [PATCH] Makefile.am: do not update manual
 
 The tarball ships these manuals, no need to re-generate them.
 We have local patches for debugedit.c and sepdebugcrcfix.c,
@@ -20,7 +20,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 30 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 98b2f20..f91deea 100644
+index c590edf..692e016 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -52,36 +52,6 @@ sepdebugcrcfix_LDADD = @LIBELF_LIBS@
@@ -58,8 +58,5 @@ index 98b2f20..f91deea 100644
 -	esac
 -
  noinst_HEADERS= tools/ansidecl.h \
- 		tools/hashtab.h \
- 		tools/md5.h \
--- 
-2.17.1
-
+ 		tools/hashtab.h
+ 
-- 
2.44.1


--===============3838003495827536912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1877 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3810080e5fd41eb835b85dada06c8c9fc06a6d1b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 277 Local 266 Mirrors 0 Missed 11 Current 337 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 614 of 614 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_recipe_qa_setscene)
NOTE: recipe debugedit-5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe debugedit-5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1694 of 1713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_fetch)
NOTE: recipe debugedit-5.1-r0: task do_fetch: Started
NOTE: recipe debugedit-5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1695 of 1713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_unpack)
NOTE: Running task 1696 of 1713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe debugedit-5.1-r0: task do_unpack: Started
NOTE: recipe debugedit-5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe debugedit-5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1697 of 1713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_patch)
NOTE: Running task 1698 of 1713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_collect_spdx_deps)
NOTE: recipe debugedit-5.1-r0: task do_patch: Started
NOTE: recipe debugedit-5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe debugedit-5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe debugedit-5.1-r0: task do_patch: Succeeded
NOTE: Running task 1699 of 1713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1700 of 1713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_populate_lic)
NOTE: recipe debugedit-5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.1-r0: task do_populate_lic: Started
NOTE: recipe debugedit-5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe debugedit-5.1-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_deploy_source_date_epoch unihash changed to 3092e2ec9564e2a4231cd88ce82d53d244e597a1e8d1d626ed0f6a73d21c4bbb
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_populate_lic unihash changed to 5adcdf7539759fde6091bc4cbe25963f8fb3125769f742d30d24dc810180c0fa
NOTE: Setscene tasks completed
NOTE: Running task 1701 of 1713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_configure)
NOTE: recipe debugedit-5.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/auto
 make/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'zlib', 'binutils-cross-x86_64', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'linux-libc-headers', 'acl', 'attr', 'curl', 'gmp', 'gnutls', 'libtasn1', 'libcap', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libseccomp', 'libunistring', 'nettle', 'sqlite3', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.17
| Features: subsecond-mtime
| 
| Copyright (C) 2024 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
|   <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/debugedit-5.1/tests/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot/usr/share/aclocal/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/debugedit-5.1/tests/ -I /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/bin/autoconf --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/debugedit-5.1/tests/ --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/bin/autoheader --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/debugedit-5.1/tests/ --include=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../debugedit-5.1/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking  --disable-static
| configure: WARNING: unrecognized options: --disable-static
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether sleep supports fractional seconds... yes
| checking filesystem timestamp resolution... 0.01
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking xargs -n works... yes
| checking how to create a pax tar archive... gnutar
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot... none
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
| checking for sys/param.h... yes
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for gawk... (cached) gawk
| checking for a sed that does not truncate output... (cached) sed
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot... (cached) none
| checking whether ln -s works... yes
| checking for x86_64-poky-linux-ld... x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot
| checking for x86_64-poky-linux-readelf... x86_64-poky-linux-readelf
| checking for dwz... no
| configure: WARNING: dwz not installed
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot option to enable large file support... none needed
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking for libelf... yes
| checking for libdw... yes
| checking for libxxhash >= 0.8.0... no
| configure: error: Package requirements (libxxhash >= 0.8.0) were not met:
| 
| No package 'libxxhash' found
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables XXHASH_CFLAGS
| and XXHASH_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.483215:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.483215, line 285
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.483215, line 261
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.483215, line 231
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.483215, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.483215, line 289
NOTE: recipe debugedit-5.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1701 tasks of which 1693 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201065013.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201065013.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/log.do_configure.483215
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: debugedit-5.1-r0 do_configure: configure failed
ERROR: debugedit-5.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/run.do_configure.483215' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/debugedit/5.1/temp/log.do_configure.483215
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.1.bb:do_configure) failed with exit code '1'

--===============3838003495827536912==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debugedit-upgrade-5.0-5.1.patch"

RnJvbSA5NjEwNjIzNDI0ZWI0MWJlY2E3ZTk2NmE2MWFiYWMyNzM5ZDNmNDlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNjo1MDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRl
YnVnZWRpdDogdXBncmFkZSA1LjAgLT4gNS4xCgotLS0KIC4uLi97ZGVidWdlZGl0XzUuMC5iYiA9
PiBkZWJ1Z2VkaXRfNS4xLmJifSAgICAgICAgICB8ICA2ICsrKystLQogLi4uLzAwMDMtTWFrZWZp
bGUuYW0tZG8tbm90LXVwZGF0ZS1tYW51YWwucGF0Y2ggICAgIHwgMTMgKysrKystLS0tLS0tLQog
MiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kZWJ1Z2VkaXQve2RlYnVnZWRpdF81LjAuYmIgPT4gZGVi
dWdlZGl0XzUuMS5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZGVidWdlZGl0L2RlYnVnZWRpdF81LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdl
ZGl0L2RlYnVnZWRpdF81LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVnZWRpdC9kZWJ1Z2VkaXRfNS4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2RlYnVnZWRpdF81LjEuYmIKaW5kZXggNjNh
ZDdiYWJkOS4uNDMwOThhMTY2NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rl
YnVnZWRpdC9kZWJ1Z2VkaXRfNS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZWJ1
Z2VkaXQvZGVidWdlZGl0XzUuMS5iYgpAQCAtOSwxNCArOSwxNiBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT01OTUzMGJkZjMzNjU5YjI5ZTczZDRhZGI5ZjlmNjU1MiBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9MmQ1MDI1ZDRhYTM0
OTViZWZlZjhmMTcyMDZhNWIwYTEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlO
RzM7bWQ1PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgwZDQ3ZmFlNTA0IgogCi1TUkNfVVJJID0gImh0
dHBzOi8vc291cmNld2FyZS5vcmcvZnRwL2RlYnVnZWRpdC8ke1BWfS9kZWJ1Z2VkaXQtJHtQVn0u
dGFyLnh6IgorU1JDX1VSSSA9ICJodHRwczovL3NvdXJjZXdhcmUub3JnL2Z0cC9kZWJ1Z2VkaXQv
JHtQVn0vZGVidWdlZGl0LSR7UFZ9LnRhci54eiBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAzLU1h
a2VmaWxlLmFtLWRvLW5vdC11cGRhdGUtbWFudWFsLnBhdGNoIFwKKyAgICAgICAgICAgIgogCiBT
UkNfVVJJOmFwcGVuZDpsaWJjLW11c2wgPSAiXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1zZXBk
ZWJ1Z2NyY2ZpeC5jLWRvLW5vdC11c2UtNjRiaXQtdmFyaWFudHMucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMy1NYWtlZmlsZS5hbS1kby1ub3QtdXBkYXRlLW1hbnVhbC5wYXRjaCBcCiAg
ICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU5ZWNkN2QzNTBiZWJhZTFmMTc4
Y2U2Nzc2Y2ExOWE2NDhiNmZlOGZhMjJmNWIzMDQ0YjM4ZDc4OTlhYTU1M2UiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZWU5YjY4OGIyZWQ4ZmE2MjU1MWM1NGNiNWRjMzFhYWEwNTg1M2U3ZGVkYmQ5
ZTEyMzdjNzc4OTRlYTVlMzYyNiIKIAogREVQRU5EUyA9ICJlbGZ1dGlscyIKIERFUEVORFM6YXBw
ZW5kOmxpYmMtbXVzbCA9ICIgbXVzbC1sZWdhY3ktZXJyb3IiCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2ZpbGVzLzAwMDMtTWFrZWZpbGUuYW0tZG8tbm90LXVw
ZGF0ZS1tYW51YWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVidWdlZGl0L2ZpbGVz
LzAwMDMtTWFrZWZpbGUuYW0tZG8tbm90LXVwZGF0ZS1tYW51YWwucGF0Y2gKaW5kZXggZGU0Njdm
NTM2NS4uOWI0YTdiZDIwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RlYnVn
ZWRpdC9maWxlcy8wMDAzLU1ha2VmaWxlLmFtLWRvLW5vdC11cGRhdGUtbWFudWFsLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZWJ1Z2VkaXQvZmlsZXMvMDAwMy1NYWtlZmlsZS5h
bS1kby1ub3QtdXBkYXRlLW1hbnVhbC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNGYwZDdk
MmY0OTAwY2U4NTU1ZTA5ODU0ZGM2ODEyNzhiN2EzZDlhOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMjNmNWMxMmM2MmE5ODBkNmU1MTZjODJhNTYxYmM3YjBlNzk1YjdhYiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4K
IERhdGU6IFRodSwgMjMgTWFyIDIwMjMgMTM6MDk6MjMgKzA4MDAKLVN1YmplY3Q6IFtQQVRDSCAz
LzNdIE1ha2VmaWxlLmFtOiBkbyBub3QgdXBkYXRlIG1hbnVhbAorU3ViamVjdDogW1BBVENIXSBN
YWtlZmlsZS5hbTogZG8gbm90IHVwZGF0ZSBtYW51YWwKIAogVGhlIHRhcmJhbGwgc2hpcHMgdGhl
c2UgbWFudWFscywgbm8gbmVlZCB0byByZS1nZW5lcmF0ZSB0aGVtLgogV2UgaGF2ZSBsb2NhbCBw
YXRjaGVzIGZvciBkZWJ1Z2VkaXQuYyBhbmQgc2VwZGVidWdjcmNmaXguYywKQEAgLTIwLDcgKzIw
LDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAzMCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFt
IGIvTWFrZWZpbGUuYW0KLWluZGV4IDk4YjJmMjAuLmY5MWRlZWEgMTAwNjQ0CitpbmRleCBjNTkw
ZWRmLi42OTJlMDE2IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuYW0KICsrKyBiL01ha2VmaWxlLmFt
CiBAQCAtNTIsMzYgKzUyLDYgQEAgc2VwZGVidWdjcmNmaXhfTERBREQgPSBATElCRUxGX0xJQlNA
CkBAIC01OCw4ICs1OCw1IEBAIGluZGV4IDk4YjJmMjAuLmY5MWRlZWEgMTAwNjQ0CiAtCWVzYWMK
IC0KICBub2luc3RfSEVBREVSUz0gdG9vbHMvYW5zaWRlY2wuaCBcCi0gCQl0b29scy9oYXNodGFi
LmggXAotIAkJdG9vbHMvbWQ1LmggXAotLS0gCi0yLjE3LjEKLQorIAkJdG9vbHMvaGFzaHRhYi5o
CisgCi0tIAoyLjQ0LjEKCg==

--===============3838003495827536912==--

