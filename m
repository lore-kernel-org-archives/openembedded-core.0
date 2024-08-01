Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A82C54741
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:12 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.75477.1722536821621086683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Ps07ULMb;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3S/A5MOz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101910f31fffa-6df0ceb3-dcd8-4937-8d36-a367331143e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TC+ehyhgd+CtrGh7Wq8ZoVFzdh04OHdKYuQlGpdKpqI=;
	b=Ps07ULMbi5ZAZCO2sTAqZH4q/idLRP2qX54eQQZEYT/+b/9m13vuuvybkrsobplD
	8zubA8gVt0rVmegEErINzIT80n+OwDTpx3DbUw80b21cJdJJe47NsPWrxHUwLHK46Kr
	1jPKXfsODzqUUrPD41162C7jJ7AA4cMTvyrCjri0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TC+ehyhgd+CtrGh7Wq8ZoVFzdh04OHdKYuQlGpdKpqI=;
	b=3S/A5MOzFnxQKYv8aoroeMij9PKcbwOp5/x5VIWRixBMgrt8CtEIlF7ydB3r735D
	FL7H9OuppaK80S3gcrDPW9kzob+S6B42yP8L491NPfNlmK5oPPGhYwymUaXMQr1izxT
	Et384SQGzCXnjzJnKofs/MRApUIhKg2ZVWzXVglg=
Content-Type: multipart/mixed; boundary="===============5163730545614158343=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux,util-linux-libuuid: upgrading to 2.40.2,2.40.2
 FAILED
Message-ID: <010101910f31fffa-6df0ceb3-dcd8-4937-8d36-a367331143e0-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202764

--===============5163730545614158343==
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
From 7aa7d0d23a0527ea9012e8e58d80d94b2efb197a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 05:44:27 +0000
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
index 8ea00dbb95..30504e70e3 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From da58b4150f6932de36c962ea657713bcf4ea44be Mon Sep 17 00:00:00 2001
+From 0f37a4ea34775c757d06982446c7528146e9ea7a Mon Sep 17 00:00:00 2001
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
index 74abdc2038..04c22ecb27 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 0387d71516c978899cfd556ca512f530a212b4a9 Mon Sep 17 00:00:00 2001
+From 83b093d794d87974249cbb852cc684ab17839ce4 Mon Sep 17 00:00:00 2001
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
index 871b0b2d30..257d5aa4ac 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 45450d0339cd7ee27f53c0f2fac1cc74ed9bbfb8 Mon Sep 17 00:00:00 2001
+From 218ca0518a8e2914c51ea8cf01021ff18d57d85b Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index 7345926b88..9b34cf80f5 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From f9be73c3e2b0a4f0923950dcb058be85d3ee8ed7 Mon Sep 17 00:00:00 2001
+From 95632297afedf3c00f05f56f77ba1ef4d97dfbd5 Mon Sep 17 00:00:00 2001
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


--===============5163730545614158343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PKGSIZE changed from 39032 to 43128 (+10%)
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PKGSIZE changed from 18560 to 22656 (+22%)
packages/core2-64-poky-linux/util-linux/util-linux-rename: PKGSIZE changed from 22640 to 26736 (+18%)
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

