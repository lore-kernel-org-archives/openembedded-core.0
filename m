Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A578AC61CE8
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:08 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.131413.1723748333532725989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KjtD2NCE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1CsQjjI+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019157683406-129399dc-4de6-492a-ab2c-5b7205fc0ff8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kGHegutr3/85kSaJAyIq6QC/sQbQBBDfzwimTBout+c=;
	b=KjtD2NCEfGBjTEGnU+OHD+nucmwAkzL9hhpZ3kBen/PvV5M+hglgSbFBeyNwy6/R
	XD9GjOK6Xcm5FOOaoJKM3cxxa2kWLQB4Feg5O8s9CXd+r3sas7QU+kT2kiqeAP2W8AI
	IJZ7ArFlLTVN9MnD8TWj75QyRN+rE5H9HqBTry2c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kGHegutr3/85kSaJAyIq6QC/sQbQBBDfzwimTBout+c=;
	b=1CsQjjI+tQLxUPJiUBNXSY7chN38fS9aXV6W1KS531shef4U5GQqqMFWh6bHdZHG
	M8euzI/mbxFgEkeZzgi+wC24JxagFYXBSFBiqE2mjBeDjLJ14YB6Bk5MVU6/n1zyknh
	p7XvoY7xcMaSOTQQNjBPzNNsCib1XToV43K/tBNA=
Content-Type: multipart/mixed; boundary="===============1172546336034834199=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux,util-linux-libuuid: upgrading to 2.40.2,2.40.2
 FAILED
Message-ID: <0101019157683406-129399dc-4de6-492a-ab2c-5b7205fc0ff8-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203344

--===============1172546336034834199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *util-linux,util-linux-libuuid* to *2.40.2,2.40.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-util-linux-libuuid-upgrade-2.40.1-2.40.2-.patch
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
From 5be7041a30dc45d9a34f7b0fbeb3893f37cfb7c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 05:47:21 +0000
Subject: [PATCH] util-linux,util-linux-libuuid: upgrade 2.40.1 ->
 2.40.2,2.40.1 -> 2.40.2

---
 ...linux-libuuid_2.40.1.bb => util-linux-libuuid_2.40.2.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                 | 2 +-
 .../util-linux/util-linux/avoid_parallel_tests.patch        | 4 ++--
 .../util-linux/util-linux/configure-sbindir.patch           | 4 ++--
 .../util-linux/display_testname_for_subtest.patch           | 2 +-
 meta/recipes-core/util-linux/util-linux/ptest.patch         | 6 +++---
 .../{util-linux_2.40.1.bb => util-linux_2.40.2.bb}          | 0
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.40.1.bb => util-linux-libuuid_2.40.2.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.40.1.bb => util-linux_2.40.2.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0f5f838e84..d2c1231375 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -40,4 +40,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://fcntl-lock.c \
            "
 
-SRC_URI[sha256sum] = "59e676aa53ccb44b6c39f0ffe01a8fa274891c91bef1474752fad92461def24f"
+SRC_URI[sha256sum] = "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 8ea00dbb95..5ba392b2cf 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
+From 3dccd79bc1796f1055554389f97a52660dc02fb4 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 651ef2b..2a8012e 100644
+index af86e1e..0375d29 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 74abdc2038..55c1f59679 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
+From 6df06655b60f8672463c7740ee7b91138fa63d4e Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 23594ff..651ef2b 100644
+index 82d0e4b..af86e1e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index 871b0b2d30..50f4d3a9e5 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
+From ad64b1622d6b181f0a3bc92d7b1ab579aa4cf26e Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 7345926b88..a9fbd3d1ec 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
+From 5e8949876810f66c153908ce1606206c6882d3ae Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 50ab8d0..7e2340d 100644
+index 54e0fd4..ee2d553 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -64,6 +64,7 @@ tmpfiles_DATA =
+@@ -65,6 +65,7 @@ tmpfiles_DATA =
  dist_bashcompletion_DATA =
  check_PROGRAMS =
  dist_check_SCRIPTS =
diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recipes-core/util-linux/util-linux_2.40.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.40.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.40.2.bb
-- 
2.44.0


