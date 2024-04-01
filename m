Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47AECD129C
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:26 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2024.1711994603663882972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PB9rX2QN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eyq8I9tM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e9ad4863c-4142d51c-12d8-415f-bccc-560cbc45e13b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NHkAe5YB4IsbWdFaiZTlSFYgyz0Y37jjF0ZWi0zqrSU=;
	b=PB9rX2QNqo6hmriUUI7TzBG3Dmns4KXYpU+9u0o2+3GMtnk0jNTE7OMhRQzyjUWF
	qI9JeriXEqEmPjN/HWAkJkxYYD92LZxEHsTvTmUvQfo/UhEnZQR9mxu9s17fd3kQFOp
	QBhP1YfHIbxnAtG76UFJMaF4QgIZ43Bwrofni/AE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NHkAe5YB4IsbWdFaiZTlSFYgyz0Y37jjF0ZWi0zqrSU=;
	b=eyq8I9tMGSRoEcluLtpwmZrccYMlKwI4LIeLvrQ4GmGN/0E1LkoJcIOPcxAfpNh6
	BquDDEdQoYUQGy7BL6AIJQ+h1SMsbLn218kPrLc+bQYYX6xOtw+YhROFfA0k7EbFgAQ
	YmYeT2SIn4b2vAgYnXJyjiCLiWyXpiRDIy5Ln67U=
Content-Type: multipart/mixed; boundary="===============1651753674622099403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmod: upgrading to 32 FAILED
Message-ID: <0101018e9ad4863c-4142d51c-12d8-415f-bccc-560cbc45e13b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197810

--===============1651753674622099403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmod* to *32* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-kmod-upgrade-31-32.patch
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
From d401ad786dc17c18895ca6362636ba10892749e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 15:11:48 +0000
Subject: [PATCH] kmod: upgrade 31 -> 32

---
 ...Use-portable-implementation-for-basename-API.patch | 11 ++++-------
 .../kmod/kmod/avoid_parallel_tests.patch              | 10 ++++------
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch         |  9 +++------
 meta/recipes-kernel/kmod/{kmod_31.bb => kmod_32.bb}   |  2 +-
 4 files changed, 12 insertions(+), 20 deletions(-)
 rename meta/recipes-kernel/kmod/{kmod_31.bb => kmod_32.bb} (98%)

diff --git a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
index 6a7f9ded4f..c1917aef91 100644
--- a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
+++ b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
@@ -1,4 +1,4 @@
-From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
+From 0fb735f84ccfdbb80a2602fb39c11854262cc21f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 9 Dec 2023 17:35:59 -0800
 Subject: [PATCH] Use portable implementation for basename API
@@ -110,10 +110,10 @@ index 43fc354..cfb15b1 100644
  		dirlen -= namelen + 1;
  	}
 diff --git a/tools/kmod.c b/tools/kmod.c
-index 55689c0..df91e5c 100644
+index 1015575..57f59ca 100644
 --- a/tools/kmod.c
 +++ b/tools/kmod.c
-@@ -68,7 +68,7 @@ static int kmod_help(int argc, char *argv[])
+@@ -63,7 +63,7 @@ static int kmod_help(int argc, char *argv[])
  			"Options:\n"
  			"\t-V, --version     show version\n"
  			"\t-h, --help        show this help\n\n"