--===============5163730545614158343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1884 targets, 48 skipped, 0 masked, 0 errors.
Removing 112 recipes from the core2-64 sysroot...done.
Removing 119 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-fd8dc3a2f320f5b8335202ba9f366ed93bf53dd5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fd8dc3a2f320f5b8335202ba9f366ed93bf53dd5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 629 Local 303 Mirrors 0 Missed 326 Current 266 (48% match, 63% complete)
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
NOTE: Running setscene task 367 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 392 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-6.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 393 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_recipe_qa_setscene)
NOTE: recipe iproute2-6.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 394 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 395 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 396 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 400 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 401 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.12.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 405 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 414 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iproute2-6.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 418 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 423 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe grep-3.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 427 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 432 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 436 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 445 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 446 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 448 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 450 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 451 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 458 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe grep-3.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 461 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 466 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe diffutils-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 467 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 469 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 472 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 474 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 478 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 486 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_populate_sysroot_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 498 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 499 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-4.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 508 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 509 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 510 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_recipe_qa_setscene)
NOTE: recipe which-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 515 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 516 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 517 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 518 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 519 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 522 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 523 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 525 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 529 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 531 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 535 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 536 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe grep-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 543 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 546 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 550 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 559 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 560 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 601 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe which-2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 604 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 605 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 606 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 607 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 608 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 611 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 614 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 615 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 618 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe which-2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 621 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 625 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 627 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 628 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 629 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 630 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 631 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 632 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 633 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 635 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 636 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 637 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 639 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 640 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 641 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 642 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 643 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 644 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 652 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 656 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 662 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 680 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 691 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 693 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 701 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 702 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 703 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 706 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 710 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 713 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 720 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 733 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 747 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 819 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 820 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 821 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 822 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 823 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 824 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 825 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 827 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 833 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 834 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 333 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 347 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_fetch)
NOTE: Running task 351 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_fetch)
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 353 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_fetch)
NOTE: Running task 356 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_fetch)
NOTE: Running task 358 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 360 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_fetch)
NOTE: Running setscene task 846 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 362 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 847 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 850 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.49-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 851 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.7-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 854 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 855 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 857 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 722 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_unpack)
NOTE: Running task 724 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 736 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_unpack)
NOTE: Running task 737 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_unpack)
NOTE: Running task 738 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_unpack)
NOTE: Running task 742 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 745 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 748 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 752 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa unihash changed to 9319f74dd17d524fbe7b4e593a7ba1517b2bd8a0adc90794917a2db9bef20016
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.2-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.49-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe xz-5.4.6-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 793 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_unpack: Succeeded
NOTE: Running setscene task 808 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 829 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 830 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 836 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 863 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 753 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_fetch)
NOTE: Running task 754 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: Running task 755 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_patch)
NOTE: Running task 756 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_patch)
NOTE: Running task 757 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_patch)
NOTE: Running task 758 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 759 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 760 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.2-r0: task do_patch: Started
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.9.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe xz-5.4.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 763 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_unpack)
NOTE: recipe libpam-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 764 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 865 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 866 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 867 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running task 766 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 768 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Started
NOTE: recipe libunistring-1.2-r0: task do_patch: Succeeded
NOTE: Running task 772 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_fetch)
NOTE: recipe xz-5.4.6-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 774 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_fetch)
NOTE: Running task 775 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_patch)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: Running task 778 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe libgpg-error-1.49-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_fetch: Started
NOTE: recipe curl-8.8.0-r0: task do_fetch: Started
NOTE: Running task 781 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: Running task 782 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa)
NOTE: Running task 788 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_fetch: Succeeded
NOTE: Running task 790 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_fetch)
NOTE: recipe curl-8.8.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 792 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 794 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 796 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: Running task 798 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe libidn2-2.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 799 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_patch)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa: Started
NOTE: recipe cracklib-2.9.11-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Started
NOTE: Running setscene task 869 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 870 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: Running task 800 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 801 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 802 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 803 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 804 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Started
NOTE: Running task 806 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_fetch)
NOTE: recipe libpam-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 807 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_patch)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Started
NOTE: Running task 808 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running task 809 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.3.1-r0: task do_patch: Succeeded
NOTE: Running task 810 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 813 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_unpack)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa: Started
NOTE: Running task 814 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_unpack)
NOTE: recipe expat-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 817 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_fetch)
NOTE: Running task 818 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 819 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running noexec task 821 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_fetch)
NOTE: Running task 822 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 823 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 826 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_unpack)
NOTE: recipe libcap-2.70-r0: task do_fetch: Started
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_unpack: Started
NOTE: recipe curl-8.8.0-r0: task do_unpack: Started
NOTE: Running setscene task 871 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.70-r0: task do_fetch: Succeeded
NOTE: Running setscene task 872 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 873 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 829 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_unpack)
NOTE: Running task 830 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_unpack: Succeeded
NOTE: Running task 831 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 832 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_unpack)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 833 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_fetch)
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 834 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 836 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_patch: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running noexec task 838 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_fetch)
NOTE: Running task 840 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 841 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_patch)
NOTE: recipe libgcc-14.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 844 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: Running task 845 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 874 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 875 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 876 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: Running setscene task 877 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 847 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 848 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_fetch)
NOTE: recipe curl-8.8.0-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 849 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 850 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 851 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: Running task 852 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Started
NOTE: recipe expat-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 862 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_deploy_source_date_epoch unihash changed to 9efbb404352a55ba0e97adb6b047d8debe9a695bd3c29a8534039d8683b70ef4
NOTE: recipe bash-completion-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.6-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe curl-8.8.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.6-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-initial-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Started
NOTE: recipe curl-8.8.0-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running setscene task 820 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 821 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 822 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 883 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 865 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: Running task 866 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: Running task 875 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_unpack)
NOTE: Running task 878 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 879 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: Running task 880 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_unpack)
NOTE: Running task 891 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_fetch)
NOTE: Running task 895 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_generate_toolchain_file)
NOTE: Running task 897 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.6-r0: task do_unpack: Started
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 899 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: Running setscene task 884 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 901 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: Running setscene task 885 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 922 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_unpack)
NOTE: recipe expat-2.6.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_unpack: Succeeded
NOTE: Running task 928 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 929 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_patch)
NOTE: Running task 930 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libcap-2.70-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: Running task 931 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 934 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: Running task 936 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_patch: Started
NOTE: Running task 938 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: recipe lzlib-1.14-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 940 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe lzlib-1.14-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: Running task 944 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 945 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 946 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: Running task 947 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: Running task 950 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 951 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_fetch)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Started
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Started
NOTE: recipe libcap-2.70-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: Running task 956 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe libffi-3.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 958 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_fetch)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 959 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: Running task 960 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 961 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 962 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libedit-20240517-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 963 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_collect_spdx_deps)
NOTE: recipe file-5.45-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 970 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: Running task 971 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.12.4-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Started
NOTE: Running noexec task 973 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running noexec task 974 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 975 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe python3-3.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 976 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe file-5.45-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 886 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 978 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_patch)
NOTE: Running task 979 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_patch)
NOTE: Running task 980 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: Running task 981 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running task 982 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 983 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running task 984 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_fetch)
NOTE: Running task 988 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: Running task 991 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: Running task 993 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe lzlib-1.14-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.6-r0: task do_patch: Started
NOTE: recipe elfutils-0.191-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.4-r0: task do_fetch: Succeeded
NOTE: Running task 995 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_fetch)
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Started
NOTE: Running task 996 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_unpack)
NOTE: recipe lzlib-1.14-r0: task do_unpack: Succeeded
NOTE: Running task 997 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_patch)
NOTE: recipe elfutils-0.191-r0: task do_fetch: Succeeded
NOTE: Running task 998 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_unpack)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: Running task 1005 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Started
NOTE: recipe lzlib-1.14-r0: task do_patch: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_fetch: Succeeded
NOTE: Running task 1006 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1007 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_patch)
NOTE: recipe libedit-20240517-3.1-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_patch: Succeeded
NOTE: Running task 1008 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_patch)
NOTE: Running task 1010 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_unpack)
NOTE: Running task 1012 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 1015 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: recipe file-5.45-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 1016 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libffi-3.4.6-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1018 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: Running task 1019 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 1020 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_unpack)
NOTE: recipe python3-3.12.4-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1021 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_patch: Succeeded
NOTE: Running task 1023 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1024 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1025 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe coreutils-9.5-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: Running task 1026 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: Running task 1027 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe coreutils-9.5-r0: task do_fetch: Succeeded
NOTE: Running task 1030 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.4-r0: task do_unpack: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1031 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_patch)
NOTE: Running task 1033 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_fetch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 1034 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: Running task 1035 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1036 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_unpack)
NOTE: Running task 1037 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1038 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe elfutils-0.191-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_fetch: Succeeded
NOTE: recipe file-5.45-r0: task do_patch: Started
NOTE: Running task 1042 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_fetch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.4-r0: task do_patch: Succeeded
NOTE: Running task 1044 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe findutils-4.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1058 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_unpack)
NOTE: recipe file-5.45-r0: task do_patch: Succeeded
NOTE: Running task 1060 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_fetch)
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 1061 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: recipe diffutils-3.10-r0: task do_fetch: Started
NOTE: recipe diffutils-3.10-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Succeeded
NOTE: Running task 1068 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_unpack)
NOTE: recipe perl-5.38.2-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_unpack: Started
NOTE: Running task 1077 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Running task 1086 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1087 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: Running task 1088 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: Running task 1089 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Started
NOTE: recipe bash-5.2.21-r0: task do_unpack: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1090 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1091 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_unpack)
NOTE: Running noexec task 1092 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: Running noexec task 1093 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 1094 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1095 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa)
NOTE: recipe bash-5.2.21-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 1096 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_patch)
NOTE: Running task 1099 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_unpack: Started
NOTE: Running task 1109 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1112 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: recipe perl-5.38.2-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: Running task 1130 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe findutils-4.10.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1131 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa unihash changed to 3250ffa2fe88b0464aa8afadd37ae2f4d2866f0a12f71ac389121dec60ea3bd9
NOTE: recipe diffutils-3.10-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: Running task 1132 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_patch)
NOTE: Running task 1133 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_fetch)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1134 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe findutils-4.10.0-r0: task do_patch: Started
NOTE: recipe coreutils-9.5-r0: task do_unpack: Succeeded
NOTE: Running task 1135 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_patch)
NOTE: recipe elfutils-0.191-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1136 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1148 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_fetch)
NOTE: Running task 1149 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe diffutils-3.10-r0: task do_patch: Started
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe shadow-4.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1150 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe elfutils-0.191-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_package unihash changed to bbb8944c96ebda3b57383864cd6b38a748532b0f72bff02062f3c798b2d71b29
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata became valid
NOTE: recipe gawk-5.3.0-r0: task do_fetch: Started
NOTE: recipe gawk-5.3.0-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_patch: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 626 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running task 1151 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_patch)
NOTE: Running task 1152 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_patch)
NOTE: Running task 1156 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_patch: Started
NOTE: recipe perl-5.38.2-r0: task do_patch: Started
NOTE: Running setscene task 885 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 888 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: Running task 1164 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_patch)
NOTE: Running task 1173 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_fetch)
NOTE: Running task 1175 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 1177 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_fetch)
NOTE: Running task 1186 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1187 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 1188 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_fetch)
NOTE: Running task 1189 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_unpack)
NOTE: recipe python3-3.12.4-r0: task do_patch: Started
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Started
NOTE: Running task 1197 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.10-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.44-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1200 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_unpack)
NOTE: recipe shadow-4.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1201 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1202 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe iptables-1.8.10-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_fetch: Succeeded
NOTE: Running task 1239 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 1240 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 1241 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: Running task 1253 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1254 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Started
NOTE: Running task 1256 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_fetch: Succeeded
NOTE: Running task 1257 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_unpack)
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.10-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: recipe grep-3.11-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_fetch: Started
NOTE: recipe grep-3.11-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1258 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: Running task 1259 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_patch)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1260 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: Running task 1261 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_patch)
NOTE: recipe gawk-5.3.0-r0: task do_patch: Started
NOTE: recipe shadow-4.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_deploy_source_date_epoch unihash changed to 7e1b0c86cd8a2003cc9f3c99f838610a45fdf8892a5081f19d3d193456f50ee2
NOTE: recipe tcp-wrappers-7.6-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe procps-4.0.4-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1262 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1274 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_fetch)
NOTE: Running task 1275 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 1276 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_fetch)
NOTE: Running task 1277 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe perl-5.38.2-r0: task do_patch: Succeeded
NOTE: Running task 1279 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_fetch)
NOTE: recipe libpcre2-10.44-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_patch: Started
NOTE: Running task 1280 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_patch)
NOTE: recipe gawk-5.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1282 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_patch: Started
NOTE: recipe socat-1.8.0.0-r0: task do_fetch: Started
NOTE: recipe which-2.21-r0: task do_fetch: Started
NOTE: recipe iproute2-6.9.0-r0: task do_fetch: Started
NOTE: recipe socat-1.8.0.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe which-2.21-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_fetch: Succeeded
NOTE: recipe kmod-32-r0: task do_fetch: Started
NOTE: Running task 1299 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_unpack)
NOTE: recipe libpcre2-10.44-r0: task do_patch: Started
NOTE: Running task 1300 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_unpack)
NOTE: Running task 1303 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_unpack: Succeeded
NOTE: Running task 1305 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_fetch)
NOTE: Running task 1306 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_patch)
NOTE: recipe btrfs-tools-6.9.2-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.10-r0: task do_patch: Succeeded
NOTE: Running task 1323 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_unpack)
NOTE: recipe libpcre2-10.44-r0: task do_patch: Succeeded
NOTE: Running task 1325 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe grep-3.11-r0: task do_unpack: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1326 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Started
NOTE: recipe kmod-32-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_fetch: Succeeded
NOTE: Running task 1327 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_unpack)
NOTE: Running task 1328 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_unpack)
NOTE: recipe socat-1.8.0.0-r0: task do_unpack: Started
NOTE: recipe which-2.21-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_fetch: Succeeded
NOTE: Running task 1329 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r0: task do_unpack: Succeeded
NOTE: Running task 1331 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_unpack)
NOTE: Running task 1334 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe iproute2-6.9.0-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_unpack: Started
NOTE: recipe kmod-32-r0: task do_unpack: Started
NOTE: recipe socat-1.8.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1335 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_patch)
NOTE: recipe linux-libc-headers-6.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.11-r0: task do_unpack: Succeeded
NOTE: Running task 1336 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe btrfs-tools-6.9.2-r0: task do_unpack: Started
NOTE: recipe which-2.21-r0: task do_patch: Started
NOTE: Running task 1337 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe linux-libc-headers-6.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1340 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_patch: Started
NOTE: Running task 1341 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_patch)
NOTE: recipe grep-3.11-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe grep-3.11-r0: task do_patch: Succeeded
NOTE: Running task 1345 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe which-2.21-r0: task do_patch: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_patch: Succeeded
NOTE: Running task 1377 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1383 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe iproute2-6.9.0-r0: task do_patch: Started
NOTE: recipe procps-4.0.4-r0: task do_unpack: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1385 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe iproute2-6.9.0-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1446 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_collect_spdx_deps)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: Running task 1461 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1473 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1474 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1475 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-32-r0: task do_unpack: Succeeded
NOTE: Running task 1476 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1477 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 1480 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.9.2.bb:do_patch)
NOTE: recipe kmod-32-r0: task do_patch: Started
NOTE: Running task 1484 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_lic)
NOTE: Running task 1485 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_lic)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_lic: Started
NOTE: Running task 1487 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.9.2-r0: task do_patch: Succeeded
NOTE: recipe kmod-32-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_lic: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_lic unihash changed to 9057252b18444bc2a4010f214ddb65b28824a81061e4e21193b03a63ec14b028
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_lic unihash changed to 6e69c58cd1a4d9d23df1511a8f22b64f1b9dafc81cbf330fd1b4c51411687ed7
NOTE: Running task 1490 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1491 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1492 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1494 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe musl-legacy-error-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_14.1.bb:do_preconfigure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_patch: Succeeded
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_preconfigure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot unihash changed to cc185951cfb74808768a9816f615472cc2184671a9abfbe8efeaefbfef69447a
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package unihash changed to 02b4f6cd32e55bfd8b15f43574b4c559763ca537195388fc59efcf29062c8161
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe gcc-source-14.1.0-14.1.0-r0: task do_preconfigure: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 3de15ef14abe1894779421a7be57660c949492f8f009a3bb1e71c355ee57ba18
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
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
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1509 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1510 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_kernel_checkout: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_unpack: Succeeded
NOTE: Running task 1511 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_patch)
NOTE: Running task 1512 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.9-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_patch: Succeeded
NOTE: Running noexec task 1514 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_configure)
NOTE: Running noexec task 1515 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_compile)
NOTE: Running task 1516 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_install)
NOTE: recipe linux-libc-headers-6.9-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_install: Succeeded
NOTE: Running task 1529 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1532 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_package)
NOTE: Running task 1533 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1534 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_configure)
NOTE: Running task 1535 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_compile)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_install)
NOTE: recipe libssp-nonshared-1.0-r0: task do_install: Started
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_prepare_recipe_sysroot: Succeeded
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_package unihash changed to fbcfd9708b26c6a7837bc1391e3b5ce07fadfd9016ed9e7706ef5768decff81c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata became valid
NOTE: Running setscene task 887 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_package unihash changed to 6529abdbd494a6d73cb752b8b602d5d8494ad7ad846837f47baacd3d1710fe07
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_create_spdx became valid
NOTE: Running setscene task 887 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1551 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_collect_spdx_deps)
NOTE: Running task 1552 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_collect_spdx_deps)
NOTE: recipe musl-1.2.4+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.4+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1553 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_install)
NOTE: recipe musl-1.2.4+git-r0: task do_install: Started
NOTE: recipe musl-1.2.4+git-r0: task do_install: Succeeded
NOTE: Running task 1555 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1556 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package)
NOTE: recipe libgcc-14.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package: Started
NOTE: recipe libgcc-14.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1557 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_configure)
NOTE: recipe libgcc-14.1.0-r0: task do_configure: Started
NOTE: recipe libgcc-14.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_compile)
NOTE: recipe libgcc-14.1.0-r0: task do_compile: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package unihash changed to a929bf3638fef123f038744928dcc7dda0e43387ed95aa00702c9ee8173e3431
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata became valid
NOTE: Running setscene task 889 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1561 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_collect_spdx_deps)
NOTE: recipe libgcc-14.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-14.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1562 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_install)
NOTE: recipe libgcc-14.1.0-r0: task do_install: Started
NOTE: recipe libgcc-14.1.0-r0: task do_install: Succeeded
NOTE: Running task 1563 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_multilib_install)
NOTE: recipe libgcc-14.1.0-r0: task do_multilib_install: Started
NOTE: recipe libgcc-14.1.0-r0: task do_multilib_install: Succeeded
NOTE: Running task 1564 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_extra_symlinks)
NOTE: recipe libgcc-14.1.0-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-14.1.0-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1566 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1567 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_package)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-14.1.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1568 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_configure)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_configure: Started
NOTE: recipe libgcc-14.1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_package unihash changed to cd71867a45b997201004a974ce92178e37933bad3ca455d6e2a980c5f9c29d6e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_create_spdx became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1571 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 1572 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_validate_branches)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_validate_branches: Started
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_validate_branches: Succeeded
NOTE: Running task 1573 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_kernel_metadata)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_kernel_metadata: Started
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 1574 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_patch)
NOTE: Running task 1575 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_kernel_version_sanity_check)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_patch: Succeeded
NOTE: Running task 1577 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_kernel_configme)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_kernel_configme: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1578 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_compile)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_compile: Started
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_kernel_configme: Succeeded
NOTE: Running task 1579 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_configure)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_configure: Started
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_kernel_configcheck)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_kernel_configcheck: Started
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 1581 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_compile)
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_compile: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1582 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_install)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_install: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_install: Succeeded
NOTE: Running task 1584 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1590 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1591 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1592 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1593 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1594 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_package)
NOTE: Running task 1595 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1596 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1597 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1598 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1599 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1600 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1601 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1602 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1603 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_package: Started
NOTE: Running task 1604 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1605 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe zlib-1.3.1-r0: task do_configure: Started
NOTE: recipe libunistring-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1606 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_configure)
NOTE: recipe libseccomp-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1607 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1608 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure)
NOTE: recipe zstd-1.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1609 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_configure)
NOTE: recipe bash-completion-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1610 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1611 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_configure)
NOTE: Running task 1612 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_configure)
NOTE: recipe libtirpc-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1613 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_configure)
NOTE: recipe libunistring-1.2-r0: task do_configure: Started
NOTE: Running task 1614 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure)
NOTE: recipe expat-2.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: Running task 1615 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: Running task 1616 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_configure)
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_configure: Started
NOTE: recipe zstd-1.5.6-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Started
NOTE: recipe gdbm-1.24-r0: task do_configure: Started
NOTE: recipe expat-2.6.2-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1617 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1618 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe zstd-1.5.6-r0: task do_configure: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: Running task 1619 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_compile)
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1620 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_configure_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1621 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe zstd-1.5.6-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1622 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
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
NOTE: recipe expat-2.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1628 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1629 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_install_ptest_base)
NOTE: recipe openssl-3.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1631 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1632 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_configure)
NOTE: recipe cracklib-2.9.11-r0: task do_prepare_recipe_sysroot: Started
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
NOTE: recipe gcc-runtime-14.1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_package unihash changed to e3055cd044bdc674cf59e2d5b44c4203094f6e3e5d2677e169dc6b8cb9ab2ea2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx became valid
NOTE: recipe libtirpc-1.3.4-r0: task do_configure: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_configure: Succeeded
NOTE: Running setscene task 861 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running task 1638 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1639 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1640 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_configure)
NOTE: recipe ncurses-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1641 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_configure)
NOTE: recipe xz-5.4.6-r0: task do_configure: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_configure: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_configure: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1642 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_configure: Succeeded
NOTE: Running task 1643 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_compile)
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1644 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1646 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_configure: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 1647 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_compile: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1648 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_compile: Started
NOTE: recipe attr-2.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1649 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_compile_ptest_base)
NOTE: recipe cracklib-2.9.11-r0: task do_configure: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1650 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1651 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install)
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1652 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_install)
NOTE: recipe attr-2.5.2-r0: task do_install: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_install: Succeeded
NOTE: Running task 1653 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_install_ptest_base)
NOTE: recipe cracklib-2.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1654 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_install)
NOTE: recipe cracklib-2.9.11-r0: task do_install: Started
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1655 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe attr-2.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1657 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1658 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1659 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_configure: Started
NOTE: recipe cracklib-2.9.11-r0: task do_install: Succeeded
NOTE: Running task 1661 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 1662 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1663 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure)
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.6.1-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1664 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_compile)
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1665 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install)
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_compile: Succeeded
NOTE: Running task 1666 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_install)
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Started
NOTE: recipe libgpg-error-1.49-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1667 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.5-r0: task do_install: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_configure_ptest_base: Started
NOTE: Running task 1668 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.49-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1669 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_compile)
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.49-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_install: Succeeded
NOTE: Running task 1671 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1672 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1674 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1675 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile)
NOTE: recipe openssl-3.3.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1676 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1677 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe openssl-3.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1678 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe openssl-3.3.1-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1680 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_configure_ptest_base)
NOTE: recipe expat-2.6.2-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.6.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1681 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_compile)
NOTE: recipe expat-2.6.2-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 1aacf0d9b0f60ef27957fc6c8bf7cfd7b1cba22a2bc51ab295aed1c11f731f1d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_compile: Succeeded
NOTE: Running task 1682 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1684 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1686 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_compile)
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_compile: Started
NOTE: recipe expat-2.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1687 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1688 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install)
NOTE: recipe expat-2.6.2-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.6.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1689 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_install)
NOTE: recipe gdbm-1.24-r0: task do_install: Started
NOTE: recipe expat-2.6.2-r0: task do_install: Started
NOTE: recipe expat-2.6.2-r0: task do_install: Succeeded
NOTE: Running task 1690 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1691 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1692 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe libtirpc-1.3.4-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1693 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_compile)
NOTE: recipe gdbm-1.24-r0: task do_install: Succeeded
NOTE: Running task 1695 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1696 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_configure_ptest_base)
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Started
NOTE: recipe acl-2.3.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1697 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile)
NOTE: recipe libtirpc-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 1699 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.2-r0: task do_compile: Started
NOTE: recipe lzlib-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.24-r0: task do_install_ptest_base: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1701 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1702 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_configure)
NOTE: recipe libffi-3.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.14-r0: task do_configure: Started
NOTE: recipe libffi-3.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1703 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.14-r0: task do_configure: Succeeded
NOTE: Running task 1704 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_compile)
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.14-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1705 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_configure)
NOTE: recipe libffi-3.4.6-r0: task do_configure: Started
NOTE: recipe zlib-1.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_package unihash changed to 585763bfc1aafbd29b13e2358276d6fffe0d003f6369388c784ac63cdcee8ed5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx became valid
NOTE: recipe acl-2.3.2-r0: task do_compile: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 1706 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_compile_ptest_base)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_configure: Succeeded
NOTE: Running task 1708 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: Running task 1709 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_compile)
NOTE: recipe acl-2.3.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1710 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install)
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_compile: Started
NOTE: recipe acl-2.3.2-r0: task do_install: Started
NOTE: recipe libgpg-error-1.49-r0: task do_compile: Succeeded
NOTE: Running task 1711 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.49-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.49-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1712 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_install)
NOTE: recipe libgpg-error-1.49-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_install: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 1713 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_install)
NOTE: Running task 1714 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_install_ptest_base)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Started
NOTE: recipe xz-5.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1715 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_configure_ptest_base: Started
NOTE: Running task 1717 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_install_ptest_base)
NOTE: recipe xz-5.4.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1718 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_compile)
NOTE: recipe expat-2.6.2-r0: task do_install_ptest_base: Started
NOTE: recipe xz-5.4.6-r0: task do_compile: Started
NOTE: recipe expat-2.6.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1720 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.14-r0: task do_compile: Succeeded
NOTE: Running task 1721 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.14-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1722 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.14-r0: task do_install: Succeeded
NOTE: Running task 1724 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1725 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe libgpg-error-1.49-r0: task do_install: Succeeded
NOTE: Running task 1726 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_install_ptest_base)
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.49-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_install: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1727 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: Running task 1728 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot)
NOTE: recipe libgpg-error-1.49-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1730 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1731 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_package)
NOTE: recipe cracklib-2.9.11-r0: task do_package: Started
NOTE: recipe xz-5.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1732 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_compile_ptest_base)
NOTE: recipe xz-5.4.6-r0: task do_compile_ptest_base: Started
NOTE: recipe zstd-1.5.6-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1733 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_install)
NOTE: recipe xz-5.4.6-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_install: Started
NOTE: Running task 1734 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1735 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe xz-5.4.6-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_compile: Succeeded
NOTE: Running task 1736 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_install)
NOTE: recipe cracklib-2.9.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_package unihash changed to a584b26d47def815a1f768f52e083666b146b95c6b3f562c6619d6b17752b430
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata became valid
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Started
NOTE: Running setscene task 887 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_create_spdx_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 888 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1737 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_configure_ptest_base)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1738 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1739 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile)
NOTE: Running task 1740 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1741 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe libpam-1.6.1-r0: task do_compile: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1743 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1744 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1746 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_compile: Started
NOTE: Running task 1747 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1748 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_install: Succeeded
NOTE: Running task 1749 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_install: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1753 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1755 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot unihash changed to 18bdf6c298f794d762258bcccc95b19c2dd5511855168cc06c61219ee7166028
NOTE: recipe base-passwd-3.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1756 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_compile)
NOTE: Running task 1757 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1758 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_configure)
NOTE: Running task 1759 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure)
NOTE: Running task 1760 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe libffi-3.4.6-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_configure: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_configure: Succeeded
NOTE: Running task 1761 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1762 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1763 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe xz-5.4.6-r0: task do_install: Succeeded
NOTE: Running task 1764 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_install_ptest_base)
NOTE: recipe libffi-3.4.6-r0: task do_compile: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1765 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_install)
NOTE: Running task 1767 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.6-r0: task do_install_ptest_base: Started
NOTE: recipe libffi-3.4.6-r0: task do_install: Started
NOTE: recipe findutils-4.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1768 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe xz-5.4.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1770 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe findutils-4.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1771 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe diffutils-3.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.10.0-r0: task do_configure: Started
NOTE: recipe diffutils-3.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1772 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_configure)
NOTE: recipe libffi-3.4.6-r0: task do_install: Succeeded
NOTE: Running task 1774 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package: Succeeded
NOTE: Running task 1776 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffutils-3.10-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package unihash changed to 83ad8182b1344966d9779a9b16939d690af564121cd13afe88a1bb222b18eb1a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx became valid
NOTE: recipe perl-5.38.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running task 1777 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata)
NOTE: recipe perl-5.38.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1778 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.2-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1780 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1781 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe xz-5.4.6-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_configure: Succeeded
NOTE: Running task 1782 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_compile)
NOTE: recipe base-passwd-3.6.4-r0: task do_compile: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_compile: Succeeded
NOTE: Running task 1783 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_install)
NOTE: recipe base-passwd-3.6.4-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_install: Succeeded
NOTE: Running task 1785 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1786 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_configure_ptest_base)
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.9.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1787 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile)
NOTE: recipe nettle-3.9.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 1bb9f33b6107d97321b0fe7fe99f30c718827663359e3e1cb99423b336420afb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe bash-completion-2.14.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package unihash changed to a355ba3f9c44606c1e28a8916b0a34a248b3e2e9106413a8ea16a04244e44868
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata became valid
NOTE: Running setscene task 880 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1789 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1793 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_package)
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to c4c60bd2dfe1b44da377262a497e71438e51d321e3ffb680bd21efd20ea0012c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.4.6-r0: task do_package: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package unihash changed to e402f1c1e437d9e13e82d2f53b9121c91821eac4536f31c06b7527384bdbc78f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx became valid
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 886 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running task 1795 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1797 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package)
NOTE: recipe base-passwd-3.6.4-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_package unihash changed to 8a0b4709d88d0154f0faced8798ecde79c94fd5305b77fe8060815608202b9e2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_package unihash changed to 6991a76bb5af55daaf13c4463f71e2dbd316d0cf35cd3b3747fe85b9b0dda31d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx became valid
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1799 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1801 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1802 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_configure)
NOTE: recipe libpcre2-10.44-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package unihash changed to b0b1d542e0507479ca755fec270f774b8234f57313ddd66e5f058ef30b96e563
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_install: Succeeded
NOTE: Running task 1804 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1805 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.7.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1806 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_configure: Started
NOTE: recipe acl-2.3.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_package unihash changed to 650f3ecee7229d63d3180580166240ac647700ad2fafaa46ffbe0e4c8d648a82
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata became valid
NOTE: recipe ncurses-6.5-r0: task do_compile: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: Running task 1807 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_install)
NOTE: Running task 1808 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_configure: Started
NOTE: recipe ncurses-6.5-r0: task do_install: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1809 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_package)
NOTE: recipe zstd-1.5.6-r0: task do_package: Started
NOTE: recipe gdbm-1.24-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_package unihash changed to 90c35e1836e4bc6a8770283e0c1a38f3eff9ef6b8fa0bb61ef61efb7d4e438bb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1810 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1819 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1820 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1821 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1822 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe nettle-3.9.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_configure: Started
NOTE: Running task 1823 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_install: Started
NOTE: Running task 1824 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe zstd-1.5.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_package unihash changed to b1672d7694f9da409ce97823d9d6c630cccefb1b21580c48d81f3af8664ca1d8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_install: Succeeded
NOTE: Running task 1825 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_install_ptest_base)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1827 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_configure)
NOTE: recipe iptables-1.8.10-r0: task do_configure: Started
NOTE: recipe nettle-3.9.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1829 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_compile: Succeeded
NOTE: Running task 1830 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r0: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_install: Succeeded
NOTE: Running task 1831 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_package)
NOTE: recipe lzlib-1.14-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1832 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre2-10.44-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_compile)
NOTE: recipe libpcre2-10.44-r0: task do_compile: Started
NOTE: recipe libpam-1.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1834 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install)
NOTE: recipe libpam-1.6.1-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1835 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1836 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe lzlib-1.14-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_package unihash changed to 4cbb419392f40fdcd306ca05be8bb0fbedad86a57fd84f85216a02846cb20ac6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_create_spdx_setscene)
NOTE: recipe lzlib-1.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1840 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package)
NOTE: recipe libgpg-error-1.49-r0: task do_package: Started
NOTE: recipe openssl-3.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1841 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1842 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_install)
NOTE: recipe openssl-3.3.1-r0: task do_install: Started
NOTE: recipe file-5.45-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1843 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_compile)
NOTE: recipe file-5.45-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1844 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 1845 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1846 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: Running task 1847 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1848 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe iptables-1.8.10-r0: task do_configure: Succeeded
NOTE: Running task 1849 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_compile)
NOTE: recipe file-5.45-r0: task do_compile: Succeeded
NOTE: Running task 1850 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_install)
NOTE: recipe libgpg-error-1.49-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_package unihash changed to ef9830eb34a44851bc88678eac5b133bbffea96e13c0f1434e32ca6f50128785
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_create_spdx became valid
NOTE: recipe iptables-1.8.10-r0: task do_compile: Started
NOTE: recipe file-5.45-r0: task do_install: Started
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_configure: Succeeded
NOTE: Running task 1851 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_configure_ptest_base)
NOTE: recipe diffutils-3.10-r0: task do_configure_ptest_base: Started
NOTE: recipe file-5.45-r0: task do_install: Succeeded
NOTE: Running task 1853 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package)
NOTE: recipe diffutils-3.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1854 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_compile)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1855 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package)
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Started
NOTE: recipe diffutils-3.10-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1856 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package)
NOTE: recipe nettle-3.9.1-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 1857 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_install_ptest_base)
NOTE: recipe file-5.45-r0: task do_package: Started
NOTE: recipe openssl-3.3.1-r0: task do_install: Succeeded
NOTE: Running task 1858 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_install_ptest_base)
NOTE: recipe libtasn1-4.19.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_package unihash changed to 5bc1108845efdf6b3b8744ee10da1a2ef1736b13ddb7258c28f2faba05475dc9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata became valid
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-3.3.1-r0: task do_install_ptest_base: Started
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1859 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1860 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package)
NOTE: recipe libpam-1.6.1-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot unihash changed to 5602cd37342b916408b4e9706af66b2b3ca61adf243f3e33157859303160657b
NOTE: Setscene tasks completed
NOTE: Running task 1861 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1862 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_configure)
NOTE: recipe libcap-2.70-r0: task do_configure: Started
NOTE: recipe file-5.45-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package unihash changed to 5bf03c83892e620572b79ee4c7204ce46c9ab41c5a2475eda2070b6c665526cf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata became valid
NOTE: recipe libpcre2-10.44-r0: task do_compile: Succeeded
NOTE: recipe libcap-2.70-r0: task do_configure: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: Running task 1863 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_compile)
NOTE: Running task 1864 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_compile: Started
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1865 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_configure: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1866 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_install)
NOTE: recipe libpcre2-10.44-r0: task do_install: Started
NOTE: recipe iptables-1.8.10-r0: task do_compile: Succeeded
NOTE: Running task 1867 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_install)
NOTE: recipe iptables-1.8.10-r0: task do_install: Started
NOTE: recipe libpcre2-10.44-r0: task do_install: Succeeded
NOTE: Running task 1868 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_package)
NOTE: recipe libffi-3.4.6-r0: task do_package: Started
NOTE: recipe iptables-1.8.10-r0: task do_install: Succeeded
NOTE: Running task 1869 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Started
NOTE: recipe libcap-2.70-r0: task do_compile: Succeeded
NOTE: Running task 1870 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_install)
NOTE: recipe diffutils-3.10-r0: task do_compile: Succeeded
NOTE: Running task 1871 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_compile_ptest_base)
NOTE: recipe libcap-2.70-r0: task do_install: Started
NOTE: recipe diffutils-3.10-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1872 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_install)
NOTE: recipe diffutils-3.10-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_package unihash changed to 1985df327b79c91d9c5e842765d5c058b506213acb615bdf208b9efceda6a259
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_package unihash changed to 0b191da6bfc464b67d09d230877810043e09f0f71f4dc26adabc081460ad00da
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx became valid
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1873 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_package)
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_compile: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_package: Started
NOTE: Running task 1874 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_install)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_install: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1880 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe libcap-2.70-r0: task do_install: Succeeded
NOTE: Running task 1881 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot)
NOTE: recipe libnsl2-2.0.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package unihash changed to f3355f9fab2506099eb7d4f47840a8b818bb9a6ba738464894a8bb8bdc5a2f56
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx became valid
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_install: Succeeded
NOTE: Running task 1883 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_package)
NOTE: recipe diffutils-3.10-r0: task do_install: Succeeded
NOTE: Running task 1884 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe libnsl2-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1885 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_package: Started
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe ncurses-6.5-r0: task do_install: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_configure: Succeeded
NOTE: Running task 1887 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1888 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot unihash changed to 62dcdbd552129d9fe5796b36d0bb0477caed0d42c2d7e6a527e1da17dfb0d5ca
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1889 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.9.1-r0: task do_package: Succeeded
NOTE: Running task 1890 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_package unihash changed to c5fcc5d6fd1702aa44d7582dd4397f17f0b2c92d2d4819eb048c4b189be3b56d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata became valid
NOTE: recipe libgcrypt-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_configure: Started
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx_setscene)
NOTE: Running task 1891 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_compile)
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1892 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_configure)
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1893 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_configure)
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_package unihash changed to ae15c35351080a0258df026bd1a1d72387217071f66d30c4f3ab825e9710257f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata became valid
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1894 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package)
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1895 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package unihash changed to 1d9a5690d489028c891d608ab9731608b46b10302e5252cbe74df8b17ddc6b81
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata became valid
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_package unihash changed to 97ded6e47cbc6b97f07766e73c5415cd62b99da3f8f0dfc92e38e93de915a36b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata became valid
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: Running task 1896 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1897 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1898 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1899 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_configure)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.2-r0: task do_configure: Started
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1900 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure)
NOTE: recipe coreutils-9.5-r0: task do_configure: Started
NOTE: recipe libpam-1.6.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_package unihash changed to 77b91054eebb535adf57c5e4ff02d4dc9b3011ba94c91c82b6171c560049be2d
NOTE: Setscene tasks completed
NOTE: Running task 1901 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata: Started
NOTE: recipe findutils-4.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1903 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to aa418aee3012048e848bba1e3499bb73bc0834d38e4f746d18bccc80edcb78d9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx became valid
NOTE: recipe findutils-4.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: Running task 1904 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_compile: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_compile: Started
NOTE: Running task 1905 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1909 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: Running task 1910 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe libcap-2.70-r0: task do_package: Started
NOTE: recipe libarchive-3.7.4-r0: task do_install: Succeeded
NOTE: Running task 1911 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot)
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot unihash changed to 8a6bd1a7f596fdcd5bd29d031110ccbad55d8aebd418bdbfd495d1d566e8c143
NOTE: Setscene tasks completed
NOTE: Running task 1912 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_package unihash changed to 28807566667f4b410cf0e9420380006f500059dbe092cccde504bd2c3ee064f4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata became valid
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1913 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_package)
NOTE: recipe libarchive-3.7.4-r0: task do_package: Started
NOTE: recipe libcap-2.70-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package unihash changed to bbc7694b2da9bc37ff732b21f6a3f180a3d32c5bd9132cf17a3d5ce23e8e4bb3
NOTE: Setscene tasks completed
NOTE: Running task 1914 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata)
NOTE: recipe libcap-2.70-r0: task do_packagedata: Started
NOTE: recipe shadow-4.15.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1915 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_compile)
NOTE: recipe shadow-4.15.1-r0: task do_compile: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata: Succeeded
NOTE: Running task 1916 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_package unihash changed to 25a0c71dd134101f0561498a4acaf08e1621fbb904d40f24c310f9df4823538e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx became valid
NOTE: recipe readline-8.2-r0: task do_configure: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_package: Started
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running task 1917 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1923 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r0: task do_package: Started
NOTE: recipe libarchive-3.7.4-r0: task do_package: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_configure: Succeeded
NOTE: Running task 1924 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_package unihash changed to 6d22d40104d1cfa4e2c67f433ff63034f4c4068a05d0dfcde378e10a31c78735
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata became valid
NOTE: recipe openssl-3.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_compile: Started
NOTE: Running task 1926 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_package: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1928 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe readline-8.2-r0: task do_compile: Succeeded
NOTE: Running task 1929 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package unihash changed to e5a41ff4f63979ea17438c5c6532a2552d37a19077347da6767cd713c1d9ca09
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_compile: Succeeded
NOTE: Running task 1930 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_install)
NOTE: recipe shadow-4.15.1-r0: task do_compile: Succeeded
NOTE: Running task 1931 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_package: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_package unihash changed to 121255318ed626dd949fff481dcdece234bab7cd773094bb78e14e7584e2b3b2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx became valid
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_install: Started
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1932 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_compile_ptest_base)
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1933 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_package)
NOTE: recipe findutils-4.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre2-10.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1934 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_install)
NOTE: recipe iptables-1.8.10-r0: task do_package: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package unihash changed to f48e6959839ccd9bc308c2cb808113dfcd8ce29460644706049723457a8a6ec2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata became valid
NOTE: recipe libedit-20240517-3.1-r0: task do_install: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: Running task 1936 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe findutils-4.10.0-r0: task do_install: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1938 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_install: Succeeded
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1940 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1941 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1942 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1943 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_configure)
NOTE: recipe gawk-5.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-4.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1944 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe python3-3.12.4-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe procps-4.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1945 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_configure)
NOTE: recipe gawk-5.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_configure)
NOTE: recipe gawk-5.3.0-r0: task do_configure: Started
NOTE: recipe grep-3.11-r0: task do_configure: Started
NOTE: recipe shadow-4.15.1-r0: task do_install: Succeeded
NOTE: Running task 1947 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_package)
NOTE: recipe shadow-4.15.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1948 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1949 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_compile)
NOTE: recipe findutils-4.10.0-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1951 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package unihash changed to 13767579027a39c9d06d7580c3dd626a7b2f7f2813d04d69a9ddd38a968625cf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata became valid
NOTE: Running setscene task 873 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1952 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_configure)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_configure: Succeeded
NOTE: Running task 1953 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_compile: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_compile: Succeeded
NOTE: Running task 1954 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1956 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_install: Started
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_install: Succeeded
NOTE: Running task 1957 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_package)
NOTE: recipe libedit-20240517-3.1-r0: task do_package: Started
NOTE: recipe bash-5.2.21-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1958 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.21-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1959 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile)
NOTE: recipe bash-5.2.21-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1960 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1961 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to 7ee3f64d4fad23e9273a32f58f72681167d0ac1096fc34dcb48e76054099fea3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx became valid
NOTE: Running setscene task 886 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_package: Succeeded
NOTE: Running task 1962 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_package: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_package unihash changed to 00efa79e445a511a899f0821f74997ea5e1a394f303effe0e0bac2631769e768
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_create_spdx became valid
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_create_spdx_setscene)
NOTE: Running task 1964 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_configure)
NOTE: recipe procps-4.0.4-r0: task do_configure: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1968 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_install_ptest_base)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata unihash changed to 2a9a05560bfa5cf10170791c4971d93c8759887285becf6b6d7f23dea5d4d742
NOTE: Setscene tasks completed
NOTE: Running task 1969 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package)
NOTE: recipe findutils-4.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package: Started
NOTE: recipe findutils-4.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1970 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_install_ptest_base)
NOTE: recipe diffutils-3.10-r0: task do_install_ptest_base: Started
NOTE: recipe diffutils-3.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1971 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1972 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.10.0-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1973 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe iptables-1.8.10-r0: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_package unihash changed to eb8b67c4c69b16ae5144247612ed31b4367e4078d8cbb41bbf4247ad6130ae73
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata became valid
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_create_spdx_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1974 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_package)
NOTE: recipe diffutils-3.10-r0: task do_package: Started
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1979 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.8.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.38.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1980 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_configure_ptest_base)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1981 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata)
NOTE: recipe perl-5.38.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1982 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1983 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_compile)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.38.2-r0: task do_compile: Started
NOTE: recipe which-2.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1984 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata unihash changed to 2ad526a6953c01d2b09b5412b8752561f798a2d3a861f113def4dd7c47bfb7e5
NOTE: recipe kmod-32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 1985 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_configure)
NOTE: recipe socat-1.8.0.0-r0: task do_configure: Started
NOTE: recipe kmod-32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1986 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe which-2.21-r0: task do_configure: Started
NOTE: recipe bash-5.2.21-r0: task do_compile: Succeeded
NOTE: Running task 1987 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_compile_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Succeeded
NOTE: Running task 1988 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.40.2-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1989 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_compile)
NOTE: recipe findutils-4.10.0-r0: task do_package: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package unihash changed to a4c4c29b2ae665c7c6b3ac1f04c85c5f59d40d5813816567a1e1e845927cf991
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_package unihash changed to 2ee357d8befcb0dcf5367314c24365856307558c822734742d9113baac757655
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_create_spdx became valid
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 887 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1990 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_configure)
NOTE: recipe kmod-32-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1991 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_compile_ptest_base)
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1992 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1993 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1996 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_install: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1997 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: recipe which-2.21-r0: task do_configure: Succeeded
NOTE: Running task 1998 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1999 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r0: task do_compile: Succeeded
NOTE: Running task 2000 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bash-5.2.21-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2001 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_install)
NOTE: recipe which-2.21-r0: task do_install: Started
NOTE: recipe bash-5.2.21-r0: task do_install: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2002 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot: Started
NOTE: recipe which-2.21-r0: task do_install: Succeeded
NOTE: Running task 2003 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package)
NOTE: recipe libgcrypt-1.11.0-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2004 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r0: task do_package: Started
NOTE: recipe libunistring-1.2-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_install)
NOTE: recipe libunistring-1.2-r0: task do_install: Started
NOTE: recipe openssl-3.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_package unihash changed to 8ae19322e046262ac1d31f9090c5ce964918253e06cd3a00da39b56c6bf47a26
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_install: Succeeded
NOTE: Running task 2007 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2008 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_package)
NOTE: recipe libidn2-2.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.2-r0: task do_package: Started
NOTE: recipe which-2.21-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package unihash changed to edd64b6eca144a52a8fb9f5247c4fb8a35371d09c5239cc85c9f5a1e827c143e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_create_spdx_setscene)
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_deb_setscene)
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_ipk_setscene)
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 2009 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_configure)
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_configure: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2011 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe gawk-5.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2012 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.11.0-r0: task do_package: Succeeded
NOTE: Running task 2013 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata)
NOTE: recipe gawk-5.3.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata: Started
NOTE: recipe gawk-5.3.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2014 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_compile)
NOTE: recipe gawk-5.3.0-r0: task do_compile: Started
NOTE: recipe procps-4.0.4-r0: task do_configure: Succeeded
NOTE: Running task 2015 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_compile)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata unihash changed to e5e9d4e6b9e66d6d7ed3222675bfb04b973d67f06fdd7ccff63ca7d7a833fb22
NOTE: Setscene tasks completed
NOTE: recipe procps-4.0.4-r0: task do_compile: Started
NOTE: Running task 2018 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.40.2-r0: task do_compile: Succeeded
NOTE: Running task 2019 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2020 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx)
NOTE: recipe util-linux-2.40.2-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package unihash changed to ef42b7d5548d76867aee3e8bfe0b1126a0fe2fdb81f7d0e5508008e0d52ab1a1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_ipk became valid
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx: Started
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx_setscene)
NOTE: recipe bc-1.07.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_install: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_deb_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_ipk_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_package unihash changed to 5e611aa3bd4d8954c1d0d9c420aca8f63599cf0b243131b68386cb09702fa2fc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_create_spdx became valid
NOTE: recipe bc-1.07.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_create_spdx_setscene)
NOTE: Running task 2021 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2024 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_collect_spdx_deps)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2044 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2045 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_create_spdx: Started
NOTE: recipe libidn2-2.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2048 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2049 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_collect_spdx_deps)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.70-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.70-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2050 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2051 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_collect_spdx_deps)
NOTE: recipe psmisc-23.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2053 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_configure)
NOTE: recipe libcap-2.70-r0: task do_create_spdx: Started
NOTE: recipe psmisc-23.7-r0: task do_configure: Started
NOTE: recipe util-linux-2.40.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.40.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2064 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2068 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package_write_ipk)
NOTE: recipe libcap-2.70-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2069 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package_write_deb)
NOTE: Running task 2070 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_install)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_ipk: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_deb: Started
NOTE: recipe util-linux-2.40.2-r0: task do_install: Started
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2071 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: Running task 2072 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package_write_rpm)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_deb: Succeeded
NOTE: Running task 2074 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx)
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Started
NOTE: recipe procps-4.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2075 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_install)
NOTE: recipe procps-4.0.4-r0: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2079 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2081 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2086 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_collect_spdx_deps)
NOTE: recipe kmod-32-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 2087 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_compile)
NOTE: recipe libarchive-3.7.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2096 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_create_spdx)
NOTE: recipe kmod-32-r0: task do_compile: Started
NOTE: recipe grep-3.11-r0: task do_configure: Succeeded
NOTE: Running task 2097 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_compile)
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx: Started
NOTE: recipe grep-3.11-r0: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2098 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: recipe procps-4.0.4-r0: task do_install: Succeeded
NOTE: Running task 2099 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package)
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: recipe procps-4.0.4-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2109 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe socat-1.8.0.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2110 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_compile)
NOTE: recipe util-linux-2.40.2-r0: task do_install: Succeeded
NOTE: Running task 2111 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_install_ptest_base)
NOTE: recipe shadow-4.15.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2113 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_collect_spdx_deps)
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_compile: Started
NOTE: Running task 2118 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx)
NOTE: recipe util-linux-2.40.2-r0: task do_install_ptest_base: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx: Started
NOTE: recipe python3-3.12.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.12.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2119 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package)
NOTE: Running task 2121 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_collect_spdx_deps)
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package: Started
NOTE: Running task 2122 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package)
NOTE: recipe coreutils-9.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package: Started
NOTE: Running task 2123 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2124 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_collect_spdx_deps)
NOTE: recipe socat-1.8.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-32-r0: task do_compile: Succeeded
NOTE: Running task 2125 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_install)
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2130 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_collect_spdx_deps)
NOTE: recipe socat-1.8.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2131 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2132 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_compile_ptest_base)
NOTE: recipe kmod-32-r0: task do_install: Started
NOTE: recipe kmod-32-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gawk-5.3.0-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.40.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe kmod-32-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2134 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.3.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2135 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot)
NOTE: Running task 2136 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package)
NOTE: Running task 2137 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_install)
NOTE: recipe bash-5.2.21-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot: Started
NOTE: recipe bash-5.2.21-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2143 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.3.0-r0: task do_install: Started
NOTE: recipe util-linux-2.40.2-r0: task do_package: Started
NOTE: recipe socat-1.8.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2144 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_install)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe socat-1.8.0.0-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2152 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_create_spdx)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx: Started
NOTE: recipe socat-1.8.0.0-r0: task do_install: Succeeded
NOTE: Running task 2153 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package)
NOTE: recipe kmod-32-r0: task do_install: Succeeded
NOTE: Running task 2154 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package)
NOTE: recipe socat-1.8.0.0-r0: task do_package: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2155 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-32-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 2157 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot)
NOTE: recipe kmod-32-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2158 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Started
NOTE: recipe procps-4.0.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package unihash changed to 37fe63c2525debdcddd8ac8f25f1f477b27429820b9ff69c945a939a28138a3f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_deb became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_create_spdx_setscene)
NOTE: recipe kmod-32-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot unihash changed to fb3f23a45d5fef71db9b6ba9d5430be0962d9359190f1de8569a109a04a8b88a
NOTE: recipe procps-4.0.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_deb_setscene)
NOTE: recipe procps-4.0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_ipk_setscene)
NOTE: recipe procps-4.0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 2162 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe procps-4.0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package unihash changed to 1b4ecfcbe52bfb0a22b9912426a241d08d2a2f034b791bcaf1820ddd3eec31c6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2167 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_rpm)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-32-r0: task do_package: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package unihash changed to ed052c63cb9b656ae181ff185da71fdbf191b87a5ac714d5aaa86b707b53b2ae
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_ipk became valid
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_deb_setscene)
NOTE: recipe kmod-32-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_ipk_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_install: Succeeded
NOTE: recipe kmod-32-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 2171 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe kmod-32-r0: task do_package_write_ipk_setscene: Started
NOTE: Running task 2172 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm unihash changed to 86c9447c119ff33e18dba2c2f3ee0875cf860259178421c8ad7fd8396a8329fa
NOTE: Running task 2173 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_package_qa)
NOTE: recipe kmod-32-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.3.0-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_qa: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package: Succeeded
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package unihash changed to c3c9a608b17a27d0f29479f724669d0c55e7744ad8de1fbcc9fe9cef6a9a2ae6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_deb became valid
NOTE: Running setscene task 886 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe grep-3.11-r0: task do_compile: Succeeded
NOTE: Running setscene task 887 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_create_spdx_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 2174 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_install)
NOTE: recipe socat-1.8.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running task 2176 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_create_spdx)
NOTE: recipe socat-1.8.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_packagedata_setscene)
NOTE: recipe grep-3.11-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_package_qa: Succeeded
NOTE: Running task 2179 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_rpm)
NOTE: recipe kmod-32-r0: task do_create_spdx: Started
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-32-r0: task do_package_write_rpm: Started
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2184 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_rpm)
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-32-r0: task do_create_spdx: Succeeded
NOTE: Running task 2185 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_create_package_spdx)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm unihash changed to fb18674809f6f6e5fe410ab44dcc56b5543c5a7a61f6155b1a6af58c150fcd58
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_create_package_spdx: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2186 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_build)
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_rpm unihash changed to cc9ab13a4e9a4ea9eba64d9f748d2b62c3a299ee53fc46873b09fe52b9921081
NOTE: recipe kmod-32-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_package_write_rpm unihash changed to 82f8c31d4ca933668747513c0b1665ff633fb2d4199ea043f1cfb7c5660cc0fa
NOTE: recipe grep-3.11-r0: task do_install: Succeeded
NOTE: Running task 2187 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package)
NOTE: recipe python3-3.12.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2189 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_configure_ptest_base)
NOTE: recipe grep-3.11-r0: task do_package: Started
NOTE: recipe python3-3.12.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.12.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2190 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_rpm unihash changed to 4a61742fd1db994ca49e6a1c720ab39d513e43ffce51bd30524ea2dca9bee0cc
NOTE: recipe python3-3.12.4-r0: task do_compile: Started
NOTE: recipe gawk-5.3.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2191 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package)
NOTE: recipe bash-5.2.21-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package unihash changed to f00eebe98c4c51d476f36fab0c750fff24740da7f0ab98f2cf487b49b733bd41
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_ipk became valid
NOTE: Running setscene task 882 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: Running setscene task 889 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 890 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_ipk_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_package: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_configure: Succeeded
NOTE: Running task 2192 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2197 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_rpm)
NOTE: Running task 2200 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2201 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile)
NOTE: recipe xz-5.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.5-r0: task do_compile: Started
NOTE: recipe grep-3.11-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package unihash changed to d0a694e5d382110e52fd943dbd6421adcc86247db3363261067762cc0564f6bf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata became valid
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 892 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 893 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_ipk_setscene)
NOTE: recipe grep-3.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe grep-3.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe grep-3.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2206 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_rpm unihash changed to 85b5f7b48928106d23b1fad23ba9e06414ba92a195f20742b64f70e28cdd9981
NOTE: recipe xz-5.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_write_rpm unihash changed to 4d72f255bdfb472767b2e7f801339c5daeb4afffa100e96cf8a2abd90b229ea3
NOTE: recipe psmisc-23.7-r0: task do_configure: Succeeded
NOTE: Running task 2207 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_compile)
NOTE: recipe psmisc-23.7-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Succeeded
NOTE: Running task 2208 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2209 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Started
NOTE: recipe grep-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_compile: Succeeded
NOTE: Running task 2210 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_package_write_rpm unihash changed to b14639a0854e2570d2eae4e5d3b19a74a935777d94364b58788a85df58ee5018
NOTE: recipe psmisc-23.7-r0: task do_install: Started
NOTE: recipe gawk-5.3.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package unihash changed to 668525f14c626f077b278c20075212ba5b92d7a6068bb37d1c96221dbd5f147c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe psmisc-23.7-r0: task do_install: Succeeded
NOTE: Running task 2212 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package)
NOTE: recipe psmisc-23.7-r0: task do_package: Started
NOTE: recipe libidn2-2.3.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2213 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_compile)
NOTE: recipe libidn2-2.3.7-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_package unihash changed to 19f03f17f937eef1c8f63f0d3e7130dbc37b544876934c0b15bab433d628fb15
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata became valid
NOTE: recipe coreutils-9.5-r0: task do_compile: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running task 2214 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_compile_ptest_base)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2215 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2217 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_ipk)
NOTE: Running task 2218 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_deb)
NOTE: recipe coreutils-9.5-r0: task do_install: Started
NOTE: Running task 2219 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2220 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_install)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_ipk unihash changed to facaa04b6f463bc166be49bb695d3650a33aa65208661407ad58f17f439a0f18
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_deb unihash changed to 67142602ff6bfea8bd4aff66bdda43e9af6d19b49b9399436dae86f9a5c3af08
NOTE: recipe libidn2-2.3.7-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_rpm unihash changed to 65813a42edad666a6eb78c22c22a7931e164e3058cb45e9ff165cc6a5cfbdec4
NOTE: recipe libidn2-2.3.7-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot)
NOTE: Running task 2222 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_package)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.7-r0: task do_package: Started
NOTE: recipe coreutils-9.5-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_install_ptest_base)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot unihash changed to 0dbf6afb3dfecde7b10264a72ac844a4780d7bce3346578b11bafd771554e489
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_populate_sysroot became valid
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Started
NOTE: Running setscene task 894 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 2224 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2225 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2226 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_configure)
NOTE: recipe curl-8.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2227 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.6-r0: task do_configure: Started
NOTE: recipe curl-8.8.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2228 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package)
NOTE: Running task 2229 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_populate_sysroot)
NOTE: recipe libidn2-2.3.7-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_package unihash changed to 0443e6d2cd81280ef32e594810b6391310f0c2d419b3f7c40a9de6769800b8ff
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata became valid
NOTE: recipe coreutils-9.5-r0: task do_populate_sysroot: Started
NOTE: recipe coreutils-9.5-r0: task do_package: Started
NOTE: Running setscene task 891 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Succeeded
NOTE: Running task 2230 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile_ptest_base)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2232 of 2360 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_create_spdx)
NOTE: recipe util-linux-2.40.2-r0: task do_package: Failed
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_create_spdx: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_compile: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe linux-yocto-6.6.35+git-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_package: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_configure: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_compile: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2232 tasks of which 1484 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801053748.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801053748.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-2.40.2-r0 do_package: QA Issue: util-linux: Files/directories were installed but not shipped in any package:
  /usr/lib/security/pam_lastlog2.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