--===============1172546336034834199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1868 targets, 51 skipped, 0 masked, 0 errors.
Removing 112 recipes from the core2-64 sysroot...done.
Removing 118 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-033689b4a9667691b54216a5fc91ce614bd63b5e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:033689b4a9667691b54216a5fc91ce614bd63b5e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 629 Local 308 Mirrors 0 Missed 321 Current 266 (48% match, 64% complete)
Removing 7 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 287 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 332 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 350 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 364 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 366 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 367 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-6.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 383 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 390 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iproute2-6.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 391 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 392 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 393 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 396 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 399 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 400 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bc-1.07.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 401 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 402 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 403 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 404 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iproute2-6.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 416 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 421 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe grep-3.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 425 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 430 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 431 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 432 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 433 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 434 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 435 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 436 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 438 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 439 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 450 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe grep-3.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 452 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 459 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 462 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 467 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 468 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 471 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 476 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 484 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 496 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 497 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 498 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 499 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 501 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa_setscene)
NOTE: recipe which-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 508 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 509 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 510 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 511 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 512 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 513 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 514 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 515 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 516 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 522 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 524 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 525 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 527 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 531 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 533 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 536 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 543 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 546 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 550 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 554 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 558 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 595 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 600 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 601 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 603 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 604 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 605 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe which-2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 606 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 607 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 608 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 610 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 612 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 616 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 618 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 619 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 620 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 623 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 625 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 626 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 627 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 629 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 630 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 632 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 633 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 635 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 636 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 637 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 638 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 639 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 641 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 642 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 643 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 645 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 656 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 660 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 671 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 693 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 701 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 704 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 705 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 706 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 754 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 765 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 780 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 781 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 782 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 783 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 784 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 786 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 792 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 816 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 817 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 818 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 820 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 822 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 823 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 829 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 830 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 831 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 832 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 834 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 346 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_fetch)
NOTE: Running task 351 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: Running task 353 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 836 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: Running task 357 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 359 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: Running setscene task 837 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 840 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 843 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.9.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 848 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe curl-8.9.1-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 849 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 850 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: Running task 693 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 721 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_unpack)
NOTE: Running setscene task 852 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 725 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_fetch)
NOTE: Running task 726 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: Running task 727 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_fetch)
NOTE: Running setscene task 853 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 854 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 742 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: Running task 747 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: Running task 751 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 753 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.49-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 857 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.10-r0: task do_fetch: Succeeded
NOTE: Running task 754 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 756 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 757 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_unpack)
NOTE: Running task 758 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_unpack)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 759 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 858 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 859 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 760 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.10-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.49-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_unpack: Started
NOTE: Running task 761 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 863 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 762 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 763 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 764 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 864 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: recipe nettle-3.10-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 765 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_patch)
NOTE: Running task 767 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 865 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 866 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running task 770 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: Running task 772 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.49-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.10-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 773 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_patch)
NOTE: Running setscene task 867 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 774 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_fetch: Started
NOTE: Running task 776 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_fetch: Succeeded
NOTE: Running task 778 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_fetch)
NOTE: recipe libgpg-error-1.49-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: Running task 779 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 781 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 783 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe libunistring-1.2-r0: task do_patch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 785 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 786 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: Running task 792 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: Running task 793 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.10-r0: task do_patch: Succeeded
NOTE: Running task 794 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: Running task 797 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 868 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 869 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 870 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 798 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_unpack)
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 799 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_patch: Started
NOTE: Running task 800 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.49-r0: task do_patch: Succeeded
NOTE: Running task 803 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: Running task 805 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_fetch)
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 806 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_patch)
NOTE: recipe libtool-cross-2.5.1-r0: task do_unpack: Started
NOTE: Running task 808 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 809 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 810 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 811 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Started
NOTE: Running noexec task 813 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Started
NOTE: Running task 814 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: Running task 815 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 817 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_unpack)
NOTE: Running task 818 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 819 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 822 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_fetch)
NOTE: Running task 825 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running setscene task 871 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 872 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: Running setscene task 873 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.9.1-r0: task do_unpack: Started
NOTE: Running task 828 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_unpack)
NOTE: recipe libcap-2.70-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe libcap-2.70-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 830 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: Running task 831 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 833 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch unihash changed to 9efbb404352a55ba0e97adb6b047d8debe9a695bd3c29a8534039d8683b70ef4
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.9.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 813 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 847 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running noexec task 835 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running task 837 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 838 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: Running task 840 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_patch)
NOTE: Running task 841 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_patch)
NOTE: Running task 842 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 843 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: Running task 844 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: Running task 845 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: Running task 847 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 850 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_patch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: recipe curl-8.9.1-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 851 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_fetch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 853 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 878 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 863 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 880 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_patch: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: Running task 872 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.6-r0: task do_fetch: Started
NOTE: Running task 876 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: Running task 878 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: recipe curl-8.9.1-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 881 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 889 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_fetch)
NOTE: Running task 893 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 895 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: Running task 898 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: Running setscene task 884 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Succeeded
NOTE: Running task 899 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 885 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 903 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_fetch: Started
NOTE: recipe libcap-2.70-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_fetch: Started
NOTE: Running task 904 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_fetch: Started
NOTE: Running task 905 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libtirpc-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 924 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_unpack)
NOTE: Running task 930 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe libcap-2.70-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 932 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 936 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: Running task 937 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 938 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: Running task 939 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: recipe lzlib-1.14-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 940 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: recipe lzlib-1.14-r0: task do_fetch: Succeeded
NOTE: Running task 941 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 942 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_patch)
NOTE: recipe libcap-2.70-r0: task do_patch: Succeeded
NOTE: Running task 943 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 948 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_fetch)
NOTE: Running task 950 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 951 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_fetch: Succeeded
NOTE: Running task 952 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 953 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 954 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_collect_spdx_deps)
NOTE: Running task 955 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_patch: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 956 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: Running task 960 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 963 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 970 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: Running task 971 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running noexec task 973 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: Running noexec task 974 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 975 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_fetch: Started
NOTE: Running task 977 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 978 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: Running task 979 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running task 980 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_deploy_source_date_epoch unihash changed to 2fb23c1d3f8030298746bd5218167dbe1ca5512744f6e3cd7f7652d68ad1193a
NOTE: recipe python3-3.12.4-r0: task do_fetch: Succeeded
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: Running setscene task 873 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 981 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_patch)
NOTE: Running task 982 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: Running task 983 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_patch)
NOTE: Running task 984 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: Running task 985 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_fetch)
NOTE: Running task 989 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: Running task 992 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 994 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_unpack)
NOTE: Running task 996 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: Running task 997 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_unpack)
NOTE: Running task 998 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: recipe lzlib-1.14-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.6-r0: task do_patch: Started
NOTE: recipe elfutils-0.191-r0: task do_fetch: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe lzlib-1.14-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_patch)
NOTE: Running task 1000 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe elfutils-0.191-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1004 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: Running task 1005 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: Running task 1006 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: Running task 1008 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1011 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe lzlib-1.14-r0: task do_patch: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1014 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_patch: Succeeded
NOTE: Running task 1015 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: Running task 1016 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.6-r0: task do_patch: Succeeded
NOTE: Running task 1018 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_unpack: Started
NOTE: Running task 1019 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1020 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libedit-20240517-3.1-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: Running task 1021 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1022 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1023 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Started
NOTE: Running task 1024 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1025 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1027 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1030 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 1032 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_fetch)
NOTE: Running task 1033 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe coreutils-9.5-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_fetch: Succeeded
NOTE: Running task 1034 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_patch)
NOTE: Running task 1035 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: recipe elfutils-0.191-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1036 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch unihash changed to e40e8ccadb77457bc26125a677468d8dd83d991ddfdb7aa3deda244497c7c0b5
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: Running task 1037 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: Running task 1038 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: Running task 1039 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: Running task 1040 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 1044 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_fetch)
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: Running task 1045 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_fetch)
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1052 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: Running task 1060 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Started
NOTE: Running task 1061 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Started
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_fetch: Started
NOTE: Running task 1063 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_fetch)
NOTE: recipe diffutils-3.10-r0: task do_fetch: Succeeded
NOTE: Running task 1070 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: recipe coreutils-9.5-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_patch: Started
NOTE: recipe perl-5.38.2-r0: task do_fetch: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1079 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1088 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1090 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Started
NOTE: recipe perl-5.38.2-r0: task do_fetch: Succeeded
NOTE: Running task 1091 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1092 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 1094 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1097 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running noexec task 1098 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running noexec task 1099 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 1100 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Started
NOTE: recipe diffutils-3.10-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 1101 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1110 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_unpack)
NOTE: Running task 1113 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1131 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_unpack)
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Started
NOTE: recipe perl-5.38.2-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Started
NOTE: recipe diffutils-3.10-r0: task do_unpack: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: Running task 1132 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_patch)
NOTE: Running task 1133 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: Running task 1134 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package unihash changed to bbb8944c96ebda3b57383864cd6b38a748532b0f72bff02062f3c798b2d71b29
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata became valid
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe diffutils-3.10-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.5-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_unpack: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 627 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running task 1135 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_patch)
NOTE: Running task 1136 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_patch)
NOTE: Running task 1137 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_patch)
NOTE: Running task 1138 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1141 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch)
NOTE: Running task 1143 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1155 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_fetch)
NOTE: Running task 1166 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_fetch)
NOTE: Running task 1168 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 1170 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_fetch)
NOTE: Running task 1179 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: recipe perl-5.38.2-r0: task do_unpack: Succeeded
NOTE: Running task 1180 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 886 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1181 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_fetch)
NOTE: recipe elfutils-0.191-r0: task do_patch: Started
NOTE: recipe findutils-4.10.0-r0: task do_patch: Started
NOTE: recipe shadow-4.15.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_fetch: Started
NOTE: recipe coreutils-9.5-r0: task do_patch: Started
NOTE: Running setscene task 888 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: Running task 1184 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.2.bb:do_patch)
NOTE: recipe python3-3.12.4-r0: task do_patch: Started
NOTE: recipe findutils-4.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1186 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1187 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_patch: Started
NOTE: Running task 1195 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.10-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-source-14.2.0-14.2.0-r0: task do_patch: Started
NOTE: recipe iptables-1.8.10-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1198 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_unpack)
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe shadow-4.15.1-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Succeeded
NOTE: Running task 1200 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1201 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_unpack)
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.3.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1239 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1240 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1241 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_unpack)
NOTE: Running task 1242 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: recipe coreutils-9.5-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: Running task 1254 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Started
NOTE: Running task 1256 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe iptables-1.8.10-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe grep-3.11-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe grep-3.11-r0: task do_fetch: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1257 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gawk-5.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1258 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1259 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe iptables-1.8.10-r0: task do_unpack: Succeeded
NOTE: Running task 1260 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_patch)
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe gawk-5.3.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1272 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_fetch)
NOTE: Running task 1273 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r0: task do_unpack: Succeeded
NOTE: Running task 1274 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe linux-libc-headers-6.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: Running task 1275 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_patch)
NOTE: recipe iptables-1.8.10-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1276 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Succeeded
NOTE: Running task 1277 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_patch)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1280 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_fetch)
NOTE: Running task 1281 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_fetch)
NOTE: recipe libpcre2-10.44-r0: task do_patch: Started
NOTE: recipe elfutils-0.191-r0: task do_patch: Succeeded
NOTE: Running task 1283 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_fetch)
NOTE: recipe which-2.21-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Started
NOTE: recipe which-2.21-r0: task do_fetch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1296 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_fetch)
NOTE: recipe iptables-1.8.10-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_patch: Succeeded
NOTE: Running task 1302 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: Running task 1303 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_unpack)
NOTE: recipe socat-1.8.0.0-r0: task do_fetch: Started
NOTE: Running task 1307 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe kmod-32-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.9.2-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_fetch: Started
NOTE: Running task 1325 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_unpack)
NOTE: Running task 1326 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1327 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_unpack)
NOTE: recipe iproute2-6.9.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1328 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.10-r0: task do_fetch: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe grep-3.11-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_fetch: Succeeded
NOTE: Running task 1329 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1330 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe socat-1.8.0.0-r0: task do_unpack: Started
NOTE: recipe which-2.21-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_unpack: Started
NOTE: Running task 1350 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe iproute2-6.9.0-r0: task do_unpack: Started
NOTE: recipe which-2.21-r0: task do_unpack: Succeeded
NOTE: Running task 1351 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe kmod-32-r0: task do_fetch: Succeeded
NOTE: Running task 1352 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.10-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1353 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe linux-libc-headers-6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe socat-1.8.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1355 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_patch)
NOTE: recipe which-2.21-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1359 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: recipe grep-3.11-r0: task do_unpack: Succeeded
NOTE: Running task 1360 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_patch)
NOTE: recipe kmod-32-r0: task do_unpack: Started
NOTE: recipe iproute2-6.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1361 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 1362 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe socat-1.8.0.0-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe grep-3.11-r0: task do_patch: Started
NOTE: recipe which-2.21-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_patch: Started
NOTE: recipe python3-3.12.4-r0: task do_patch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe grep-3.11-r0: task do_patch: Succeeded
NOTE: Running task 1393 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1399 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe iproute2-6.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1445 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_collect_spdx_deps)
NOTE: Running task 1459 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe socat-1.8.0.0-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1475 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_lic)
NOTE: Running task 1476 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: Running task 1477 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1479 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 1480 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: Running task 1481 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_lic: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1482 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe kmod-32-r0: task do_unpack: Succeeded
NOTE: Running task 1483 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_patch)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_patch: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1485 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_lic: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_lic unihash changed to 9057252b18444bc2a4010f214ddb65b28824a81061e4e21193b03a63ec14b028
NOTE: recipe kmod-32-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_lic: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1488 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe kmod-32-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_lic unihash changed to 6e69c58cd1a4d9d23df1511a8f22b64f1b9dafc81cbf330fd1b4c51411687ed7
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1490 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1491 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1492 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1494 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe gcc-source-14.2.0-14.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.2.bb:do_preconfigure)
NOTE: recipe tcp-wrappers-7.6-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcc-source-14.2.0-14.2.0-r0: task do_preconfigure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package unihash changed to 25dedf361dd9b6427884a815f1af103266cbdd9237f1e5f7cf86efc08c68fb74
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 3de15ef14abe1894779421a7be57660c949492f8f009a3bb1e71c355ee57ba18
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx became valid
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcc-source-14.2.0-14.2.0-r0: task do_preconfigure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot unihash changed to cc185951cfb74808768a9816f615472cc2184671a9abfbe8efeaefbfef69447a
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 888 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe musl-1.2.4+git-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1506 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: recipe musl-1.2.4+git-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_unpack: Succeeded
NOTE: Running task 1507 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1509 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_symlink_kernsrc)
NOTE: recipe linux-libc-headers-6.10-r0: task do_unpack: Succeeded
NOTE: Running task 1510 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_patch)
NOTE: Running task 1511 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_collect_spdx_deps)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1512 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_kernel_checkout)
NOTE: recipe linux-libc-headers-6.10-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_kernel_checkout: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_patch: Succeeded
NOTE: Running noexec task 1514 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_configure)
NOTE: Running noexec task 1515 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_compile)
NOTE: Running task 1516 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_install)
NOTE: recipe linux-libc-headers-6.10-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_install: Succeeded
NOTE: Running task 1529 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1532 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_package)
NOTE: Running task 1533 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1534 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1535 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Succeeded
NOTE: Running task 1538 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1539 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package)
NOTE: recipe musl-1.2.4+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Started
NOTE: recipe musl-1.2.4+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1540 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_configure)
NOTE: recipe musl-1.2.4+git-r0: task do_configure: Started
NOTE: recipe musl-1.2.4+git-r0: task do_configure: Succeeded
NOTE: Running task 1541 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_compile)
NOTE: recipe musl-1.2.4+git-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package unihash changed to eae5a6962955df72d2032f4fe4a285c47c444a6e9ccc7dfd9af8d0d95685488f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx became valid
NOTE: Running setscene task 887 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_package unihash changed to 96a31232518de40c1b1978fadb071962cce8c21c6af9c42fedcf6462977a23da
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_create_spdx became valid
NOTE: Running setscene task 887 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1551 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_collect_spdx_deps)
NOTE: Running task 1552 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_collect_spdx_deps)
NOTE: recipe musl-1.2.4+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.4+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1553 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: recipe musl-1.2.4+git-r0: task do_install: Started
NOTE: recipe musl-1.2.4+git-r0: task do_install: Succeeded
NOTE: Running task 1555 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1556 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe libgcc-14.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package: Started
NOTE: recipe libgcc-14.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1557 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_configure)
NOTE: recipe libgcc-14.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-14.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_compile)
NOTE: recipe libgcc-14.2.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package unihash changed to d90a0bc65755adc8dc32071d5a3b959851c63cb8dd8f691179b6ebf7b89cbb05
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata became valid
NOTE: Running setscene task 889 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1561 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-14.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-14.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1562 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_install)
NOTE: recipe libgcc-14.2.0-r0: task do_install: Started
NOTE: recipe libgcc-14.2.0-r0: task do_install: Succeeded
NOTE: Running task 1563 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_multilib_install)
NOTE: recipe libgcc-14.2.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-14.2.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1564 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_extra_symlinks)
NOTE: recipe libgcc-14.2.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-14.2.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1566 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1567 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1568 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_configure)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_configure: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package unihash changed to 013d7c0223ca7043ee32ef792ae69bc15ec15d2c723268651bc71b39ddfa7a20
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1571 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 1572 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_validate_branches)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_validate_branches: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_validate_branches: Succeeded
NOTE: Running task 1573 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_kernel_metadata)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_kernel_metadata: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 1574 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_patch)
NOTE: Running task 1575 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_kernel_version_sanity_check)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_patch: Succeeded
NOTE: Running task 1577 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_kernel_configme)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_kernel_configme: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1578 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_compile)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_compile: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_kernel_configme: Succeeded
NOTE: Running task 1579 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_configure)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_configure: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_kernel_configcheck)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_kernel_configcheck: Started
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 1581 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.10.bb:do_compile)
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_compile: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1582 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_install)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_install: Succeeded
NOTE: Running task 1584 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1590 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1591 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1592 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1593 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1594 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_package)
NOTE: Running task 1595 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1596 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1597 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1598 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1599 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1600 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1601 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1602 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1603 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1604 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1605 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1606 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe libunistring-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1607 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure)
NOTE: recipe bash-completion-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1608 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_configure)
NOTE: Running task 1609 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_configure)
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1610 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe zstd-1.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1611 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1612 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1613 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_configure)
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Started
NOTE: Running task 1614 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_configure)
NOTE: Running task 1615 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_configure)
NOTE: recipe bash-completion-2.14.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1616 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe zstd-1.5.6-r0: task do_configure: Started
NOTE: Running task 1617 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_configure)
NOTE: recipe gdbm-1.24-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe expat-2.6.2-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Started
NOTE: recipe zstd-1.5.6-r0: task do_configure: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_configure: Started
NOTE: Running task 1618 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1619 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1620 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe zstd-1.5.6-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: Running task 1621 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1622 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe zlib-1.3.1-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: Running task 1624 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1625 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1626 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1627 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_install: Started
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1628 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1629 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe openssl-3.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1631 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1632 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_configure)
NOTE: recipe openssl-3.3.1-r0: task do_configure: Started
NOTE: recipe cracklib-2.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1633 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_configure)
NOTE: recipe bash-completion-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1634 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.11-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.49-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.49-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1635 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_configure)
NOTE: recipe libgpg-error-1.49-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_configure: Succeeded
NOTE: Running task 1636 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1637 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_package unihash changed to 804edb20f3feead46a9d144f3e2f5ecca28b062e88080d0bc7f76d8f29da9af1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_create_spdx became valid
NOTE: recipe libtirpc-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Succeeded
NOTE: Running setscene task 860 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running task 1638 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: Running task 1639 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure_ptest_base)
NOTE: Running task 1640 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1641 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1642 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_compile: Started
NOTE: recipe cracklib-2.9.11-r0: task do_configure: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1643 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_compile)
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running task 1644 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: Running task 1645 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile)
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe xz-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1646 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_configure)
NOTE: Running task 1647 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.4.6-r0: task do_configure: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1648 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1649 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_install)
NOTE: Setscene tasks completed
NOTE: Running task 1651 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1652 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe cracklib-2.9.11-r0: task do_install: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 1653 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1654 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: Running task 1655 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1657 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1658 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-2.9.11-r0: task do_install: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_install: Started
NOTE: Running task 1660 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1661 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1662 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure)
NOTE: recipe libpam-1.6.1-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1663 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_compile)
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 1664 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.49-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1665 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_configure_ptest_base)
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1666 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_install)
NOTE: recipe libgpg-error-1.49-r0: task do_configure_ptest_base: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Started
NOTE: recipe libgpg-error-1.49-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1667 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_compile)
NOTE: recipe libgpg-error-1.49-r0: task do_compile: Started
NOTE: recipe openssl-3.3.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1668 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_configure_ptest_base)
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Succeeded
NOTE: Running task 1670 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1671 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install)
NOTE: recipe openssl-3.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: Running task 1672 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1673 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Started
NOTE: recipe openssl-3.3.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1674 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 1675 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1676 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile)
NOTE: recipe gdbm-1.24-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1678 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1680 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_configure_ptest_base)
NOTE: recipe expat-2.6.2-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.6.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1681 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_compile)
NOTE: recipe expat-2.6.2-r0: task do_compile: Started
NOTE: recipe gdbm-1.24-r0: task do_compile: Succeeded
NOTE: Running task 1682 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1683 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1685 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 37e5017dd38f688a722c4d5104a695e9cce5286508ac8b230630d62fd71b0c98
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1686 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1688 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_compile)
NOTE: recipe libtirpc-1.3.5-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1689 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe expat-2.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1690 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_compile_ptest_base)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe expat-2.6.2-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.6.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1691 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_install)
NOTE: recipe expat-2.6.2-r0: task do_install: Started
NOTE: recipe gdbm-1.24-r0: task do_install: Succeeded
NOTE: Running task 1692 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: recipe libtirpc-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe expat-2.6.2-r0: task do_install: Succeeded
NOTE: Running task 1695 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install_ptest_base)
NOTE: recipe libtirpc-1.3.5-r0: task do_install: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1696 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1698 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1699 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe lzlib-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1701 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1702 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_configure)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.14-r0: task do_configure: Started
NOTE: recipe lzlib-1.14-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_compile: Succeeded
NOTE: Running task 1703 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_compile)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1704 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_compile_ptest_base)
NOTE: Running task 1705 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.14-r0: task do_compile: Started
NOTE: recipe libffi-3.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.49-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.49-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1706 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_install)
NOTE: recipe libffi-3.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1707 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe libgpg-error-1.49-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Started
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1708 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 7c42d4fe3343a9c24cdea7d31a85586af540d65ec40472294e9acbecb9417bba
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 1709 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_install: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: Running task 1710 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_install_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_configure: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1711 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_compile)
NOTE: recipe libgpg-error-1.49-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.49-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1713 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1715 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_install_ptest_base)
NOTE: recipe libffi-3.4.6-r0: task do_configure: Started
NOTE: recipe expat-2.6.2-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.6.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1717 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1718 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1719 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.6-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_compile: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1720 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_configure_ptest_base)
NOTE: Running task 1721 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_install)
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1723 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_install: Started
NOTE: recipe xz-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1724 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_compile)
NOTE: Running task 1725 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe lzlib-1.14-r0: task do_compile: Succeeded
NOTE: Running task 1726 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe xz-5.4.6-r0: task do_compile: Started
NOTE: recipe lzlib-1.14-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1727 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe lzlib-1.14-r0: task do_install: Succeeded
NOTE: Running task 1729 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 1730 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1731 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_package)
NOTE: recipe cracklib-2.9.11-r0: task do_package: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1732 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: recipe zstd-1.5.6-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1733 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_install)
NOTE: recipe xz-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1734 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe zstd-1.5.6-r0: task do_install: Started
NOTE: recipe xz-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 1735 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1736 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: Running task 1737 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe libpam-1.6.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1738 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot unihash changed to c5c2ee072d060f41db691abb36776a1d99c663421830cd35dc350086a2c0301a
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1739 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile)
NOTE: Running task 1740 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.6.1-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1741 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1742 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe xz-5.4.6-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1743 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: Running task 1744 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1746 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Started
NOTE: recipe nettle-3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_package: Succeeded
NOTE: Running task 1748 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_package unihash changed to 7c0887a52bc7c5970a44245a68900ceadee687fa7efd43ee622a91deda112fe5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata became valid
NOTE: recipe nettle-3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: Running setscene task 887 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: Running task 1749 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_configure)
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe nettle-3.10-r0: task do_configure: Started
NOTE: Running task 1750 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_configure: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running task 1751 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_compile)
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1756 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1757 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package)
NOTE: recipe base-passwd-3.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1758 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1759 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_configure)
NOTE: recipe base-passwd-3.6.4-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: Running task 1761 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1763 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe findutils-4.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1764 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe findutils-4.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1765 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe diffutils-3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 1766 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_install_ptest_base)
NOTE: recipe xz-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe libffi-3.4.6-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1767 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_configure)
NOTE: Running task 1768 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1770 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_configure)
NOTE: recipe libffi-3.4.6-r0: task do_compile: Started
NOTE: recipe findutils-4.10.0-r0: task do_configure: Started
NOTE: recipe diffutils-3.10-r0: task do_configure: Started
NOTE: recipe xz-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1772 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package: Succeeded
NOTE: Running task 1773 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.14.0-r0: task do_package: Started
NOTE: recipe perl-5.38.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to bb24b7462a4ce6524294899b84a00c60a58e3fbd5f556d56ddced8bbdf43093f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: recipe perl-5.38.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running task 1774 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_configure)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: Running task 1775 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1777 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata)
NOTE: recipe libffi-3.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1778 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_install)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.6-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1779 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package)
NOTE: recipe xz-5.4.6-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_configure: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_install: Succeeded
NOTE: Running task 1780 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_compile)
NOTE: Running task 1782 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe nettle-3.10-r0: task do_configure: Succeeded
NOTE: Running task 1783 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_configure_ptest_base)
NOTE: recipe base-passwd-3.6.4-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe nettle-3.10-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1784 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_compile)
NOTE: recipe nettle-3.10-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_compile: Succeeded
NOTE: Running task 1785 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_install)
NOTE: recipe base-passwd-3.6.4-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_install: Succeeded
NOTE: Running task 1787 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package unihash changed to db1dc0a39f2667fac97cf83afe10963dfe42e75461b24d8fa772486bdd4a860a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to d5acbca884998289e2509ee3d249280ee16840b70a151174d36ed2b69d4b1c7b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx became valid
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 884 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1789 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1793 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_package)
NOTE: recipe libtirpc-1.3.5-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 9d68ea41444769fc1d476aeeb9b215915f08bbea002570187a2f897eec295964
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx became valid
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1795 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe xz-5.4.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package unihash changed to c092326a949fcd972bc36929201857213ed53ca23e2358e98d26a693b124af21
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata became valid
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1797 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package)
NOTE: recipe base-passwd-3.6.4-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package unihash changed to cae98dafcd13ca371ded4c2377447858d2a3e453da94234b0941be258930cea3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_package unihash changed to f059882a9d875e958cadee912903ca13f47775d2818705bf89ad36e212212dc7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata became valid
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1799 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package)
NOTE: recipe zstd-1.5.6-r0: task do_install: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1801 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1802 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.7.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1803 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_configure: Started
NOTE: recipe libarchive-3.7.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1804 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_configure)
NOTE: recipe libarchive-3.7.4-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package unihash changed to ec3f172019b982db618595e2fdfe3d4efc548045575a9c40cd571bf6082683f2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to 89fc7f14d7ccef3233bc988c8ff71132bb75abf9205411d9e7e6eb5b3971157c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1805 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_package)
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_package: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1809 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1810 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_configure)
NOTE: recipe libpcre2-10.44-r0: task do_configure: Started
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: Running task 1811 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: recipe nettle-3.10-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1812 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_compile_ptest_base)
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe nettle-3.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package unihash changed to 8d9e8697965f82a9be0a239fc9fe98e3588f4c95ec0f14cd49d5a3655ca763be
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata became valid
NOTE: recipe zstd-1.5.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_package unihash changed to a35ba20b66a0126c7db165f03276662bdbce1c3967dd01c7f4d54e7e8ebe5c5c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata became valid
NOTE: Running setscene task 887 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1813 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_install)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10-r0: task do_install: Started
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1820 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1822 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1823 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1824 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe nettle-3.10-r0: task do_install: Succeeded
NOTE: Running task 1825 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_install_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1826 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r0: task do_configure: Succeeded
NOTE: Running task 1827 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: recipe nettle-3.10-r0: task do_install_ptest_base: Started
NOTE: recipe iptables-1.8.10-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe nettle-3.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1829 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe libpam-1.6.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1830 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r0: task do_compile: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_compile: Succeeded
NOTE: Running task 1831 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r0: task do_install: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1832 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install)
NOTE: recipe libpam-1.6.1-r0: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_install: Succeeded
NOTE: Running task 1833 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_package)
NOTE: recipe lzlib-1.14-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1834 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1835 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe lzlib-1.14-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_package unihash changed to ce9d57f2ec3ec5d28ff01e77e0b973e050859376e99bdfa496c48f23a41f3b73
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_create_spdx became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_create_spdx_setscene)
NOTE: recipe lzlib-1.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1836 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_compile_ptest_base)
NOTE: recipe lzlib-1.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1837 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_install)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_install: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1841 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package)
NOTE: recipe libgpg-error-1.49-r0: task do_package: Started
NOTE: recipe file-5.45-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1842 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_compile)
NOTE: recipe libpcre2-10.44-r0: task do_configure: Succeeded
NOTE: Running task 1843 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_compile)
NOTE: recipe file-5.45-r0: task do_compile: Started
NOTE: recipe libpcre2-10.44-r0: task do_compile: Started
NOTE: recipe file-5.45-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_install)
NOTE: recipe file-5.45-r0: task do_install: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1845 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1846 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.45-r0: task do_install: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 1848 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1849 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install_ptest_base)
NOTE: Running task 1850 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1851 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe iptables-1.8.10-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_install: Succeeded
NOTE: Running task 1852 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_compile)
NOTE: Running task 1853 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_install_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1854 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.10-r0: task do_compile: Started
NOTE: recipe openssl-3.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.49-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package unihash changed to dafec661f8ca1842664e38be9d29673dd0b0ac91235e1036cdd49b8d58c59918
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_create_spdx became valid
NOTE: recipe diffutils-3.10-r0: task do_configure: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_create_spdx_setscene)
NOTE: Running task 1855 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package)
NOTE: Running task 1856 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.49-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_package: Started
NOTE: recipe diffutils-3.10-r0: task do_configure_ptest_base: Started
NOTE: recipe diffutils-3.10-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: Running task 1857 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_compile)
NOTE: recipe diffutils-3.10-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1858 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: Running task 1859 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_package)
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe nettle-3.10-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1860 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1861 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_configure)
NOTE: recipe libcap-2.70-r0: task do_configure: Started
NOTE: recipe libcap-2.70-r0: task do_configure: Succeeded
NOTE: Running task 1862 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_compile)
NOTE: recipe libcap-2.70-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package unihash changed to 0788de63f801b5bcfd2e28cf35ed2dcf4a98f5b2c26d8435bce8bb9c93ac7fd2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata became valid
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1863 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1864 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_configure)
NOTE: recipe shadow-4.15.1-r0: task do_configure: Started
NOTE: recipe iptables-1.8.10-r0: task do_compile: Succeeded
NOTE: Running task 1865 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_install)
NOTE: recipe iptables-1.8.10-r0: task do_install: Started
NOTE: recipe libcap-2.70-r0: task do_compile: Succeeded
NOTE: Running task 1866 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_install)
NOTE: recipe libcap-2.70-r0: task do_install: Started
NOTE: recipe iptables-1.8.10-r0: task do_install: Succeeded
NOTE: Running task 1867 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package)
NOTE: recipe file-5.45-r0: task do_package: Started
NOTE: recipe libcap-2.70-r0: task do_install: Succeeded
NOTE: Running task 1868 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot)
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package unihash changed to 7f9c8214d932026c50c4511bffd98ca7b11dd58ae5d27be7749d3a8e9ac3c5e4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata became valid
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot: Started
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1869 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_package)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1870 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.10-r0: task do_compile: Succeeded
NOTE: Running task 1871 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.6.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_configure)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1873 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure)
NOTE: recipe libpcre2-10.44-r0: task do_compile: Succeeded
NOTE: Running task 1874 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_install)
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.5-r0: task do_configure: Started
NOTE: recipe libpcre2-10.44-r0: task do_install: Started
NOTE: recipe file-5.45-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_configure: Succeeded
NOTE: Running task 1875 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package unihash changed to 7ac61a1609d81a8c27d9f9d2789a03be1ee743dd0edc9b54bf478b765e067307
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata became valid
NOTE: recipe libarchive-3.7.4-r0: task do_compile: Started
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_install: Succeeded
NOTE: Running task 1876 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_compile_ptest_base)
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.10-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1877 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_install)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_install: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1878 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Started
NOTE: recipe expat-2.6.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_package unihash changed to 7085f4ff0e524991b68b0dc874047fe300e88ce9c0ae4ca38ff7d9ccd20491ee
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata became valid
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_package unihash changed to 7dc008c5942b2b7a3fbf889867cf97c097792a4b06c2eb9f4c5ce8879d6ea0b4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_create_spdx became valid
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_compile: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_create_spdx_setscene)
NOTE: Running task 1879 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_install)
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_install: Started
NOTE: recipe nettle-3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1880 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_package)
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_install: Succeeded
NOTE: Running task 1882 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_package)
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1889 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: Running task 1891 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.10-r0: task do_install: Succeeded
NOTE: Running task 1892 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1893 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1894 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_configure)
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1895 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_configure)
NOTE: recipe libedit-20240517-3.1-r0: task do_configure: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package unihash changed to 9c61f0ff7041623d32999efd2cd881650d08b195a88869ad3485f9dec285c3d6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1896 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_package: Succeeded
NOTE: Running task 1897 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_package unihash changed to f9ada9dce38f7aa66730f233045dce2b58645e6593ee070f766ff1e692ac77b6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata became valid
NOTE: recipe bash-5.2.21-r0: task do_configure: Started
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_package unihash changed to 2dba11d0a1781c40dbe0af6cff114c2f7cefe0fbe66fb92fda7de53d9df1261d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx became valid
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 1898 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1899 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata)
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1903 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1904 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_configure)
NOTE: recipe libarchive-3.7.4-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe readline-8.2-r0: task do_configure: Started
NOTE: recipe libarchive-3.7.4-r0: task do_install: Started
NOTE: recipe libarchive-3.7.4-r0: task do_install: Succeeded
NOTE: Running task 1906 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot)
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1907 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package)
NOTE: Running task 1908 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libcap-2.70-r0: task do_package: Started
NOTE: recipe findutils-4.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1909 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_compile)
NOTE: recipe findutils-4.10.0-r0: task do_compile: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot unihash changed to b197ea5f120bd23e0d03383cd9694cfd4e749e6fa4cef0fcea3065f84b170906
NOTE: Setscene tasks completed
NOTE: Running task 1910 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package unihash changed to a3ae74763ba49270d3e1340d1ae9e16ca51549280fea6c30e10d299211ad7a6f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_package: Succeeded
NOTE: Running task 1911 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1912 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe libcap-2.70-r0: task do_packagedata: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata: Succeeded
NOTE: Running task 1913 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe openssl-3.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1915 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package)
NOTE: recipe shadow-4.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1916 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_compile)
NOTE: recipe openssl-3.3.1-r0: task do_package: Started
NOTE: recipe shadow-4.15.1-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to e0dcb3d118e0543dae9161a30f44e31d454cf2f0291cb056d3a769ee703794dc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_package unihash changed to f0be038a39a2f72964e4b12acf2e5bc4debeebc37b9dfbf3c44a3c11c7e79eed
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx became valid
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: Running task 1917 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_package unihash changed to d3d532582c91641907ab5148f441f87dc06d257cae6f0a99df41a57bff5578ea
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx became valid
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1919 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1925 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r0: task do_package: Started
NOTE: recipe findutils-4.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1927 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_install)
NOTE: recipe findutils-4.10.0-r0: task do_install: Started
NOTE: recipe shadow-4.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1928 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_install)
NOTE: recipe shadow-4.15.1-r0: task do_install: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_configure: Succeeded
NOTE: Running task 1929 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_compile)
NOTE: recipe libedit-20240517-3.1-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1930 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_configure_ptest_base)
NOTE: recipe libarchive-3.7.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_package unihash changed to e0af520382193464324b65d9c595cf44e8925c8b5941d71a9ba3b0324040746b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata became valid
NOTE: recipe readline-8.2-r0: task do_compile: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure_ptest_base: Started
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: Running task 1931 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_install)
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1932 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_compile)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile: Started
NOTE: recipe readline-8.2-r0: task do_install: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1934 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_package)
NOTE: recipe iptables-1.8.10-r0: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package unihash changed to ea56c4df3c312741174d11486578628afd0526e9de03d727edc371a6696813ab
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1935 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_install: Succeeded
NOTE: Running task 1937 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.15.1-r0: task do_install: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe libpcre2-10.44-r0: task do_package: Succeeded
NOTE: Running task 1938 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_package unihash changed to 4853a3b57b7c62ee14191bf4f2ecc14318660f1a351199aff9727f69d7939dcd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata became valid
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_compile: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: Running task 1939 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_install)
NOTE: recipe gawk-5.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1940 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe findutils-4.10.0-r0: task do_install: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1941 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_package)
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1942 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_package: Started
NOTE: recipe gawk-5.3.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1943 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_install: Succeeded
NOTE: Running task 1945 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_configure)
NOTE: recipe python3-3.12.4-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package unihash changed to effa50351a9900f06d92cd3a052e2be46e029157b333616bf333fa30491a32d2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx became valid
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: Running task 1947 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1949 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-4.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1950 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_configure)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_configure: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1951 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_prepare_recipe_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to 2d05253422d28de7e786e8e35b29c5699b941742bd0ffbc4e4f6a4a84055cae8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx became valid
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_configure: Succeeded
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 873 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running task 1952 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_compile)
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_configure)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_compile: Started
NOTE: recipe procps-4.0.4-r0: task do_configure: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_compile: Succeeded
NOTE: Running task 1954 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_install)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_install: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1956 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_install: Succeeded
NOTE: Running task 1957 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_package: Started
NOTE: recipe bash-5.2.21-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1958 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Started
NOTE: Running task 1959 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1960 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile)
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to 249cb7f6ffba5b2e417b98f4888dcee58fa300a8a26a3bffe61072ee5610fa8f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx became valid
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_compile: Started
NOTE: Running setscene task 885 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running task 1961 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe libedit-20240517-3.1-r0: task do_package: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_package unihash changed to 6dad232d1fb7d956b7448aecf2e6eea55dbbbbdf4c0fe1f6959364b1fb41ec3b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_create_spdx became valid
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 880 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1963 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_configure)
NOTE: recipe shadow-4.15.1-r0: task do_package: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.11-r0: task do_configure: Started
NOTE: Running task 1964 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1968 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1969 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_install_ptest_base)
NOTE: recipe diffutils-3.10-r0: task do_install_ptest_base: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1970 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package)
NOTE: recipe diffutils-3.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1971 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package: Started
NOTE: recipe findutils-4.10.0-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1972 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1973 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1974 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_package)
NOTE: recipe iptables-1.8.10-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_package unihash changed to e5f1a346764bf61d8c97ca612daff67b0f0f5a19a2bf9b7610f6f1e48c8e1823
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_create_spdx_setscene)
NOTE: recipe diffutils-3.10-r0: task do_package: Started
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata_setscene)
NOTE: Running task 1975 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_configure_ptest_base)
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_configure_ptest_base: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1976 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_compile)
NOTE: Running task 1977 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata)
NOTE: recipe perl-5.38.2-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata unihash changed to 3d2af071ea55a64f93162b3054159798629a801d37a3881c41642626a58fc035
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1982 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1983 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.8.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1984 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.8.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1985 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe kmod-32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1986 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_compile_ptest_base)
NOTE: recipe kmod-32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1987 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_configure)
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1988 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_install)
NOTE: recipe socat-1.8.0.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_install: Started
NOTE: recipe bash-5.2.21-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1990 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.10.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package unihash changed to 1aeef7344135eee12448e059eade79cdee1091b967fb0df9acbbeb1d665d1477
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1991 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot)
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot: Started
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1992 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package)
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Succeeded
NOTE: Running task 1993 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1994 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_configure)
NOTE: recipe libgcrypt-1.11.0-r0: task do_package: Started
NOTE: recipe kmod-32-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.2-r0: task do_configure_ptest_base: Started
NOTE: recipe diffutils-3.10-r0: task do_package: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1995 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_package unihash changed to 6c472527f2140e69b2cf78c2aa30ec8cd0cb9f4ce2fdf96ce7b6dd339210beab
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_packagedata became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_compile: Started
NOTE: recipe diffutils-3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1996 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1999 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r0: task do_configure: Succeeded
NOTE: Running task 2000 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r0: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2001 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: recipe which-2.21-r0: task do_compile: Succeeded
NOTE: Running task 2002 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe which-2.21-r0: task do_install: Started
NOTE: recipe which-2.21-r0: task do_install: Succeeded
NOTE: Running task 2003 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2004 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_install)
NOTE: recipe openssl-3.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package unihash changed to b6190cb26779e18c651bbb076151c062f4dc299984d61481c71b20c418bff34b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx became valid
NOTE: recipe which-2.21-r0: task do_package: Started
NOTE: recipe bash-5.2.21-r0: task do_install: Started
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_install)
NOTE: recipe procps-4.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2006 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_compile)
NOTE: recipe libunistring-1.2-r0: task do_install: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2008 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe procps-4.0.4-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_package: Succeeded
NOTE: Running task 2009 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata)
NOTE: recipe libunistring-1.2-r0: task do_install: Succeeded
NOTE: Running task 2011 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package unihash changed to 719881c44950ae7b80a87719958d0439877bbc2576210220c77fc7f7acdc4318
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_deb became valid
NOTE: recipe libidn2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_create_spdx_setscene)
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata unihash changed to 195e3bf65ad8a72f1ea6fe3f0213bd5b69f8c626bb7e14361d5785b03bd7ad7a
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 888 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 889 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_ipk_setscene)
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Started
NOTE: Running task 2012 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_configure)
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running task 2013 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_package)
NOTE: recipe libidn2-2.3.7-r0: task do_configure: Started
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_package: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2016 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2017 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx)
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package unihash changed to d6333c0291855c11079273cbc10a5ead086bfe5f11bc5ad784ac9d1c238c7258
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_ipk became valid
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx: Started
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx_setscene)
NOTE: recipe bc-1.07.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_deb_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_ipk_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2020 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2021 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_create_spdx)
NOTE: recipe procps-4.0.4-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2022 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_install)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_create_spdx: Started
NOTE: Running task 2033 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2034 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_configure_ptest_base)
NOTE: recipe procps-4.0.4-r0: task do_install: Started
NOTE: recipe libunistring-1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gawk-5.3.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libunistring-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2043 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.3.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2044 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_compile)
NOTE: recipe libcap-2.70-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_compile: Started
NOTE: Running task 2045 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.70-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2046 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx)
NOTE: recipe libcap-2.70-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.40.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.40.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2047 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.70-r0: task do_create_spdx: Succeeded
NOTE: Running task 2060 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2061 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2064 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package_write_ipk)
NOTE: recipe util-linux-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 2065 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_compile_ptest_base)
NOTE: recipe libunistring-1.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_package unihash changed to d101e57f4adff9422cdf5b5f889d6b0c58f7f63e495a444f7b89ad6f77559c2c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_create_spdx became valid
NOTE: recipe util-linux-2.40.2-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.2.21-r0: task do_install: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_ipk: Started
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_create_spdx_setscene)
NOTE: Running task 2066 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_install_ptest_base)
NOTE: recipe libunistring-1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_install_ptest_base: Started
NOTE: recipe libunistring-1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.4-r0: task do_install: Succeeded
NOTE: Running task 2067 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_package: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2070 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_collect_spdx_deps)
NOTE: recipe libidn2-2.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libidn2-2.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2071 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package_write_deb)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_deb: Started
NOTE: Running task 2072 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package_write_rpm)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_deb: Succeeded
NOTE: Running task 2075 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2078 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2084 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.40.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2085 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_install)
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.7.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libarchive-3.7.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_install: Started
NOTE: Running task 2094 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2095 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx)
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2096 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: recipe kmod-32-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2097 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_compile)
NOTE: recipe kmod-32-r0: task do_compile: Started
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2107 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2109 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2114 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx)
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx: Started
NOTE: recipe python3-3.12.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.12.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2118 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_collect_spdx_deps)
NOTE: recipe procps-4.0.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package unihash changed to c251c0499ff0e28bbf730336125c387c83ac6c142afbf6c83e00fc0b53c76235
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_ipk became valid
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Started
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_deb_setscene)
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_create_spdx became valid
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_ipk_setscene)
NOTE: recipe procps-4.0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 2119 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: recipe procps-4.0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: recipe procps-4.0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 2121 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_collect_spdx_deps)
NOTE: recipe procps-4.0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.21-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-5.2.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 2122 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2125 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe socat-1.8.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2127 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2128 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_collect_spdx_deps)
NOTE: recipe socat-1.8.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2129 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_collect_spdx_deps)
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-32-r0: task do_collect_spdx_deps: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2145 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_rpm)
NOTE: recipe kmod-32-r0: task do_compile: Succeeded
NOTE: Running task 2146 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_install)
NOTE: recipe kmod-32-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2149 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: Running task 2150 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_create_spdx)
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-32-r0: task do_install: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: Running task 2151 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: recipe bash-5.2.21-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2152 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package)
NOTE: recipe util-linux-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 2153 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_install_ptest_base)
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: recipe socat-1.8.0.0-r0: task do_configure: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 2154 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_compile)
NOTE: recipe util-linux-2.40.2-r0: task do_install_ptest_base: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 2158 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe socat-1.8.0.0-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm unihash changed to 739a99a98feedfadecf41a5e7060d65a3be5f5e8c7b1749eb47a9e258be0c149
NOTE: Running task 2159 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package_qa)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_qa: Started
NOTE: recipe kmod-32-r0: task do_install: Succeeded
NOTE: Running task 2160 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package)
NOTE: recipe kmod-32-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package_qa unihash changed to 0cba67feb371dc4d5345258763629ad79cc38ce5641709ecbfa5c1466e9c6faf
NOTE: Running task 2161 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot)
NOTE: recipe util-linux-2.40.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot: Started
NOTE: Running task 2162 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm unihash changed to 738419b1eead4ba6cdabc24ee4fb66ce166144c6f0027c36c2a68abf78158d73
NOTE: Running task 2163 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package)
NOTE: recipe kmod-32-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot unihash changed to ab86c75b557a8245eb312948f7d65effdbf510fa01dccbc4373f7113a6cc8e4e
NOTE: Setscene tasks completed
NOTE: Running task 2164 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_create_package_spdx)
NOTE: recipe util-linux-2.40.2-r0: task do_package: Started
NOTE: recipe socat-1.8.0.0-r0: task do_compile: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_create_package_spdx: Started
NOTE: Running task 2165 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_install)
NOTE: recipe socat-1.8.0.0-r0: task do_install: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2166 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2167 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_build)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2168 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_compile_ptest_base)
NOTE: recipe socat-1.8.0.0-r0: task do_install: Succeeded
NOTE: Running task 2169 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package)
NOTE: recipe gawk-5.3.0-r0: task do_compile_ptest_base: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package: Started
NOTE: recipe gawk-5.3.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2171 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2172 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure)
NOTE: recipe kmod-32-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package unihash changed to 2a000ec2891c29f8c5342a2dc0fbb1d23fbd771811c371b76340f19828915dd0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata became valid
NOTE: recipe gawk-5.3.0-r0: task do_install: Started
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_ipk_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Started
NOTE: recipe kmod-32-r0: task do_package_write_deb_setscene: Started
NOTE: recipe kmod-32-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_rpm unihash changed to a22fbff97912340276889cfae69e8802fb8b3bd40531a0dac7bc37830a40f693
NOTE: recipe kmod-32-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2174 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_create_spdx)
NOTE: Running task 2177 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_rpm)
NOTE: recipe kmod-32-r0: task do_create_spdx: Started
NOTE: recipe kmod-32-r0: task do_package_write_rpm: Started
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to abac081ada69abebce6a2a4cc894268be5742f7319fecf1f43da9a9e51369110
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-32-r0: task do_create_spdx: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe grep-3.11-r0: task do_configure: Succeeded
NOTE: Running task 2179 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_compile)
NOTE: recipe kmod-32-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_rpm unihash changed to e2646f3f0738fdb0cfa33e815f73cbf96fc64ddeeb4aac8b1f4cdb642dc9608a
NOTE: recipe grep-3.11-r0: task do_compile: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package unihash changed to fa50fcb7836be39c4153eceb0e15237345d5365db2d1160bd282b76d70f64aad
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_ipk became valid
NOTE: Running setscene task 886 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 887 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_create_spdx_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_configure: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 2180 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure_ptest_base)
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_packagedata_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2181 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile)
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2186 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_rpm)
NOTE: recipe gawk-5.3.0-r0: task do_install: Succeeded
NOTE: Running task 2187 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_compile: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.3.0-r0: task do_install_ptest_base: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_rpm unihash changed to c04200a62a75a6016df602de64ad0d755d356cd757375dead49ff9c476e92804
NOTE: recipe python3-3.12.4-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_package: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_configure_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package unihash changed to b1d0de551ef4e6869e2e8933502cee1a9445a8229f5778a5cb03896cd135133a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_ipk became valid
NOTE: recipe python3-3.12.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 882 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: Running setscene task 889 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_ipk_setscene)
NOTE: Running task 2189 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_compile)
NOTE: recipe xz-5.4.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_compile: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2194 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_rpm)
NOTE: Running task 2197 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm: Started
NOTE: recipe xz-5.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.3.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2198 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package)
NOTE: recipe gawk-5.3.0-r0: task do_package: Started
NOTE: recipe grep-3.11-r0: task do_compile: Succeeded
NOTE: Running task 2199 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_install)
NOTE: recipe grep-3.11-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Running task 2200 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_rpm unihash changed to 85b5f7b48928106d23b1fad23ba9e06414ba92a195f20742b64f70e28cdd9981
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe grep-3.11-r0: task do_install: Succeeded
NOTE: Running task 2201 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package)
NOTE: recipe grep-3.11-r0: task do_package: Started
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 2203 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe xz-5.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_rpm unihash changed to 046e5223908816be293f75919742c402ae469397e80b759367ad2bd54c1977d2
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Succeeded
NOTE: Running task 2204 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure_ptest_base)
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 2205 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2206 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2207 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_compile)
NOTE: recipe libidn2-2.3.7-r0: task do_compile: Started
NOTE: recipe gawk-5.3.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package unihash changed to a60389e2c1b34536aeaaa9c53a0e829d23524bc4d1a8d66f5a274555fd1fde49
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package unihash changed to 5dd9369f895c3b3b94489091aeac61ea41e4baabf0dfdc6104d507522f8fbb99
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_create_spdx became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_ipk_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe grep-3.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe grep-3.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2213 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_rpm)
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to cc601e658fa8d67755737f3d79a5746264fe5165126c41b43fd39120657fbbc3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2214 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2216 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_ipk)
NOTE: recipe libidn2-2.3.7-r0: task do_install: Started
NOTE: Running task 2217 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_deb)
NOTE: Running task 2218 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.5-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile_ptest_base)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_deb unihash changed to 1733a3fd7cd1dbfec1a0799b81ac13d561ad63ca1b9fa3ae998818c28c77df07
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2220 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_ipk unihash changed to 44bcbeb593b4e939b5e9fad53536b4075902afa60c5e5948a8e5d5f27049330b
NOTE: recipe coreutils-9.5-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_rpm unihash changed to f792c67949000488d046c046c5cf2baff1a208c6249da1655eb4170510763e13
NOTE: recipe libidn2-2.3.7-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot)
NOTE: Running task 2222 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_package)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.7-r0: task do_package: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot unihash changed to c37f4b64e7ce67ac95f4cca909d642e042c4aa1190a3ef3c1df34bde14ee20fb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_populate_sysroot became valid
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_rpm unihash changed to e8025a97c7c94335544fcdf0d6a39a774200903c793edd9d70c0244c41bdbb22
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 2223 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2224 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2225 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_configure)
NOTE: recipe curl-8.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2226 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_configure)
NOTE: recipe gnutls-3.8.6-r0: task do_configure: Started
NOTE: recipe curl-8.9.1-r0: task do_configure: Started
NOTE: recipe coreutils-9.5-r0: task do_install: Succeeded
NOTE: Running task 2227 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Started
NOTE: recipe libidn2-2.3.7-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_package unihash changed to 339ff3a60e30710cdb6b007dd7f7cb390b71107dcf39677cfb5961d3f91cd0e3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2229 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.7-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2230 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package)
NOTE: Running task 2231 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_populate_sysroot)
NOTE: recipe coreutils-9.5-r0: task do_populate_sysroot: Started
NOTE: recipe coreutils-9.5-r0: task do_package: Started
NOTE: recipe libidn2-2.3.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2232 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_collect_spdx_deps)
NOTE: Running task 2233 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.40.2-r0: task do_package: Failed
NOTE: recipe curl-8.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnutls-3.8.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_package: Succeeded
NOTE: recipe linux-yocto-6.10.3+git-r0: task do_compile: Succeeded
NOTE: recipe curl-8.9.1-r0: task do_configure: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_compile: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2233 tasks of which 1488 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815054047.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815054047.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-2.40.2-r0 do_package: QA Issue: util-linux: Files/directories were installed but not shipped in any package:
  /usr/lib/security/pam_lastlog2.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