@@ -122,7 +122,7 @@ index 55689c0..df91e5c 100644
  
  	for (i = 0; i < ARRAY_SIZE(kmod_cmds); i++) {
  		if (kmod_cmds[i]->help != NULL) {
-@@ -156,7 +156,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
+@@ -151,7 +151,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
  	const char *cmd;
  	size_t i;
  
@@ -131,6 +131,3 @@ index 55689c0..df91e5c 100644
  
  	for (i = 0; i < ARRAY_SIZE(kmod_compat_cmds); i++) {
  		if (streq(kmod_compat_cmds[i]->name, cmd))
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
index 04a8204815..8474916bbc 100644
--- a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
+++ b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From be6f82c54f694617c646ca1f8b5bcf93694e20ad Mon Sep 17 00:00:00 2001
+From 5341cf464e8994e6bb411851d5db420c9b037c58 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Fri, 6 Sep 2013 21:11:57 +0000
 Subject: [PATCH] kmod: avoid parallel-tests
@@ -11,16 +11,15 @@ serial-tests is now required
 
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Inappropriate (disable feature incompatible with ptest)
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index ee72283..60980c0 100644
+index b651b5f..491be1b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -14,8 +14,8 @@ AC_USE_SYSTEM_EXTENSIONS
+@@ -14,7 +14,7 @@ AC_USE_SYSTEM_EXTENSIONS
  AC_SYS_LARGEFILE
  AC_PREFIX_DEFAULT([/usr])
  AM_MAINTAINER_MODE([enable])
@@ -28,5 +27,4 @@ index ee72283..60980c0 100644
 +AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules tar-pax no-dist-gzip dist-xz subdir-objects color-tests serial-tests])
  AM_SILENT_RULES([yes])
  LT_INIT([disable-static pic-only])
-
- AS_IF([test "x$enable_static" = "xyes"], [AC_MSG_ERROR([--enable-static is not supported by kmod])])
+ 
diff --git a/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch b/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
index a34ea466e8..6f468cc2d3 100644
--- a/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
+++ b/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
@@ -1,4 +1,4 @@
-From dd59095f70f774f6d1e767010e25b35ef6db4c4b Mon Sep 17 00:00:00 2001
+From 337835885f8f5ff9ef0e363d29c00f8d32d1f6bf Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 8 Dec 2023 22:35:45 +0000
 Subject: [PATCH] configure: set docdir in GTK_DOC_CHECK
@@ -16,10 +16,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index de01e08..67696c4 100644
+index 491be1b..034878b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -255,7 +255,7 @@ AS_IF([test "x$enable_coverage" = "xyes"], [
+@@ -227,7 +227,7 @@ AS_IF([test "x$enable_coverage" = "xyes"], [
  AM_CONDITIONAL([ENABLE_COVERAGE], [test "x$enable_coverage" = "xyes"])
  
  m4_ifdef([GTK_DOC_CHECK], [
@@ -28,6 +28,3 @@ index de01e08..67696c4 100644
  ], [
  AM_CONDITIONAL([ENABLE_GTK_DOC], false)])
  
--- 
-2.34.1
-
diff --git a/meta/recipes-kernel/kmod/kmod_31.bb b/meta/recipes-kernel/kmod/kmod_32.bb
similarity index 98%
rename from meta/recipes-kernel/kmod/kmod_31.bb
rename to meta/recipes-kernel/kmod/kmod_32.bb
index 6ae83a7c66..3aa7308a3b 100644
--- a/meta/recipes-kernel/kmod/kmod_31.bb
+++ b/meta/recipes-kernel/kmod/kmod_32.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools bash-completion gtk-doc pkgconfig manpages update-alternatives
 
-SRCREV = "aff617ea871d0568cc491bd116c0be1e857463bb"
+SRCREV = "41faa59711742c1476d59985011ee0f27ed91d30"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master;protocol=https \
            file://depmod-search.conf \
-- 
2.42.0


--===============1651753674622099403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1874 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-1c5e21d0394164a2cefc05ea477a0bf122a1543c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1c5e21d0394164a2cefc05ea477a0bf122a1543c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 132 Local 120 Mirrors 0 Missed 12 Current 226 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 242 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 243 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 244 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 255 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_create_spdx_setscene)
NOTE: Running task 676 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 320 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 322 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 326 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe kmod-32-r0: task do_recipe_qa: Succeeded
NOTE: Running task 761 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 327 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 331 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 766 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 335 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe kmod-32-r0: task do_unpack: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 342 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 344 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_unpack: Succeeded
NOTE: Running task 873 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_patch)
NOTE: recipe kmod-32-r0: task do_patch: Started
NOTE: recipe kmod-32-r0: task do_patch: Succeeded
NOTE: Running task 880 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_deploy_source_date_epoch)
NOTE: Running task 881 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_lic)
NOTE: recipe kmod-32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-32-r0: task do_populate_lic: Started
NOTE: recipe kmod-32-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_lic unihash changed to 3c259ad52471f7a1a86cb2de951c8b5bc6cf0c67c7250b0e883491c57d4c52d6
NOTE: recipe kmod-32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_deploy_source_date_epoch unihash changed to 974d721d360b47e0f698e73d996a925f005d8b3f970039b4fd7d49d4bcecd326
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 356 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1009 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1031 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_collect_spdx_deps)
NOTE: recipe kmod-32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-32-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1035 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_configure)
NOTE: recipe kmod-32-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmod-32-r0: task do_configure: Started
NOTE: recipe kmod-32-r0: task do_configure: Succeeded
NOTE: Running task 1036 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_compile)
NOTE: recipe kmod-32-r0: task do_compile: Started
NOTE: recipe kmod-32-r0: task do_compile: Succeeded
NOTE: Running task 1037 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_install)
NOTE: recipe kmod-32-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_p
 opulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot', 'virtual:nat
 ive:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'gettext-minimal-native', 'glibc', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'texinfo-dummy-native', 'xz', 'linux-libc-headers', 'bash-completion', 'openssl-native', 'expat-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'xz-native', 'zstd-native', 'gtk-doc-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 DESTDIR=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image install
