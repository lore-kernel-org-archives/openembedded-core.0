Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E72C3DA6A
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.13596.1713248039179901627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Bt0+SGy9;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lqcipbB1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018ee58a9cfc-35bf1b7d-27f9-4f9c-8fcf-059e452d57d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kUDJh1fzFD8ix/DlM6LlO6vT0hUEY0RgOysqLtxa3iQ=;
	b=Bt0+SGy9xD6rwbvu8GkVh/NxuNVK2GXtvS/Q6jZi/lnMs6uXO6RBpoV6uG4nKvZF
	vNZBxWQEVP09qdW7944VT0gqI7A0ZSx86cUr/64UJtYcRsYiV3z67zksFIaSsbS/wF5
	MVoxXRG0DLQ2cNI7moILRsrK9QF9Wyh1BGE4GgJI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kUDJh1fzFD8ix/DlM6LlO6vT0hUEY0RgOysqLtxa3iQ=;
	b=lqcipbB17RUbiZDAma5mvnXLfd+PxtIrVygZ6KLuRUk6EILxVtzEdljTieW6JOSS
	0oKCUplb8p32H3uOFnMvBimZgWKVpLqREQVtNQPyHrC3rU3PHkLk+9LNsksjtH64PSY
	iZS/WTIge0kK4KmNmX6heHSdH7Q/ojllFMuZCGSI=
Content-Type: multipart/mixed; boundary="===============1939809441673787131=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmod: upgrading to 32 FAILED
Message-ID: <0101018ee58a9cfc-35bf1b7d-27f9-4f9c-8fcf-059e452d57d7-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198380

--===============1939809441673787131==
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
From 49d4dd6b0204cc9ebbccadc7467afc332ac5f7e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 00:59:15 +0000
Subject: [PATCH] kmod: upgrade 31 -> 32

---
 ...Use-portable-implementation-for-basename-API.patch | 11 ++++-------
 .../kmod/kmod/avoid_parallel_tests.patch              | 10 ++++------
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch         |  9 +++------
 meta/recipes-kernel/kmod/{kmod_31.bb => kmod_32.bb}   |  2 +-
 4 files changed, 12 insertions(+), 20 deletions(-)
 rename meta/recipes-kernel/kmod/{kmod_31.bb => kmod_32.bb} (98%)

diff --git a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
index 6a7f9ded4f..6b6000e178 100644
--- a/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
+++ b/meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
@@ -1,4 +1,4 @@
-From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
+From d549549d103ad81d4c7ca269bfed77e1aa82414a Mon Sep 17 00:00:00 2001
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
index 04a8204815..4911e64677 100644
--- a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
+++ b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From be6f82c54f694617c646ca1f8b5bcf93694e20ad Mon Sep 17 00:00:00 2001
+From 317aad51884683bc8b6b5671db382e6fe4c33430 Mon Sep 17 00:00:00 2001
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
index a34ea466e8..c27aa34739 100644
--- a/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
+++ b/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
@@ -1,4 +1,4 @@
-From dd59095f70f774f6d1e767010e25b35ef6db4c4b Mon Sep 17 00:00:00 2001
+From 575aa0083f071b250873e37b25b6c86eff943f01 Mon Sep 17 00:00:00 2001
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


--===============1939809441673787131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-1649a112d56b5dbcdf1f179b2aa3f5547bf69548"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1649a112d56b5dbcdf1f179b2aa3f5547bf69548"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 127 Local 116 Mirrors 0 Missed 11 Current 231 (91% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 247 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 248 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 249 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 259 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 260 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_create_spdx_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 378 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_fetch)
NOTE: recipe bash-completion-2.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 319 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 321 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 325 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 326 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-32-r0: task do_fetch: Succeeded
NOTE: Running task 386 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 334 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 343 of 358 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 819 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_patch)
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
NOTE: recipe kmod-32-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmod-32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1035 of 1047 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_configure)
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
 opulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot', 'virtual:nat
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
|  /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/shell-completion/bash/kmod '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/share/bash-completion/completions'
|  /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c -m 644 ../git/libkmod/libkmod.h '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/include'
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/temp/run.do_install.1281551:166 exit 1 from 'ln -rs /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/bin/kmod /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/image/usr/bin/lsmod'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/temp/run.do_install.1281551, line 166
| 	#2: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/temp/run.do_install.1281551, line 228
NOTE: recipe kmod-32-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1037 tasks of which 1027 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416005842.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416005842.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: kmod-32-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/temp/run.do_install.1281551', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kmod/32/temp/log.do_install.1281551
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_install) failed with exit code '1'