util-linux: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: util-linux-2.40.2-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/util-linux/2.40.2/temp/log.do_package.3686964
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_package) failed with exit code '1'

--===============5163730545614158343==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-util-linux-libuuid-upgrade-2.40.1-2.40.2-.patch"

RnJvbSA3YWE3ZDBkMjNhMDUyN2VhOTAxMmU4ZTU4ZDgwZDk0YjJlZmIxOTdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAwNTo0NDoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXgsdXRpbC1saW51eC1saWJ1dWlkOiB1cGdyYWRlIDIuNDAuMSAtPgogMi40MC4yLDIu
NDAuMSAtPiAyLjQwLjIKCi0tLQogLi4ubGludXgtbGlidXVpZF8yLjQwLjEuYmIgPT4gdXRpbC1s
aW51eC1saWJ1dWlkXzIuNDAuMi5iYn0gfCAwCiBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4
L3V0aWwtbGludXguaW5jICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi91dGlsLWxpbnV4L3V0
aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggICAgICAgIHwgNCArKy0tCiAuLi4v
dXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoICAgICAgICAgICB8
IDQgKystLQogLi4uL3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRj
aCAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgvcHRlc3QucGF0Y2ggICAgICAgICB8IDYgKysrLS0tCiAuLi4ve3V0aWwtbGludXhfMi40MC4x
LmJiID0+IHV0aWwtbGludXhfMi40MC4yLmJifSAgICAgICAgICB8IDAKIDcgZmlsZXMgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1j
b3JlL3V0aWwtbGludXgve3V0aWwtbGludXgtbGlidXVpZF8yLjQwLjEuYmIgPT4gdXRpbC1saW51
eC1saWJ1dWlkXzIuNDAuMi5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvdXRp
bC1saW51eC97dXRpbC1saW51eF8yLjQwLjEuYmIgPT4gdXRpbC1saW51eF8yLjQwLjIuYmJ9ICgx
MDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC1saWJ1dWlkXzIuNDAuMS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC1saWJ1dWlkXzIuNDAuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi40MC4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVp
ZF8yLjQwLjIuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5j
CmluZGV4IDBmNWY4MzhlODQuLmQyYzEyMzEzNzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRp
bC1saW51eC91dGlsLWxpbnV4LmluYwpAQCAtNDAsNCArNDAsNCBAQCBTUkNfVVJJID0gIiR7S0VS
TkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvdXRpbC1saW51eC92JHtNQUpPUl9WRVJTSU9OfS91
dGlsLWxpbgogICAgICAgICAgICBmaWxlOi8vZmNudGwtbG9jay5jIFwKICAgICAgICAgICAgIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTllNjc2YWE1M2NjYjQ0YjZjMzlmMGZmZTAxYThmYTI3
NDg5MWM5MWJlZjE0NzQ3NTJmYWQ5MjQ2MWRlZjI0ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJk
NzhiMzdhNjZmNTkyMmQ3MGVkZjNiZGZiMDFhNmIzM2QzNGVkM2MzY2FmZDY2MjgyMDNiMmEyYjY3
YzhlOGIzIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4IDhlYTAwZGJi
OTUuLjMwNTA0ZTcwZTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGRhNThiNDE1MGY2OTMyZGUzNmM5NjJlYTY1NzcxM2JjZjRlYTQ0
YmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBmMzdhNGVhMzQ3NzVjNzU3ZDA2OTgy
NDQ2Yzc1MjgxNDZlOWVhN2EgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBG
bG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IE1vbiwgMTQgSnVuIDIwMjEgMTQ6
MDA6MzEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gdXRpbC1saW51eDogQWRkIHB0ZXN0CkBAIC0x
NCw3ICsxNCw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZQogIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmln
dXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCA2NTFlZjJiLi4yYTgwMTJlIDEwMDY0NAoraW5k
ZXggYWY4NmUxZS4uMDM3NWQyOSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29u
ZmlndXJlLmFjCiBAQCAtMTEsNyArMTEsNyBAQCBBQ19DT05GSUdfTUFDUk9fRElSKFttNF0pCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmln
dXJlLXNiaW5kaXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgvY29uZmlndXJlLXNiaW5kaXIucGF0Y2gKaW5kZXggNzRhYmRjMjAzOC4uMDRjMjJlY2IyNyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZp
Z3VyZS1zYmluZGlyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC9jb25maWd1cmUtc2JpbmRpci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDM4
N2Q3MTUxNmM5Nzg4OTljZmQ1NTZjYTUxMmY1MzBhMjEyYjRhOSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gODNiMDkzZDc5NGQ4Nzk3NDI0OWNiYjg1MmNjNjg0YWIxNzgzOWNlNCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBoaWwgQmx1bmRlbGwgPHBiQHBiY2wubmV0Pgog
RGF0ZTogTW9uLCAyNCBTZXAgMjAxMiAwNzoyNDo1MSArMDEwMAogU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4OiBFbnN1cmUgdGhhdCAke3NiaW5kaXJ9IGlzIHJlc3BlY3RlZApAQCAtMTQsNyAr
MTQsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0t
Z2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAyMzU5NGZmLi42NTFlZjJi
IDEwMDY0NAoraW5kZXggODJkMGU0Yi4uYWY4NmUxZSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5h
YwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMTEwLDcgKzExMCwxMCBAQCBBQ19TVUJTVChbcnVu
c3RhdGVkaXJdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5w
YXRjaAppbmRleCA4NzFiMGIyZDMwLi4yNTdkNWFhNGFjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVz
dC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlz
cGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDU0
NTBkMDMzOWNkN2VlMjdmNTNjMGYyZmFjMWNjNzRlZDliYmZiOCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gMjE4Y2EwNTE4YThlMjkxNGM1MWVhOGNmMDEwMjFmZjE4ZDU3ZDg1YiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVu
ZWEuY29tPgogRGF0ZTogVGh1LCAzIERlYyAyMDE1IDA0OjA4OjAwICswMTAwCiBTdWJqZWN0OiBb
UEFUQ0hdIERpc3BsYXkgdGVzdG5hbWUgZm9yIHN1YnRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaAppbmRleCA3MzQ1OTI2Yjg4
Li45YjM0Y2Y4MGY1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgvcHRlc3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4L3B0ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmOWJlNzNjM2UyYjBh
NGYwOTIzOTUwZGNiMDU4YmU4NWQzZWU4ZWQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA5NTYzMjI5N2FmZWRmM2MwMGYwNWY1NmY3N2JhMWVmNGQ5N2RmYmQ1IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogVHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBE
YXRlOiBUaHUsIDMgRGVjIDIwMTUgMDQ6MDg6MDAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGVm
aW5lIFRFU1RTIHZhcmlhYmxlCkBAIC0xMCwxMCArMTAsMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBQ
ZW5kaW5nCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9N
YWtlZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCA1MGFiOGQwLi43ZTIzNDBkIDEwMDY0NAor
aW5kZXggNTRlMGZkNC4uZWUyZDU1MyAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmFtCiArKysgYi9N
YWtlZmlsZS5hbQotQEAgLTY0LDYgKzY0LDcgQEAgdG1wZmlsZXNfREFUQSA9CitAQCAtNjUsNiAr
NjUsNyBAQCB0bXBmaWxlc19EQVRBID0KICBkaXN0X2Jhc2hjb21wbGV0aW9uX0RBVEEgPQogIGNo
ZWNrX1BST0dSQU1TID0KICBkaXN0X2NoZWNrX1NDUklQVFMgPQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDAuMS5iYiBiL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjIuYmIKc2ltaWxhcml0eSBpbmRleCAx
MDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8y
LjQwLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eF8yLjQwLjIuYmIKLS0gCjIuNDQuMAoK