util-linux: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: util-linux-2.40.2-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux/2.40.2/temp/log.do_package.3816642
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package) failed with exit code '1'

--===============1172546336034834199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGSIZE changed from 30856 to 34952 (+13%)
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PKGSIZE changed from 39032 to 43128 (+10%)
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PKGSIZE changed from 18560 to 22656 (+22%)
packages/core2-64-poky-linux/util-linux/util-linux-rename: PKGSIZE changed from 22640 to 30832 (+36%)
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2 was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8000.2-gdb.py was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8000.2-gdb.py was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2 was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8000.2-gdb.py was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8000.2-gdb.py was removed

--===============1172546336034834199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9422342 to 9620507 (+2%)
packages/core2-64-poky-linux/util-linux-libuuid: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.2.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c"
packages/core2-64-poky-linux/util-linux-libuuid: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGSIZE changed from 64096 to 66992 (+5%)
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PKGSIZE changed from 89275 to 89786 (+1%)
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGSIZE changed from 30856 to 34952 (+13%)
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.2.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c"
packages/core2-64-poky-linux/util-linux: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PKGSIZE changed from 108658 to 108781 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkdiscard: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-blkdiscard: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkpr: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-blkpr: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkzone: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-blkzone: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blockdev: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-blockdev: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-cal: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-cal: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-cfdisk: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-cfdisk: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chcpu: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-chcpu: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chmem: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-chmem: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-choom: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-choom: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chrt: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-chrt: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-col: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-col: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-colcrt: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-colcrt: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-column: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-column: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PKGSIZE changed from 39032 to 43128 (+10%)
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGSIZE changed from 26039216 to 26096416 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dev: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-dev: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-doc: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGSIZE changed from 925857 to 925900 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-eject: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-eject: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-exch: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-exch: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fadvise: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-fadvise: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fallocate: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-fallocate: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fcntl-lock: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-fcntl-lock: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fincore: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-fincore: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-findfs: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-findfs: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-flock: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-flock: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsck.cramfs: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-fsck.cramfs: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PKGSIZE changed from 55472 to 59568 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsfreeze: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-fsfreeze: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fstrim: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-fstrim: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-getopt: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-getopt: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hexdump: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-hexdump: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hwclock: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-hwclock: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ionice: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-ionice: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcmk: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-ipcmk: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-isosize: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-isosize: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-kill: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-kill: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-last: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-last: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lastlog2: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lastlog2: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ldattach: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-ldattach: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-liblastlog2: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-liblastlog2: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PKGSIZE changed from 457385 to 461481 (+1%)
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PKGSIZE changed from 42462 to 42372 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGSIZE changed from 588676 to 588636 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGSIZE changed from 399882 to 399845 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGSIZE changed from 582875 to 582829 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGSIZE changed from 561655 to 562683 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PKGSIZE changed from 80546 to 80506 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGSIZE changed from 601821 to 601774 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGSIZE changed from 577183 to 577138 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PKGSIZE changed from 39433 to 39391 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PKGSIZE changed from 42965 to 42927 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PKGSIZE changed from 31706 to 31672 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGSIZE changed from 428571 to 429943 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PKGSIZE changed from 56707 to 56609 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGSIZE changed from 589753 to 589713 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 330598 to 330557 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGSIZE changed from 582239 to 582190 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGSIZE changed from 485074 to 485033 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGSIZE changed from 476452 to 476418 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGSIZE changed from 612373 to 612319 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PKGSIZE changed from 31114 to 31069 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGSIZE changed from 677010 to 676953 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGSIZE changed from 444994 to 444946 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGSIZE changed from 348598 to 348557 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGSIZE changed from 750380 to 750313 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGSIZE changed from 315534 to 315497 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGSIZE changed from 372564 to 372528 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PKGSIZE changed from 47373 to 47337 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-logger: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-logger: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-look: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-look: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsclocks: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lsclocks: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PKGSIZE changed from 157816 to 161912 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PKGSIZE changed from 208104 to 212200 (+2%)
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lslocks: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lslocks: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsmem: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lsmem: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mcookie: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-mcookie: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mesg: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-mesg: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkfs.cramfs: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-mkfs.cramfs: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkfs: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-mkfs: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-more: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-more: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mount: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-mount: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mountpoint: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-mountpoint: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-namei: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-namei: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PKGSIZE changed from 18560 to 22656 (+22%)
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-partx: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-partx: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PKGSIZE changed from 59512 to 63608 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGSIZE changed from 6120584 to 6121044 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rename: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-rename: PKGSIZE changed from 22640 to 30832 (+36%)
packages/core2-64-poky-linux/util-linux/util-linux-rename: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-renice: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-renice: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-resizepart: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-resizepart: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rev: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-rev: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rfkill: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-rfkill: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rtcwake: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-rtcwake: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-runuser: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-runuser: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-script: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-script: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-scriptlive: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-scriptlive: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-scriptreplay: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-scriptreplay: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setpgid: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-setpgid: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setsid: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-setsid: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setterm: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-setterm: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-src: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-src: PKGSIZE changed from 5932937 to 5939575 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-src: FILELIST: directory renamed /usr/src/debug/util-linux/2.40.1/libblkid/src -> /usr/src/debug/util-linux/2.40.2/libblkid/src, directory renamed /usr/src/debug/util-linux/2.40.1/schedutils -> /usr/src/debug/util-linux/2.40.2/schedutils, directory renamed /usr/src/debug/util-linux/2.40.1/term-utils -> /usr/src/debug/util-linux/2.40.2/term-utils, directory renamed /usr/src/debug/util-linux/2.40.1/disk-utils -> /usr/src/debug/util-linux/2.40.2/disk-utils, directory renamed /usr/src/debug/util-linux/2.40.1/text-utils -> /usr/src/debug/util-linux/2.40.2/text-utils, directory renamed /usr/src/debug/util-linux/2.40.1/libuuid/src -> /usr/src/debug/util-linux/2.40.2/libuuid/src, directory renamed /usr/src/debug/util-linux/2.40.1/libfdisk/samples -> /usr/src/debug/util-linux/2.40.2/libfdisk/samples, directory renamed /usr/src/debug/util-linux/2.40.1/Documentation -> /usr/src/debug/util-linux/2.40.2/Documentation, directory renamed /usr/src/d
 ebug/util-linux/2.40.1/include -> /usr/src/debug/util-linux/2.40.2/include, directory renamed /usr/src/debug/util-linux/2.40.1/libfdisk/src -> /usr/src/debug/util-linux/2.40.2/libfdisk/src, directory renamed /usr/src/debug/util-linux/2.40.1/libblkid/src/superblocks -> /usr/src/debug/util-linux/2.40.2/libblkid/src/superblocks, directory renamed /usr/src/debug/util-linux/2.40.1/libblkid/src/partitions -> /usr/src/debug/util-linux/2.40.2/libblkid/src/partitions, directory renamed /usr/src/debug/util-linux/2.40.1/liblastlog2/src -> /usr/src/debug/util-linux/2.40.2/liblastlog2/src, directory renamed /usr/src/debug/util-linux/2.40.1/tests/helpers -> /usr/src/debug/util-linux/2.40.2/tests/helpers, directory renamed /usr/src/debug/util-linux/2.40.1/libblkid/samples -> /usr/src/debug/util-linux/2.40.2/libblkid/samples, directory renamed /usr/src/debug/util-linux/2.40.1/libmount/src -> /usr/src/debug/util-linux/2.40.2/libmount/src, directory renamed /usr/src/debug/util-linux/2.40.1/login-util
 s -> /usr/src/debug/util-linux/2.40.2/login-utils, directory renamed /usr/src/debug/util-linux/2.40.1 -> /usr/src/debug/util-linux/2.40.2, directory renamed /usr/src/debug/util-linux/2.40.1/lib -> /usr/src/debug/util-linux/2.40.2/lib, directory renamed /usr/src/debug/util-linux/2.40.1/libblkid/src/topology -> /usr/src/debug/util-linux/2.40.2/libblkid/src/topology, directory renamed /usr/src/debug/util-linux/2.40.1/libsmartcols/src -> /usr/src/debug/util-linux/2.40.2/libsmartcols/src, directory renamed /usr/src/debug/util-linux/2.40.1/pam_lastlog2/src -> /usr/src/debug/util-linux/2.40.2/pam_lastlog2/src, directory renamed /usr/src/debug/util-linux/2.40.1/sys-utils -> /usr/src/debug/util-linux/2.40.2/sys-utils, directory renamed /usr/src/debug/util-linux/2.40.1/libmount/samples -> /usr/src/debug/util-linux/2.40.2/libmount/samples, directory renamed /usr/src/debug/util-linux/2.40.1/libsmartcols/samples -> /usr/src/debug/util-linux/2.40.2/libsmartcols/samples, removed "/usr/src/debug/ut
 il-linux/2.40.1/misc-utils/hardlink.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsblk-properties.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-fifo.c /usr/src/debug/util-linux/2.40.1/misc-utils/uuidparse.c /usr/src/debug/util-linux/2.40.1/misc-utils/findfs.c /usr/src/debug/util-linux/2.40.1/misc-utils/wipefs.c /usr/src/debug/util-linux/2.40.1/misc-utils/test_uuidd.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-cdev.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsclocks.c /usr/src/debug/util-linux/2.40.1/misc-utils/waitpid.c /usr/src/debug/util-linux/2.40.1/misc-utils/cal.c /usr/src/debug/util-linux/2.40.1/misc-utils/mcookie.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-file.c /usr/src/debug/util-linux/2.40.1/misc-utils/getopt.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsblk-devtree.c /usr/src/debug/util-linux/2.40.1/misc-utils/fadvise.c /usr/src/debug/util-linux/2.40.1/misc-utils/findmnt.h /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-sock-xinfo.c /usr/src/debu
 g/util-linux/2.40.1/misc-utils/findmnt.c /usr/src/debug/util-linux/2.40.1/misc-utils/uuidgen.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-unkn.c /usr/src/debug/util-linux/2.40.1/misc-utils/fincore.c /usr/src/debug/util-linux/2.40.1/misc-utils/pipesz.c /usr/src/debug/util-linux/2.40.1/misc-utils/blkid.c /usr/src/debug/util-linux/2.40.1/misc-utils/uuidd.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd.h /usr/src/debug/util-linux/2.40.1/misc-utils/lslocks.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsblk-mnt.c /usr/src/debug/util-linux/2.40.1/misc-utils/findmnt-verify.c /usr/src/debug/util-linux/2.40.1/misc-utils/kill.c /usr/src/debug/util-linux/2.40.1/misc-utils/look.c /usr/src/debug/util-linux/2.40.1/misc-utils/exch.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-bdev.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd.c /usr/src/debug/util-linux/2.40.1/misc-utils/whereis.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-sock.h /usr/src/debug/util-linux/2.40.1/misc-utils
 /lsfd-decode-file-flags.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-sock.c /usr/src/debug/util-linux/2.40.1/misc-utils/namei.c /usr/src/debug/util-linux/2.40.1/misc-utils/lastlog2.c /usr/src/debug/util-linux/2.40.1/misc-utils/enosys.c /usr/src/debug/util-linux/2.40.1/misc-utils/logger.c /usr/src/debug/util-linux/2.40.1/misc-utils/rename.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsblk.h /usr/src/debug/util-linux/2.40.1/misc-utils/lsblk.c", added "/usr/src/debug/util-linux/2.40.2/misc-utils/hardlink.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsblk-properties.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-fifo.c /usr/src/debug/util-linux/2.40.2/misc-utils/uuidparse.c /usr/src/debug/util-linux/2.40.2/misc-utils/findfs.c /usr/src/debug/util-linux/2.40.2/misc-utils/wipefs.c /usr/src/debug/util-linux/2.40.2/misc-utils/test_uuidd.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-cdev.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsclocks.c /usr/src/debug/util-linux/2.40.2
 /misc-utils/waitpid.c /usr/src/debug/util-linux/2.40.2/misc-utils/cal.c /usr/src/debug/util-linux/2.40.2/misc-utils/mcookie.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-file.c /usr/src/debug/util-linux/2.40.2/misc-utils/getopt.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-pidfd.h /usr/src/debug/util-linux/2.40.2/misc-utils/fadvise.c /usr/src/debug/util-linux/2.40.2/misc-utils/findmnt.h /usr/src/debug/util-linux/2.40.2/misc-utils/lsblk-devtree.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-sock-xinfo.c /usr/src/debug/util-linux/2.40.2/misc-utils/findmnt.c /usr/src/debug/util-linux/2.40.2/misc-utils/uuidgen.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-pidfd.c /usr/src/debug/util-linux/2.40.2/misc-utils/fincore.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-unkn.c /usr/src/debug/util-linux/2.40.2/misc-utils/blkid.c /usr/src/debug/util-linux/2.40.2/misc-utils/pipesz.c /usr/src/debug/util-linux/2.40.2/misc-utils/uuidd.c /usr/src/debug/util-linux/2.40.2/misc-utils
 /lsfd.h /usr/src/debug/util-linux/2.40.2/misc-utils/lslocks.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsblk-mnt.c /usr/src/debug/util-linux/2.40.2/misc-utils/findmnt-verify.c /usr/src/debug/util-linux/2.40.2/misc-utils/kill.c /usr/src/debug/util-linux/2.40.2/misc-utils/look.c /usr/src/debug/util-linux/2.40.2/misc-utils/exch.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-bdev.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd.c /usr/src/debug/util-linux/2.40.2/misc-utils/whereis.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-sock.h /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-decode-file-flags.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-sock.c /usr/src/debug/util-linux/2.40.2/misc-utils/namei.c /usr/src/debug/util-linux/2.40.2/misc-utils/lastlog2.c /usr/src/debug/util-linux/2.40.2/misc-utils/enosys.c /usr/src/debug/util-linux/2.40.2/misc-utils/logger.c /usr/src/debug/util-linux/2.40.2/misc-utils/rename.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsblk.h /usr/
 src/debug/util-linux/2.40.2/misc-utils/lsblk.c"