--===============1939809441673787131==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kmod-upgrade-31-32.patch"

RnJvbSA0OWQ0ZGQ2YjAyMDRjYzllYmJjY2FkYzc0NjdhZmMzMzJhYzVmN2UxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDA6NTk6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
bW9kOiB1cGdyYWRlIDMxIC0+IDMyCgotLS0KIC4uLlVzZS1wb3J0YWJsZS1pbXBsZW1lbnRhdGlv
bi1mb3ItYmFzZW5hbWUtQVBJLnBhdGNoIHwgMTEgKysrKy0tLS0tLS0KIC4uLi9rbW9kL2ttb2Qv
YXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggICAgICAgICAgICAgIHwgMTAgKysrKy0tLS0tLQog
bWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2ttb2QvZ3RrZG9jZGlyLnBhdGNoICAgICAgICAgfCAg
OSArKystLS0tLS0KIG1ldGEvcmVjaXBlcy1rZXJuZWwva21vZC97a21vZF8zMS5iYiA9PiBrbW9k
XzMyLmJifSAgIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjAg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL3trbW9kXzMxLmJi
ID0+IGttb2RfMzIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9r
bW9kL2ttb2QvMDAwMS1Vc2UtcG9ydGFibGUtaW1wbGVtZW50YXRpb24tZm9yLWJhc2VuYW1lLUFQ
SS5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kLzAwMDEtVXNlLXBvcnRhYmxl
LWltcGxlbWVudGF0aW9uLWZvci1iYXNlbmFtZS1BUEkucGF0Y2gKaW5kZXggNmE3ZjlkZWQ0Zi4u
NmI2MDAwZTE3OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2ttb2QvMDAw
MS1Vc2UtcG9ydGFibGUtaW1wbGVtZW50YXRpb24tZm9yLWJhc2VuYW1lLUFQSS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qva21vZC8wMDAxLVVzZS1wb3J0YWJsZS1pbXBsZW1l
bnRhdGlvbi1mb3ItYmFzZW5hbWUtQVBJLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3MjFl
ZDYwNDBjN2FhNDcwNzBmYWY2Mzc4YzQzMzA4OWUxNzhiZDQzIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBkNTQ5NTQ5ZDEwM2FkODFkNGM3Y2EyNjliZmVkNzdlMWFhODI0MTRhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
IERhdGU6IFNhdCwgOSBEZWMgMjAyMyAxNzozNTo1OSAtMDgwMAogU3ViamVjdDogW1BBVENIXSBV
c2UgcG9ydGFibGUgaW1wbGVtZW50YXRpb24gZm9yIGJhc2VuYW1lIEFQSQpAQCAtMTEwLDEwICsx
MTAsMTAgQEAgaW5kZXggNDNmYzM1NC4uY2ZiMTViMSAxMDA2NDQKICAJCWRpcmxlbiAtPSBuYW1l
bGVuICsgMTsKICAJfQogZGlmZiAtLWdpdCBhL3Rvb2xzL2ttb2QuYyBiL3Rvb2xzL2ttb2QuYwot
aW5kZXggNTU2ODljMC4uZGY5MWU1YyAxMDA2NDQKK2luZGV4IDEwMTU1NzUuLjU3ZjU5Y2EgMTAw
NjQ0CiAtLS0gYS90b29scy9rbW9kLmMKICsrKyBiL3Rvb2xzL2ttb2QuYwotQEAgLTY4LDcgKzY4
LDcgQEAgc3RhdGljIGludCBrbW9kX2hlbHAoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKK0BAIC02
Myw3ICs2Myw3IEBAIHN0YXRpYyBpbnQga21vZF9oZWxwKGludCBhcmdjLCBjaGFyICphcmd2W10p
CiAgCQkJIk9wdGlvbnM6XG4iCiAgCQkJIlx0LVYsIC0tdmVyc2lvbiAgICAgc2hvdyB2ZXJzaW9u
XG4iCiAgCQkJIlx0LWgsIC0taGVscCAgICAgICAgc2hvdyB0aGlzIGhlbHBcblxuIgpAQCAtMTIy
LDcgKzEyMiw3IEBAIGluZGV4IDU1Njg5YzAuLmRmOTFlNWMgMTAwNjQ0CiAgCiAgCWZvciAoaSA9
IDA7IGkgPCBBUlJBWV9TSVpFKGttb2RfY21kcyk7IGkrKykgewogIAkJaWYgKGttb2RfY21kc1tp
XS0+aGVscCAhPSBOVUxMKSB7Ci1AQCAtMTU2LDcgKzE1Niw3IEBAIHN0YXRpYyBpbnQgaGFuZGxl
X2ttb2RfY29tcGF0X2NvbW1hbmRzKGludCBhcmdjLCBjaGFyICphcmd2W10pCitAQCAtMTUxLDcg
KzE1MSw3IEBAIHN0YXRpYyBpbnQgaGFuZGxlX2ttb2RfY29tcGF0X2NvbW1hbmRzKGludCBhcmdj
LCBjaGFyICphcmd2W10pCiAgCWNvbnN0IGNoYXIgKmNtZDsKICAJc2l6ZV90IGk7CiAgCkBAIC0x
MzEsNiArMTMxLDMgQEAgaW5kZXggNTU2ODljMC4uZGY5MWU1YyAxMDA2NDQKICAKICAJZm9yIChp
ID0gMDsgaSA8IEFSUkFZX1NJWkUoa21vZF9jb21wYXRfY21kcyk7IGkrKykgewogIAkJaWYgKHN0
cmVxKGttb2RfY29tcGF0X2NtZHNbaV0tPm5hbWUsIGNtZCkpCi0tLSAKLTIuNDMuMAotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qva21vZC9hdm9pZF9wYXJhbGxlbF90ZXN0
cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kL2F2b2lkX3BhcmFsbGVsX3Rl
c3RzLnBhdGNoCmluZGV4IDA0YTgyMDQ4MTUuLjQ5MTFlNjQ2NzcgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1rZXJuZWwva21vZC9rbW9kL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiZTZmODJjNTRmNjk0NjE3YzY0NmNhMWY4YjViY2Y5MzY5
NGUyMGFkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMTdhYWQ1MTg4NDY4M2JjOGI2
YjU2NzFkYjM4MmU2ZmU0YzMzNDMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVk
b3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBGcmksIDYgU2VwIDIwMTMg
MjE6MTE6NTcgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0ga21vZDogYXZvaWQgcGFyYWxsZWwtdGVz
dHMKQEAgLTExLDE2ICsxMSwxNSBAQCBzZXJpYWwtdGVzdHMgaXMgbm93IHJlcXVpcmVkCiAKIFNp
Z25lZC1vZmYtYnk6IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogVXBzdHJl
YW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIChkaXNhYmxlIGZlYXR1cmUgaW5jb21wYXRpYmxlIHdp
dGggcHRlc3QpCi0KIC0tLQogIGNvbmZpZ3VyZS5hYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5h
YyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggZWU3MjI4My4uNjA5ODBjMCAxMDA2NDQKK2luZGV4IGI2
NTFiNWYuLjQ5MWJlMWIgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3Vy
ZS5hYwotQEAgLTE0LDggKzE0LDggQEAgQUNfVVNFX1NZU1RFTV9FWFRFTlNJT05TCitAQCAtMTQs
NyArMTQsNyBAQCBBQ19VU0VfU1lTVEVNX0VYVEVOU0lPTlMKICBBQ19TWVNfTEFSR0VGSUxFCiAg
QUNfUFJFRklYX0RFRkFVTFQoWy91c3JdKQogIEFNX01BSU5UQUlORVJfTU9ERShbZW5hYmxlXSkK
QEAgLTI4LDUgKzI3LDQgQEAgaW5kZXggZWU3MjI4My4uNjA5ODBjMCAxMDA2NDQKICtBTV9JTklU
X0FVVE9NQUtFKFtjaGVjay1uZXdzIGZvcmVpZ24gMS4xMSBzaWxlbnQtcnVsZXMgdGFyLXBheCBu
by1kaXN0LWd6aXAgZGlzdC14eiBzdWJkaXItb2JqZWN0cyBjb2xvci10ZXN0cyBzZXJpYWwtdGVz
dHNdKQogIEFNX1NJTEVOVF9SVUxFUyhbeWVzXSkKICBMVF9JTklUKFtkaXNhYmxlLXN0YXRpYyBw
aWMtb25seV0pCi0KLSBBU19JRihbdGVzdCAieCRlbmFibGVfc3RhdGljIiA9ICJ4eWVzIl0sIFtB
Q19NU0dfRVJST1IoWy0tZW5hYmxlLXN0YXRpYyBpcyBub3Qgc3VwcG9ydGVkIGJ5IGttb2RdKV0p
CisgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qva21vZC9ndGtkb2NkaXIu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qva21vZC9ndGtkb2NkaXIucGF0Y2gKaW5k
ZXggYTM0ZWE0NjZlOC4uYzI3YWEzNDczOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5l
bC9rbW9kL2ttb2QvZ3RrZG9jZGlyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwva21v
ZC9rbW9kL2d0a2RvY2Rpci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGQ1OTA5NWY3MGY3
NzRmNmQxZTc2NzAxMGUyNWIzNWVmNmRiNGM0YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNTc1YWEwMDgzZjA3MWIyNTA4NzNlMzdiMjViNmM4NmVmZjk0M2YwMSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0
ZTogRnJpLCA4IERlYyAyMDIzIDIyOjM1OjQ1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZp
Z3VyZTogc2V0IGRvY2RpciBpbiBHVEtfRE9DX0NIRUNLCkBAIC0xNiwxMCArMTYsMTAgQEAgU2ln
bmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25m
aWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGRlMDFlMDguLjY3Njk2YzQgMTAwNjQ0Citp
bmRleCA0OTFiZTFiLi4wMzQ4NzhiIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9j
b25maWd1cmUuYWMKLUBAIC0yNTUsNyArMjU1LDcgQEAgQVNfSUYoW3Rlc3QgIngkZW5hYmxlX2Nv
dmVyYWdlIiA9ICJ4eWVzIl0sIFsKK0BAIC0yMjcsNyArMjI3LDcgQEAgQVNfSUYoW3Rlc3QgIngk
ZW5hYmxlX2NvdmVyYWdlIiA9ICJ4eWVzIl0sIFsKICBBTV9DT05ESVRJT05BTChbRU5BQkxFX0NP
VkVSQUdFXSwgW3Rlc3QgIngkZW5hYmxlX2NvdmVyYWdlIiA9ICJ4eWVzIl0pCiAgCiAgbTRfaWZk
ZWYoW0dUS19ET0NfQ0hFQ0tdLCBbCkBAIC0yOCw2ICsyOCwzIEBAIGluZGV4IGRlMDFlMDguLjY3
Njk2YzQgMTAwNjQ0CiAgXSwgWwogIEFNX0NPTkRJVElPTkFMKFtFTkFCTEVfR1RLX0RPQ10sIGZh
bHNlKV0pCiAgCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVs
L2ttb2Qva21vZF8zMS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9rbW9kXzMyLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9r
bW9kXzMxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qva21vZF8zMi5iYgpp
bmRleCA2YWU4M2E3YzY2Li4zYWE3MzA4YTNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2Vy
bmVsL2ttb2Qva21vZF8zMS5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qva21vZF8z
Mi5iYgpAQCAtMTUsNyArMTUsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT1hNmY4OWUyMTAwZDliNmNkZmZjZWE0ZjM5OGUzNzM0MyBcCiAgICAgICAgICAgICAgICAg
ICAgIgogaW5oZXJpdCBhdXRvdG9vbHMgYmFzaC1jb21wbGV0aW9uIGd0ay1kb2MgcGtnY29uZmln
IG1hbnBhZ2VzIHVwZGF0ZS1hbHRlcm5hdGl2ZXMKIAotU1JDUkVWID0gImFmZjYxN2VhODcxZDA1
NjhjYzQ5MWJkMTE2YzBiZTFlODU3NDYzYmIiCitTUkNSRVYgPSAiNDFmYWE1OTcxMTc0MmMxNDc2
ZDU5OTg1MDExZWUwZjI3ZWQ5MWQzMCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL3V0aWxzL2tlcm5lbC9rbW9kL2ttb2QuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9j
b2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vZGVwbW9kLXNlYXJjaC5jb25mIFwKLS0gCjIu
NDIuMAoK

--===============1939809441673787131==--