| Making install in .
|  /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib'
|  /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/share/bash-completion/completions'
|  /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/include'
|  /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib/pkgconfig'
|  /bin/bash ./libtool   --mode=install /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c   libkmod/libkmod.la '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib'
|  /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/libkmod/libkmod.h '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/include'
|  /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/shell-completion/bash/kmod '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/share/bash-completion/completions'
|  /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 libkmod/libkmod.pc tools/kmod.pc '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib/pkgconfig'
| libtool: install: /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c libkmod/.libs/libkmod.so.2.4.2 /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib/libkmod.so.2.4.2
| libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib && { ln -s -f libkmod.so.2.4.2 libkmod.so.2 || { rm -f libkmod.so.2 && ln -s libkmod.so.2.4.2 libkmod.so.2; }; })
| libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib && { ln -s -f libkmod.so.2.4.2 libkmod.so || { rm -f libkmod.so && ln -s libkmod.so.2.4.2 libkmod.so; }; })
| libtool: install: /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c libkmod/.libs/libkmod.lai /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib/libkmod.la
| libtool: warning: remember to run 'libtool --finish /usr/lib'
|  /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/bin'
|   /bin/bash ./libtool   --mode=install /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/kmod '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/bin'
| libtool: install: /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c tools/kmod /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/bin/kmod
| make --no-print-directory install-exec-hook
| if test "/usr/lib" != "/usr/lib"; then \
| 	/home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib && \
| 	so_img_name=$(readlink /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib/libkmod.so) && \
| 	so_img_rel_target_prefix=$(echo /usr/lib | sed 's,\(^/\|\)[^/][^/]*,..,g') && \
| 	ln -sf $so_img_rel_target_prefix/usr/lib/$so_img_name /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib/libkmod.so && \
| 	mv /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib/libkmod.so.* /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/lib; \
| fi
| for tool in insmod lsmod rmmod depmod modprobe modinfo; do \
| 	ln -s kmod /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/bin/$tool; \
| done
| Making install in libkmod/docs
| make[2]: Nothing to be done for 'install-exec-am'.
| make[2]: Nothing to be done for 'install-data-am'.
| ln: failed to create symbolic link '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/bin/lsmod': File exists
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/temp/run.do_install.2064403:166 exit 1 from 'ln -rs /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/bin/kmod /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/bin/lsmod'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/temp/run.do_install.2064403, line 166
| 	#2: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/temp/run.do_install.2064403, line 228
NOTE: recipe kmod-32-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1037 tasks of which 1026 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401151112.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401151112.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: kmod-32-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/temp/run.do_install.2064403', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/temp/log.do_install.2064403
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_install) failed with exit code '1'

--===============1651753674622099403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kmod-upgrade-31-32.patch"