--===============5163730545614158343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/util-linux-libuuid: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.2.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c"
packages/core2-64-poky-linux/util-linux-libuuid: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGSIZE changed from 64088 to 66976 (+5%)
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PKGSIZE changed from 89275 to 89786 (+1%)
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.2.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c"
packages/core2-64-poky-linux/util-linux: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PKGSIZE changed from 101680 to 105776 (+4%)
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PKGSIZE changed from 108658 to 108781 (+0%)
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
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PKGSIZE changed from 39032 to 43128 (+10%)
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGSIZE changed from 26043880 to 26100768 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dev: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-dev: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-doc: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGSIZE changed from 925857 to 925900 (+0%)
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
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PKGSIZE changed from 42462 to 42372 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGSIZE changed from 588676 to 588636 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGSIZE changed from 399882 to 399845 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGSIZE changed from 582875 to 582829 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGSIZE changed from 561655 to 562683 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PKGSIZE changed from 80546 to 80506 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGSIZE changed from 601821 to 601774 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGSIZE changed from 577183 to 577138 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PKGSIZE changed from 39433 to 39391 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PKGSIZE changed from 42965 to 42927 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PKGSIZE changed from 31706 to 31672 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGSIZE changed from 428571 to 429943 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PKGSIZE changed from 56707 to 56609 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGSIZE changed from 589753 to 589713 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 330598 to 330557 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGSIZE changed from 582239 to 582190 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGSIZE changed from 485074 to 485033 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGSIZE changed from 476452 to 476418 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGSIZE changed from 612373 to 612319 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PKGSIZE changed from 31114 to 31069 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGSIZE changed from 677010 to 676953 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGSIZE changed from 444994 to 444946 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGSIZE changed from 348598 to 348557 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGSIZE changed from 750380 to 750313 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGSIZE changed from 315534 to 315497 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGSIZE changed from 372564 to 372528 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PKGSIZE changed from 47373 to 47337 (-0%)
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
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PKGSIZE changed from 208104 to 212200 (+2%)
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
packages/core2-64-poky-linux/util-linux/util-linux-lsmem: PKGSIZE changed from 67704 to 71800 (+6%)
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
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PKGSIZE changed from 18560 to 22656 (+22%)
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-partx: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-partx: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGSIZE changed from 6116488 to 6116948 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rename: PV changed from "2.40.1" to "2.40.2"
packages/core2-64-poky-linux/util-linux/util-linux-rename: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rename: PKGSIZE changed from 22640 to 26736 (+18%)
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
packages/core2-64-poky-linux/util-linux/util-linux-src: PKGV changed from 2.40.1 [default] to 2.40.2 [default]
packages/core2-64-poky-linux/util-linux/util-linux-src: PKGSIZE changed from 5932937 to 5939575 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-src: FILELIST: directory renamed /usr/src/debug/util-linux/2.40.1/lib -> /usr/src/debug/util-linux/2.40.2/lib, directory renamed /usr/src/debug/util-linux/2.40.1/libblkid/samples -> /usr/src/debug/util-linux/2.40.2/libblkid/samples, directory renamed /usr/src/debug/util-linux/2.40.1/include -> /usr/src/debug/util-linux/2.40.2/include, directory renamed /usr/src/debug/util-linux/2.40.1/tests/helpers -> /usr/src/debug/util-linux/2.40.2/tests/helpers, directory renamed /usr/src/debug/util-linux/2.40.1/libfdisk/src -> /usr/src/debug/util-linux/2.40.2/libfdisk/src, directory renamed /usr/src/debug/util-linux/2.40.1/schedutils -> /usr/src/debug/util-linux/2.40.2/schedutils, directory renamed /usr/src/debug/util-linux/2.40.1/liblastlog2/src -> /usr/src/debug/util-linux/2.40.2/liblastlog2/src, directory renamed /usr/src/debug/util-linux/2.40.1/sys-utils -> /usr/src/debug/util-linux/2.40.2/sys-utils, directory renamed /usr/src/debug/util-linu
 x/2.40.1/libblkid/src/superblocks -> /usr/src/debug/util-linux/2.40.2/libblkid/src/superblocks, directory renamed /usr/src/debug/util-linux/2.40.1/libblkid/src -> /usr/src/debug/util-linux/2.40.2/libblkid/src, directory renamed /usr/src/debug/util-linux/2.40.1/text-utils -> /usr/src/debug/util-linux/2.40.2/text-utils, directory renamed /usr/src/debug/util-linux/2.40.1/disk-utils -> /usr/src/debug/util-linux/2.40.2/disk-utils, directory renamed /usr/src/debug/util-linux/2.40.1/Documentation -> /usr/src/debug/util-linux/2.40.2/Documentation, directory renamed /usr/src/debug/util-linux/2.40.1/libmount/src -> /usr/src/debug/util-linux/2.40.2/libmount/src, directory renamed /usr/src/debug/util-linux/2.40.1/login-utils -> /usr/src/debug/util-linux/2.40.2/login-utils, directory renamed /usr/src/debug/util-linux/2.40.1/libblkid/src/partitions -> /usr/src/debug/util-linux/2.40.2/libblkid/src/partitions, directory renamed /usr/src/debug/util-linux/2.40.1 -> /usr/src/debug/util-linux/2.40.2, d
 irectory renamed /usr/src/debug/util-linux/2.40.1/libsmartcols/src -> /usr/src/debug/util-linux/2.40.2/libsmartcols/src, directory renamed /usr/src/debug/util-linux/2.40.1/libfdisk/samples -> /usr/src/debug/util-linux/2.40.2/libfdisk/samples, directory renamed /usr/src/debug/util-linux/2.40.1/pam_lastlog2/src -> /usr/src/debug/util-linux/2.40.2/pam_lastlog2/src, directory renamed /usr/src/debug/util-linux/2.40.1/libblkid/src/topology -> /usr/src/debug/util-linux/2.40.2/libblkid/src/topology, directory renamed /usr/src/debug/util-linux/2.40.1/libuuid/src -> /usr/src/debug/util-linux/2.40.2/libuuid/src, directory renamed /usr/src/debug/util-linux/2.40.1/libmount/samples -> /usr/src/debug/util-linux/2.40.2/libmount/samples, directory renamed /usr/src/debug/util-linux/2.40.1/term-utils -> /usr/src/debug/util-linux/2.40.2/term-utils, directory renamed /usr/src/debug/util-linux/2.40.1/libsmartcols/samples -> /usr/src/debug/util-linux/2.40.2/libsmartcols/samples, removed "/usr/src/debug/ut
 il-linux/2.40.1/misc-utils/logger.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsclocks.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-bdev.c /usr/src/debug/util-linux/2.40.1/misc-utils/findmnt-verify.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsblk-devtree.c /usr/src/debug/util-linux/2.40.1/misc-utils/wipefs.c /usr/src/debug/util-linux/2.40.1/misc-utils/findfs.c /usr/src/debug/util-linux/2.40.1/misc-utils/whereis.c /usr/src/debug/util-linux/2.40.1/misc-utils/pipesz.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-unkn.c /usr/src/debug/util-linux/2.40.1/misc-utils/findmnt.h /usr/src/debug/util-linux/2.40.1/misc-utils/findmnt.c /usr/src/debug/util-linux/2.40.1/misc-utils/uuidparse.c /usr/src/debug/util-linux/2.40.1/misc-utils/hardlink.c /usr/src/debug/util-linux/2.40.1/misc-utils/blkid.c /usr/src/debug/util-linux/2.40.1/misc-utils/uuidd.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-sock-xinfo.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd.h /usr/src/debug/util-linu
 x/2.40.1/misc-utils/test_uuidd.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-sock.c /usr/src/debug/util-linux/2.40.1/misc-utils/namei.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsblk-properties.c /usr/src/debug/util-linux/2.40.1/misc-utils/kill.c /usr/src/debug/util-linux/2.40.1/misc-utils/look.c /usr/src/debug/util-linux/2.40.1/misc-utils/exch.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-sock.h /usr/src/debug/util-linux/2.40.1/misc-utils/getopt.c /usr/src/debug/util-linux/2.40.1/misc-utils/mcookie.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsblk.c /usr/src/debug/util-linux/2.40.1/misc-utils/waitpid.c /usr/src/debug/util-linux/2.40.1/misc-utils/lastlog2.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsblk.h /usr/src/debug/util-linux/2.40.1/misc-utils/lsblk-mnt.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-decode-file-flags.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-file.c /usr/src/debug/util-linux/2.40.1
 /misc-utils/fadvise.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-fifo.c /usr/src/debug/util-linux/2.40.1/misc-utils/lsfd-cdev.c /usr/src/debug/util-linux/2.40.1/misc-utils/uuidgen.c /usr/src/debug/util-linux/2.40.1/misc-utils/lslocks.c /usr/src/debug/util-linux/2.40.1/misc-utils/rename.c /usr/src/debug/util-linux/2.40.1/misc-utils/fincore.c /usr/src/debug/util-linux/2.40.1/misc-utils/enosys.c /usr/src/debug/util-linux/2.40.1/misc-utils/cal.c", added "/usr/src/debug/util-linux/2.40.2/misc-utils/logger.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsclocks.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-bdev.c /usr/src/debug/util-linux/2.40.2/misc-utils/findmnt-verify.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsblk-devtree.c /usr/src/debug/util-linux/2.40.2/misc-utils/wipefs.c /usr/src/debug/util-linux/2.40.2/misc-utils/findfs.c /usr/src/debug/util-linux/2.40.2/misc-utils/whereis.c /usr/src/debug/util-linux/2.40.2/misc-utils/pipesz.c /usr/src/debug/util-linux/2.40.2/misc-
 utils/lsfd-unkn.c /usr/src/debug/util-linux/2.40.2/misc-utils/findmnt.h /usr/src/debug/util-linux/2.40.2/misc-utils/findmnt.c /usr/src/debug/util-linux/2.40.2/misc-utils/uuidparse.c /usr/src/debug/util-linux/2.40.2/misc-utils/hardlink.c /usr/src/debug/util-linux/2.40.2/misc-utils/blkid.c /usr/src/debug/util-linux/2.40.2/misc-utils/uuidd.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-sock-xinfo.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd.h /usr/src/debug/util-linux/2.40.2/misc-utils/test_uuidd.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-sock.c /usr/src/debug/util-linux/2.40.2/misc-utils/namei.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsblk-properties.c /usr/src/debug/util-linux/2.40.2/misc-utils/kill.c /usr/src/debug/util-linux/2.40.2/misc-utils/look.c /usr/src/debug/util-linux/2.40.2/misc-utils/exch.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-sock.h /usr/src/debug/util-linux/2.40.2/misc-utils/getopt.c /u
 sr/src/debug/util-linux/2.40.2/misc-utils/mcookie.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsblk.c /usr/src/debug/util-linux/2.40.2/misc-utils/waitpid.c /usr/src/debug/util-linux/2.40.2/misc-utils/lastlog2.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsblk.h /usr/src/debug/util-linux/2.40.2/misc-utils/lsblk-mnt.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-decode-file-flags.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-file.c /usr/src/debug/util-linux/2.40.2/misc-utils/fadvise.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-fifo.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-cdev.c /usr/src/debug/util-linux/2.40.2/misc-utils/uuidgen.c /usr/src/debug/util-linux/2.40.2/misc-utils/lslocks.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-pidfd.h /usr/src/debug/util-linux/2.40.2/misc-utils/rename.c /usr/src/debug/util-linux/2.40.2/misc-utils/lsfd-pidfd.c /usr/src/debug/util-linux/2.40.2/misc-utils/fincore.c /usr/src/debug/util-linux/2.40.2/misc-utils/enosys.c /us
 r/src/debug/util-linux/2.40.2/misc-utils/cal.c"
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

--===============5163730545614158343==--