packages/core2-64-poky-linux/util-linux/util-linux-src: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-staticdev: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-staticdev: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-su: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-su: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-sulogin: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-sulogin: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swaplabel: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-swaplabel: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swaponoff: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-swaponoff: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-switch-root: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-switch-root: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-taskset: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-taskset: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uclampset: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-uclampset: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ul: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-ul: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-umount: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-umount: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-unshare: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-unshare: PKGSIZE changed from 88432 to 92528 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-unshare: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-utmpdump: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-utmpdump: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidgen: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-uuidgen: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidparse: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-uuidparse: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-waitpid: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-waitpid: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wall: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-wall: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wipefs: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-wipefs: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-write: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-write: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2 was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8000.2-gdb.py was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8000.2-gdb.py was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2 was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8000.2-gdb.py was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.80.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8000.2-gdb.py was removed

--===============1172546336034834199==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-util-linux-libuuid-upgrade-2.40.1-2.40.2-.patch"

RnJvbSA1YmU3MDQxYTMwZGM0NWQ5YTM0ZjdiMGZiZWIzODkzZjM3Y2ZiN2M1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMDU6NDc6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4LHV0aWwtbGludXgtbGlidXVpZDogdXBncmFkZSAyLjQwLjEgLT4KIDIuNDAuMiwy
LjQwLjEgLT4gMi40MC4yCgotLS0KIC4uLmxpbnV4LWxpYnV1aWRfMi40MC4xLmJiID0+IHV0aWwt
bGludXgtbGlidXVpZF8yLjQwLjIuYmJ9IHwgMAogbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51
eC91dGlsLWxpbnV4LmluYyAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4vdXRpbC1saW51eC91
dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgICB8IDQgKystLQogLi4u
L3V0aWwtbGludXgvdXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaCAgICAgICAgICAg
fCA0ICsrLS0KIC4uLi91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0
Y2ggICAgICAgICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4L3B0ZXN0LnBhdGNoICAgICAgICAgfCA2ICsrKy0tLQogLi4uL3t1dGlsLWxpbnV4XzIuNDAu
MS5iYiA9PiB1dGlsLWxpbnV4XzIuNDAuMi5iYn0gICAgICAgICAgfCAwCiA3IGZpbGVzIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3t1dGlsLWxpbnV4LWxpYnV1aWRfMi40MC4xLmJiID0+IHV0aWwtbGlu
dXgtbGlidXVpZF8yLjQwLjIuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgve3V0aWwtbGludXhfMi40MC4xLmJiID0+IHV0aWwtbGludXhfMi40MC4yLmJifSAo
MTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgtbGlidXVpZF8yLjQwLjEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgtbGlidXVpZF8yLjQwLjIuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDAuMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1
aWRfMi40MC4yLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXguaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4Lmlu
YwppbmRleCAwZjVmODM4ZTg0Li5kMmMxMjMxMzc1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eC5pbmMKQEAgLTQwLDQgKzQwLDQgQEAgU1JDX1VSSSA9ICIke0tF
Uk5FTE9SR19NSVJST1J9L2xpbnV4L3V0aWxzL3V0aWwtbGludXgvdiR7TUFKT1JfVkVSU0lPTn0v
dXRpbC1saW4KICAgICAgICAgICAgZmlsZTovL2ZjbnRsLWxvY2suYyBcCiAgICAgICAgICAgICIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU5ZTY3NmFhNTNjY2I0NGI2YzM5ZjBmZmUwMWE4ZmEy
NzQ4OTFjOTFiZWYxNDc0NzUyZmFkOTI0NjFkZWYyNGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZDc4YjM3YTY2ZjU5MjJkNzBlZGYzYmRmYjAxYTZiMzNkMzRlZDNjM2NhZmQ2NjI4MjAzYjJhMmI2
N2M4ZThiMyIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAppbmRleCA4ZWEwMGRi
Yjk1Li41YmEzOTJiMmNmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4
L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBkYTU4YjQxNTBmNjkzMmRlMzZjOTYyZWE2NTc3MTNiY2Y0ZWE0
NGJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzZGNjZDc5YmMxNzk2ZjEwNTU1NTQz
ODlmOTdhNTI2NjBkYzAyZmI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3Ig
RmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBNb24sIDE0IEp1biAyMDIxIDE0
OjAwOjMxICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHV0aWwtbGludXg6IEFkZCBwdGVzdApAQCAt
MTQsNyArMTQsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUKICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZp
Z3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNjUxZWYyYi4uMmE4MDEyZSAxMDA2NDQKK2lu
ZGV4IGFmODZlMWUuLjAzNzVkMjkgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2Nv
bmZpZ3VyZS5hYwogQEAgLTExLDcgKzExLDcgQEAgQUNfQ09ORklHX01BQ1JPX0RJUihbbTRdKQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZp
Z3VyZS1zYmluZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoCmluZGV4IDc0YWJkYzIwMzguLjU1YzFmNTk2Nzkg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25m
aWd1cmUtc2JpbmRpci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAz
ODdkNzE1MTZjOTc4ODk5Y2ZkNTU2Y2E1MTJmNTMwYTIxMmI0YTkgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDZkZjA2NjU1YjYwZjg2NzI0NjNjNzc0MGVlN2I5MTEzOGZhNjNkNGUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQaGlsIEJsdW5kZWxsIDxwYkBwYmNsLm5ldD4K
IERhdGU6IE1vbiwgMjQgU2VwIDIwMTIgMDc6MjQ6NTEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0g
dXRpbC1saW51eDogRW5zdXJlIHRoYXQgJHtzYmluZGlyfSBpcyByZXNwZWN0ZWQKQEAgLTE0LDcg
KzE0LDcgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQog
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggMjM1OTRmZi4uNjUxZWYy
YiAxMDA2NDQKK2luZGV4IDgyZDBlNGIuLmFmODZlMWUgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUu
YWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTExMCw3ICsxMTAsMTAgQEAgQUNfU1VCU1QoW3J1
bnN0YXRlZGlyXSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3Qu
cGF0Y2gKaW5kZXggODcxYjBiMmQzMC4uNTBmNGQzYTllNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRl
c3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rp
c3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ1
NDUwZDAzMzljZDdlZTI3ZjUzYzBmMmZhYzFjYzc0ZWQ5YmJmYjggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGFkNjRiMTYyMmQ2YjE4MWYwYTNiYzkyZDdiMWFiNTc5YWE0Y2YyNmUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZsb3JlYUBl
bmVhLmNvbT4KIERhdGU6IFRodSwgMyBEZWMgMjAxNSAwNDowODowMCArMDEwMAogU3ViamVjdDog
W1BBVENIXSBEaXNwbGF5IHRlc3RuYW1lIGZvciBzdWJ0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2gKaW5kZXggNzM0NTkyNmI4
OC4uYTlmYmQzZDFlYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4L3B0ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC9wdGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjliZTczYzNlMmIw
YTRmMDkyMzk1MGRjYjA1OGJlODVkM2VlOGVkNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNWU4OTQ5ODc2ODEwZjY2YzE1MzkwOGNlMTYwNjIwNmM2ODgyZDNhZSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgog
RGF0ZTogVGh1LCAzIERlYyAyMDE1IDA0OjA4OjAwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERl
ZmluZSBURVNUUyB2YXJpYWJsZQpAQCAtMTAsMTAgKzEwLDEwIEBAIFVwc3RyZWFtLVN0YXR1czog
UGVuZGluZwogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEv
TWFrZWZpbGUuYW0gYi9NYWtlZmlsZS5hbQotaW5kZXggNTBhYjhkMC4uN2UyMzQwZCAxMDA2NDQK
K2luZGV4IDU0ZTBmZDQuLmVlMmQ1NTMgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5hbQogKysrIGIv
TWFrZWZpbGUuYW0KLUBAIC02NCw2ICs2NCw3IEBAIHRtcGZpbGVzX0RBVEEgPQorQEAgLTY1LDYg
KzY1LDcgQEAgdG1wZmlsZXNfREFUQSA9CiAgZGlzdF9iYXNoY29tcGxldGlvbl9EQVRBID0KICBj
aGVja19QUk9HUkFNUyA9CiAgZGlzdF9jaGVja19TQ1JJUFRTID0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjEuYmIgYi9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi40MC4yLmJiCnNpbWlsYXJpdHkgaW5kZXgg
MTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhf
Mi40MC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXhfMi40MC4yLmJiCi0tIAoyLjQ0LjAKCg==

--===============1172546336034834199==--