RnJvbSBkNDAxYWQ3ODZkYzE3YzE4ODk1Y2E2MzYyNjM2YmExMDg5Mjc0OWUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNToxMTo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtt
b2Q6IHVwZ3JhZGUgMzEgLT4gMzIKCi0tLQogLi4uVXNlLXBvcnRhYmxlLWltcGxlbWVudGF0aW9u
LWZvci1iYXNlbmFtZS1BUEkucGF0Y2ggfCAxMSArKysrLS0tLS0tLQogLi4uL2ttb2Qva21vZC9h
dm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCAgICAgICAgICAgICAgfCAxMCArKysrLS0tLS0tCiBt
ZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qva21vZC9ndGtkb2NkaXIucGF0Y2ggICAgICAgICB8ICA5
ICsrKy0tLS0tLQogbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL3trbW9kXzMxLmJiID0+IGttb2Rf
MzIuYmJ9ICAgfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyMCBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qve2ttb2RfMzEuYmIg
PT4ga21vZF8zMi5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tt
b2Qva21vZC8wMDAxLVVzZS1wb3J0YWJsZS1pbXBsZW1lbnRhdGlvbi1mb3ItYmFzZW5hbWUtQVBJ
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2ttb2QvMDAwMS1Vc2UtcG9ydGFibGUt
aW1wbGVtZW50YXRpb24tZm9yLWJhc2VuYW1lLUFQSS5wYXRjaAppbmRleCA2YTdmOWRlZDRmLi5j
MTkxN2FlZjkxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qva21vZC8wMDAx
LVVzZS1wb3J0YWJsZS1pbXBsZW1lbnRhdGlvbi1mb3ItYmFzZW5hbWUtQVBJLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kLzAwMDEtVXNlLXBvcnRhYmxlLWltcGxlbWVu
dGF0aW9uLWZvci1iYXNlbmFtZS1BUEkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDcyMWVk
NjA0MGM3YWE0NzA3MGZhZjYzNzhjNDMzMDg5ZTE3OGJkNDMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDBmYjczNWY4NGNjZmRiYjgwYTI2MDJmYjM5YzExODU0MjYyY2MyMWYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgog
RGF0ZTogU2F0LCA5IERlYyAyMDIzIDE3OjM1OjU5IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFVz
ZSBwb3J0YWJsZSBpbXBsZW1lbnRhdGlvbiBmb3IgYmFzZW5hbWUgQVBJCkBAIC0xMTAsMTAgKzEx
MCwxMCBAQCBpbmRleCA0M2ZjMzU0Li5jZmIxNWIxIDEwMDY0NAogIAkJZGlybGVuIC09IG5hbWVs
ZW4gKyAxOwogIAl9CiBkaWZmIC0tZ2l0IGEvdG9vbHMva21vZC5jIGIvdG9vbHMva21vZC5jCi1p
bmRleCA1NTY4OWMwLi5kZjkxZTVjIDEwMDY0NAoraW5kZXggMTAxNTU3NS4uNTdmNTljYSAxMDA2
NDQKIC0tLSBhL3Rvb2xzL2ttb2QuYwogKysrIGIvdG9vbHMva21vZC5jCi1AQCAtNjgsNyArNjgs
NyBAQCBzdGF0aWMgaW50IGttb2RfaGVscChpbnQgYXJnYywgY2hhciAqYXJndltdKQorQEAgLTYz
LDcgKzYzLDcgQEAgc3RhdGljIGludCBrbW9kX2hlbHAoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkK
ICAJCQkiT3B0aW9uczpcbiIKICAJCQkiXHQtViwgLS12ZXJzaW9uICAgICBzaG93IHZlcnNpb25c
biIKICAJCQkiXHQtaCwgLS1oZWxwICAgICAgICBzaG93IHRoaXMgaGVscFxuXG4iCkBAIC0xMjIs
NyArMTIyLDcgQEAgaW5kZXggNTU2ODljMC4uZGY5MWU1YyAxMDA2NDQKICAKICAJZm9yIChpID0g
MDsgaSA8IEFSUkFZX1NJWkUoa21vZF9jbWRzKTsgaSsrKSB7CiAgCQlpZiAoa21vZF9jbWRzW2ld
LT5oZWxwICE9IE5VTEwpIHsKLUBAIC0xNTYsNyArMTU2LDcgQEAgc3RhdGljIGludCBoYW5kbGVf
a21vZF9jb21wYXRfY29tbWFuZHMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKK0BAIC0xNTEsNyAr
MTUxLDcgQEAgc3RhdGljIGludCBoYW5kbGVfa21vZF9jb21wYXRfY29tbWFuZHMoaW50IGFyZ2Ms
IGNoYXIgKmFyZ3ZbXSkKICAJY29uc3QgY2hhciAqY21kOwogIAlzaXplX3QgaTsKICAKQEAgLTEz
MSw2ICsxMzEsMyBAQCBpbmRleCA1NTY4OWMwLi5kZjkxZTVjIDEwMDY0NAogIAogIAlmb3IgKGkg
PSAwOyBpIDwgQVJSQVlfU0laRShrbW9kX2NvbXBhdF9jbWRzKTsgaSsrKSB7CiAgCQlpZiAoc3Ry
ZXEoa21vZF9jb21wYXRfY21kc1tpXS0+bmFtZSwgY21kKSkKLS0tIAotMi40My4wCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kL2F2b2lkX3BhcmFsbGVsX3Rlc3Rz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2ttb2QvYXZvaWRfcGFyYWxsZWxfdGVz
dHMucGF0Y2gKaW5kZXggMDRhODIwNDgxNS4uODQ3NDkxNmJiYyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9rbW9kL2ttb2QvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2ttb2QvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGJlNmY4MmM1NGY2OTQ2MTdjNjQ2Y2ExZjhiNWJjZjkzNjk0
ZTIwYWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUzNDFjZjQ2NGU4OTk0ZTZiYjQx
MTg1MWQ1ZGI0MjBjOWIwMzdjNTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRv
ciBGbG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IEZyaSwgNiBTZXAgMjAxMyAy
MToxMTo1NyArMDAwMAogU3ViamVjdDogW1BBVENIXSBrbW9kOiBhdm9pZCBwYXJhbGxlbC10ZXN0
cwpAQCAtMTEsMTYgKzExLDE1IEBAIHNlcmlhbC10ZXN0cyBpcyBub3cgcmVxdWlyZWQKIAogU2ln
bmVkLW9mZi1ieTogVHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBVcHN0cmVh
bS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgKGRpc2FibGUgZmVhdHVyZSBpbmNvbXBhdGlibGUgd2l0
aCBwdGVzdCkKLQogLS0tCiAgY29uZmlndXJlLmFjIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFj
IGIvY29uZmlndXJlLmFjCi1pbmRleCBlZTcyMjgzLi42MDk4MGMwIDEwMDY0NAoraW5kZXggYjY1
MWI1Zi4uNDkxYmUxYiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJl
LmFjCi1AQCAtMTQsOCArMTQsOCBAQCBBQ19VU0VfU1lTVEVNX0VYVEVOU0lPTlMKK0BAIC0xNCw3
ICsxNCw3IEBAIEFDX1VTRV9TWVNURU1fRVhURU5TSU9OUwogIEFDX1NZU19MQVJHRUZJTEUKICBB
Q19QUkVGSVhfREVGQVVMVChbL3Vzcl0pCiAgQU1fTUFJTlRBSU5FUl9NT0RFKFtlbmFibGVdKQpA
QCAtMjgsNSArMjcsNCBAQCBpbmRleCBlZTcyMjgzLi42MDk4MGMwIDEwMDY0NAogK0FNX0lOSVRf
QVVUT01BS0UoW2NoZWNrLW5ld3MgZm9yZWlnbiAxLjExIHNpbGVudC1ydWxlcyB0YXItcGF4IG5v
LWRpc3QtZ3ppcCBkaXN0LXh6IHN1YmRpci1vYmplY3RzIGNvbG9yLXRlc3RzIHNlcmlhbC10ZXN0
c10pCiAgQU1fU0lMRU5UX1JVTEVTKFt5ZXNdKQogIExUX0lOSVQoW2Rpc2FibGUtc3RhdGljIHBp
Yy1vbmx5XSkKLQotIEFTX0lGKFt0ZXN0ICJ4JGVuYWJsZV9zdGF0aWMiID0gInh5ZXMiXSwgW0FD
X01TR19FUlJPUihbLS1lbmFibGUtc3RhdGljIGlzIG5vdCBzdXBwb3J0ZWQgYnkga21vZF0pXSkK
KyAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kL2d0a2RvY2Rpci5w
YXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kL2d0a2RvY2Rpci5wYXRjaAppbmRl
eCBhMzRlYTQ2NmU4Li42ZjQ2OGNjMmQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVs
L2ttb2Qva21vZC9ndGtkb2NkaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9k
L2ttb2QvZ3RrZG9jZGlyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkZDU5MDk1ZjcwZjc3
NGY2ZDFlNzY3MDEwZTI1YjM1ZWY2ZGI0YzRiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAzMzc4MzU4ODVmOGY1ZmY5ZWYwZTM2M2QyOWMwMGY4ZDMyZDFmNmJmIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRl
OiBGcmksIDggRGVjIDIwMjMgMjI6MzU6NDUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gY29uZmln
dXJlOiBzZXQgZG9jZGlyIGluIEdUS19ET0NfQ0hFQ0sKQEAgLTE2LDEwICsxNiwxMCBAQCBTaWdu
ZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZp
Z3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggZGUwMWUwOC4uNjc2OTZjNCAxMDA2NDQKK2lu
ZGV4IDQ5MWJlMWIuLjAzNDg3OGIgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2Nv
bmZpZ3VyZS5hYwotQEAgLTI1NSw3ICsyNTUsNyBAQCBBU19JRihbdGVzdCAieCRlbmFibGVfY292
ZXJhZ2UiID0gInh5ZXMiXSwgWworQEAgLTIyNyw3ICsyMjcsNyBAQCBBU19JRihbdGVzdCAieCRl
bmFibGVfY292ZXJhZ2UiID0gInh5ZXMiXSwgWwogIEFNX0NPTkRJVElPTkFMKFtFTkFCTEVfQ09W
RVJBR0VdLCBbdGVzdCAieCRlbmFibGVfY292ZXJhZ2UiID0gInh5ZXMiXSkKICAKICBtNF9pZmRl
ZihbR1RLX0RPQ19DSEVDS10sIFsKQEAgLTI4LDYgKzI4LDMgQEAgaW5kZXggZGUwMWUwOC4uNjc2
OTZjNCAxMDA2NDQKICBdLCBbCiAgQU1fQ09ORElUSU9OQUwoW0VOQUJMRV9HVEtfRE9DXSwgZmFs
c2UpXSkKICAKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwv
a21vZC9rbW9kXzMxLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2ttb2RfMzIuYmIKc2lt
aWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2tt
b2RfMzEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kXzMyLmJiCmlu
ZGV4IDZhZTgzYTdjNjYuLjNhYTczMDhhM2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwva21vZC9rbW9kXzMxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kXzMy
LmJiCkBAIC0xNSw3ICsxNSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PWE2Zjg5ZTIxMDBkOWI2Y2RmZmNlYTRmMzk4ZTM3MzQzIFwKICAgICAgICAgICAgICAgICAg
ICAiCiBpbmhlcml0IGF1dG90b29scyBiYXNoLWNvbXBsZXRpb24gZ3RrLWRvYyBwa2djb25maWcg
bWFucGFnZXMgdXBkYXRlLWFsdGVybmF0aXZlcwogCi1TUkNSRVYgPSAiYWZmNjE3ZWE4NzFkMDU2
OGNjNDkxYmQxMTZjMGJlMWU4NTc0NjNiYiIKK1NSQ1JFViA9ICI0MWZhYTU5NzExNzQyYzE0NzZk
NTk5ODUwMTFlZTBmMjdlZDkxZDMwIgogCiBTUkNfVVJJID0gImdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vdXRpbHMva2VybmVsL2ttb2Qva21vZC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly9kZXBtb2Qtc2VhcmNoLmNvbmYgXAotLSAKMi40
Mi4wCgo=

--===============1651753674622099403==--

