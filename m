Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F920CDB47A
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50423.1781195505087963816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=c7ejzmsA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KmAwujAK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb7869d2a-823667a0-7be1-48f3-a3e6-fafda702169d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lD2OstvcVrCSiOzQOqj6Q6WL3HarHtS3H/VOr1fP5P0=;
	b=c7ejzmsAS6bPHZkl1HiYkcX51FCxhV2Qeq9WtIotkRj59FE1SX+7lDHMcqW3a2PC
	gOC2flmM7UUswm7yu6kzwWisLA5dO1OfNjYBjyg29ys28jW6c8hVsheoTucCDsKKIjF
	g16CsEbdU2oHINrssyJTH/f8V0Xi7b/7PWBAFDu0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lD2OstvcVrCSiOzQOqj6Q6WL3HarHtS3H/VOr1fP5P0=;
	b=KmAwujAKzET2Fc0dQimx0wnZBo4CI0hF01zCEX9Gd/So9V3cN2Ut0Epi9TWy2TR8
	4ePkAZyauGrVg8UZboPV8d14iPE4AaEl+kXKy+fn8ZHIfS6XQ6QeKnS8UloSmqf+OFs
	jjnxCQEzzK7Kg+lapD4CNDWR0O5LkVOhv8kNkxdQ=
Content-Type: multipart/mixed; boundary="===============9001977325126745060=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20260529 FAILED
Message-ID: <0101019eb7869d2a-823667a0-7be1-48f3-a3e6-fafda702169d-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238521

--===============9001977325126745060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ltp* to *20260529* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ltp-upgrade-20260130-20260529.patch
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
From 496b009444d5b8c6144abbd183fecc9c3dd405dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 11:21:31 +0000
Subject: [PATCH] ltp: upgrade 20260130 -> 20260529

---
 ...01-Add-__clear_cache-declaration-for-clang.patch |  4 ++--
 .../ltp/0001-Remove-OOM-tests-from-runtest-mm.patch |  2 +-
 ...0001-ltp-fix-build-failure-with-glibc-2.43.patch | 13 +++++++++----
 ...emctl08-Skip-semctl08-when-__USE_TIME64_RE.patch |  6 +++---
 .../ltp/{ltp_20260130.bb => ltp_20260529.bb}        |  2 +-
 5 files changed, 16 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20260130.bb => ltp_20260529.bb} (99%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
index 24e8762f77..07778ec6fd 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
@@ -1,4 +1,4 @@
-From a2ce04cb82d545f3dbab71de7fa55eaad3df3063 Mon Sep 17 00:00:00 2001
+From cefa5ede50985803124fd09e9c6f2d07e2471e1b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 10 Jun 2024 22:52:56 -0700
 Subject: [PATCH] Add __clear_cache declaration for clang
@@ -19,7 +19,7 @@ Cc: Hui Min Mina Chou <minachou@andestech.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
-index 1dde9e87b..6a6f5fe5e 100644
+index f2984e2dc..5685bb864 100644
 --- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
 +++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
 @@ -19,6 +19,7 @@
diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 860b2f127f..3a5ac2b5a0 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From bb9146dd322af98a7bb96ad0d84ec376589c6cde Mon Sep 17 00:00:00 2001
+From b7bf6f49fdc98dc0aac9ca6f2d581688e083ed7a Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
index 7c78660e3e..c9de7835d5 100644
--- a/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
@@ -1,4 +1,7 @@
-ltp: fix build failure with glibc 2.43
+From ce6543f8db9cf41ea7c7dc3d86eb26ee79873fdd Mon Sep 17 00:00:00 2001
+From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+Date: Thu, 12 Mar 2026 09:10:21 -0700
+Subject: [PATCH] ltp: fix build failure with glibc 2.43
 
 glibc 2.43 added native openat2() support for the first time. This
 caused compatibility issues with LTP's internal openat2 definitions
@@ -13,15 +16,18 @@ own internal definitions.this is a workaround until the fix is found.
 Upstream-Status: Pending
 
 Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ include/lapi/openat2.h | 5 +++++
+ 1 file changed, 5 insertions(+)
 
 diff --git a/include/lapi/openat2.h b/include/lapi/openat2.h
 index 03327bdb7..bd44573c9 100644
 --- a/include/lapi/openat2.h
 +++ b/include/lapi/openat2.h
 @@ -14,6 +14,11 @@
-
+ 
  #include "config.h"
-
+ 
 +/* glibc 2.43 provides openat2 but LTP uses its own syscall wrapper */
 +#ifdef HAVE_OPENAT2
 +#undef HAVE_OPENAT2
@@ -30,4 +36,3 @@ index 03327bdb7..bd44573c9 100644
  #ifndef HAVE_OPENAT2
  /*
   * Arguments for how openat2(2) should open the target path. If only @flags and
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
index 364e203e23..e38e9c3e21 100644
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
@@ -1,4 +1,4 @@
-From 09364a758df9d89a0968894376f82f636441addb Mon Sep 17 00:00:00 2001
+From 89c83185e757ddaeb0262c17a10f605056f53916 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Fri, 23 May 2025 15:17:49 +0800
 Subject: [PATCH] syscalls/semctl08: Skip semctl08 when __USE_TIME64_REDIRECTS
@@ -20,12 +20,12 @@ Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
  1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
-index f4549adf4..28776f266 100644
+index 083179c92..a98eb35d6 100644
 --- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
 +++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
 @@ -12,7 +12,11 @@
  #include "tst_test.h"
- #include "libnewipc.h"
+ #include "tse_newipc.h"
  
 -#ifdef HAVE_SEMID64_DS_TIME_HIGH
 +#if !defined(HAVE_SEMID64_DS_TIME_HIGH)
diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-extended/ltp/ltp_20260529.bb
similarity index 99%
rename from meta/recipes-extended/ltp/ltp_20260130.bb
rename to meta/recipes-extended/ltp/ltp_20260529.bb
index 4183b5d497..1ee63ca2e0 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260529.bb
@@ -24,7 +24,7 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "6a60ae592cd375f004df0694efc7d50ddae9aa5e"
+SRCREV = "3a64d78f58bdceba93ed321e91215fb969a047ed"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-- 
2.47.1


--===============9001977325126745060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-e71d0383a6791459a36008f2ac620d7e04c9347a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e71d0383a6791459a36008f2ac620d7e04c9347a"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 501 Local 487 Mirrors 0 Missed 14 Current 957 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1066 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/tar/tar_1.35.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1068 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gdb/gdb_17.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1079 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cpio/cpio_2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1082 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1092 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1112 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1114 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/quota/quota_4.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1118 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1124 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1131 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1134 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1136 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/logrotate/logrotate_3.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1145 of 1458 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1146 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gzip/gzip_1.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1153 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iputils/iputils_20250605.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1157 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_create_spdx_setscene)
NOTE: recipe gdb-17.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-7.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-kirk-4.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe quota-4.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cronie-1.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe logrotate-3.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gzip-1.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe iputils-20250605-r0: task do_create_spdx_setscene: Started
NOTE: recipe zip-native-3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdb-17.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-kirk-4.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1160 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_create_spdx_setscene)
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iproute2-7.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1162 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/which/which_2.23.bb:do_create_spdx_setscene)
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe quota-4.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1169 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/expect/expect_5.45.4.bb:do_create_spdx_setscene)
NOTE: recipe cronie-1.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1177 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe logrotate-3.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zip-native-3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1249 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe gzip-1.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iputils-20250605-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1278 of 1458 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1282 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1288 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1298 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1299 of 1458 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1328 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_spdx_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Started
NOTE: recipe which-2.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_create_spdx_setscene: Started
NOTE: recipe ltp-20260529-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-yocto-6.18.33+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe zip-native-3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zip-native-3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1346 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_recipe_spdx_setscene)
NOTE: recipe which-2.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ltp-20260529-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1374 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1378 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1381 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe zip-native-3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.18.33+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zip-native-3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1457 of 1458 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zip/zip_3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zip-native-3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1458 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zip-native-3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2410 of 3262 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_fetch)
NOTE: recipe ltp-20260529-r0: task do_fetch: Started
NOTE: Running task 3026 of 3262 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_create_recipe_spdx)
NOTE: recipe ltp-20260529-r0: task do_create_recipe_spdx: Started
NOTE: recipe ltp-20260529-r0: task do_fetch: Succeeded
NOTE: Running task 3245 of 3262 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_unpack)
NOTE: Running task 3246 of 3262 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_prepare_recipe_sysroot)
NOTE: recipe ltp-20260529-r0: task do_unpack: Started
NOTE: recipe ltp-20260529-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20260529-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ltp-20260529-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ltp-20260529-r0: task do_unpack: Succeeded
NOTE: Running task 3247 of 3262 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_patch)
NOTE: recipe ltp-20260529-r0: task do_patch: Started
NOTE: recipe ltp-20260529-r0: task do_patch: Succeeded
NOTE: Running task 3248 of 3262 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_deploy_source_date_epoch)
NOTE: Running task 3249 of 3262 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_populate_lic)
NOTE: recipe ltp-20260529-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20260529-r0: task do_populate_lic: Started
NOTE: recipe ltp-20260529-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_deploy_source_date_epoch unihash changed to 53ce7cf78dcc54d0c94f39e5b48540e8ce8984f02f15b34c107e383a42c99635
NOTE: recipe ltp-20260529-r0: task do_populate_lic: Succeeded
NOTE: Running task 3250 of 3262 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_populate_lic unihash changed to bd2b03169051979b654d1fdfd789a3268c3805496a8ef2f5462c6277c236a872
NOTE: Setscene tasks completed
NOTE: recipe ltp-20260529-r0: task do_configure: Started
NOTE: recipe ltp-20260529-r0: task do_configure: Succeeded
NOTE: Running task 3251 of 3262 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_compile)
NOTE: recipe ltp-20260529-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 HOSTCC=gcc  HOST_CFLAGS=-isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native/usr/include -O2 -pipe HOST_LDFLAGS=-L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native/usr/lib                         -L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native/lib                         -Wl,--enable-new-dtags                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native/lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native/usr/lib                         -Wl,-r
 path,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread KVM_LD=x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot
| make -C "lib" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| make -C "libs" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/libs/Makefile" all
| if git describe >/dev/null 2>&1; then \
| 	git describe > "Version"; \
| else \
| 	cp /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/VERSION "Version"; \
| fi
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/libs'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib'
| GEN ltp-version.h
| CC lib/tst_ansi_color.o
| CC lib/cloner.o
| In file included from safe_stdio.c:23:
| safe_stdio.c: In function 'safe_fclose':
| ../include/old/test.h:129:17: warning: pointer 'f' may be used after 'fclose' [-Wuse-after-free]
|   129 |                 tst_brk_(file, lineno, flags, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_stdio.c:47:17: note: in expansion of macro 'tst_brkm_'
|    47 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_stdio.c:44:15: note: call to 'fclose' here
|    44 |         ret = fclose(f);
|       |               ^~~~~~~~~
| ../include/old/test.h:131:17: warning: pointer 'f' may be used after 'fclose' [-Wuse-after-free]
|   131 |                 tst_brkm__(file, lineno, flags, cleanup, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_stdio.c:47:17: note: in expansion of macro 'tst_brkm_'
|    47 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_stdio.c:44:15: note: call to 'fclose' here
|    44 |         ret = fclose(f);
|       |               ^~~~~~~~~
| ../include/old/test.h:129:17: warning: pointer 'f' may be used after 'fclose' [-Wuse-after-free]
|   129 |                 tst_brk_(file, lineno, flags, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_stdio.c:50:17: note: in expansion of macro 'tst_brkm_'
|    50 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_stdio.c:44:15: note: call to 'fclose' here
|    44 |         ret = fclose(f);
|       |               ^~~~~~~~~
| ../include/old/test.h:131:17: warning: pointer 'f' may be used after 'fclose' [-Wuse-after-free]
|   131 |                 tst_brkm__(file, lineno, flags, cleanup, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_stdio.c:50:17: note: in expansion of macro 'tst_brkm_'
|    50 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_stdio.c:44:15: note: call to 'fclose' here
|    44 |         ret = fclose(f);
|       |               ^~~~~~~~~
| tlibio.c: In function 'lio_write_buffer':
| tlibio.c:625:17: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   625 |                 sigset(sig, lio_async_signal_handler);
|       |                 ^~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/sys/param.h:28,
|                  from tlibio.c:83:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| tlibio.c:708:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   708 |                         sighold(sig);
|       |                         ^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| tlibio.c:715:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   715 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:737:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   737 |                         sighold(sig);
|       |                         ^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| tlibio.c:744:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   744 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:773:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   773 |                         sighold(sig);
|       |                         ^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| CC lib/get_path.o
| tlibio.c:780:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   780 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:509:22: warning: unused parameter 'wrd' [-Wunused-parameter]
|   509 |                 long wrd)       /* to allow future features, use zero for now */
|       |                 ~~~~~^~~
| tlibio.c: In function 'lio_read_buffer':
| tlibio.c:1054:17: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|  1054 |                 sigset(sig, lio_async_signal_handler);
|       |                 ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| tlibio.c:1137:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1137 |                         sighold(sig);
|       |                         ^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| tlibio.c:1144:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1144 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:1164:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1164 |                         sighold(sig);
|       |                         ^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| tlibio.c:1171:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1171 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:1198:25: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1198 |                         sighold(sig);
|       |                         ^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| tlibio.c:1205:33: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1205 |                                 sigrelse(sig);
|       |                                 ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:937:22: warning: unused parameter 'wrd' [-Wunused-parameter]
|   937 |                 long wrd)       /* to allow future features, use zero for now */
|       |                 ~~~~~^~~
| tlibio.c: In function 'lio_check_asyncio':
| tlibio.c:1339:17: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1339 |                 sigrelse(aiocbp->aio_sigevent.sigev_signo);
|       |                 ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c: In function 'lio_wait4asyncio':
| tlibio.c:1479:25: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1479 |                         sigrelse(aiocbp->aio_sigevent.sigev_signo);
|       |                         ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| tlibio.c:1487:25: warning: 'sigrelse' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|  1487 |                         sigrelse(aiocbp->aio_sigevent.sigev_signo);
|       |                         ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:359:12: note: declared here
|   359 | extern int sigrelse (int __sig) __THROW
|       |            ^~~~~~~~
| CC libs/ipc/tse_msgctl.o
| CC libs/ipc/tse_ipc.o
| tst_af_alg.c: In function 'init_sockaddr_alg':
| tst_af_alg.c:62:9: warning: '__builtin_strncpy' specified bound 64 equals destination size [-Wstringop-truncation]
|    62 |         strncpy((char *)addr->salg_name, algname, sizeof(addr->salg_name));
|       |         ^
| AR libltpipc.a
| CC lib/random_range.o
| RANLIB libltpipc.a
| CC lib/safe_stdio.o
| In file included from safe_macros.c:25:
| safe_macros.c: In function 'safe_closedir':
| ../include/old/test.h:129:17: warning: pointer 'dirp' may be used after 'closedir' [-Wuse-after-free]
|   129 |                 tst_brk_(file, lineno, flags, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_macros.c:1058:17: note: in expansion of macro 'tst_brkm_'
|  1058 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_macros.c:1055:16: note: call to 'closedir' here
|  1055 |         rval = closedir(dirp);
|       |                ^~~~~~~~~~~~~~
| ../include/old/test.h:131:17: warning: pointer 'dirp' may be used after 'closedir' [-Wuse-after-free]
|   131 |                 tst_brkm__(file, lineno, flags, cleanup, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_macros.c:1058:17: note: in expansion of macro 'tst_brkm_'
|  1058 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_macros.c:1055:16: note: call to 'closedir' here
|  1055 |         rval = closedir(dirp);
|       |                ^~~~~~~~~~~~~~
| ../include/old/test.h:129:17: warning: pointer 'dirp' may be used after 'closedir' [-Wuse-after-free]
|   129 |                 tst_brk_(file, lineno, flags, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_macros.c:1061:17: note: in expansion of macro 'tst_brkm_'
|  1061 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_macros.c:1055:16: note: call to 'closedir' here
|  1055 |         rval = closedir(dirp);
|       |                ^~~~~~~~~~~~~~
| ../include/old/test.h:131:17: warning: pointer 'dirp' may be used after 'closedir' [-Wuse-after-free]
|   131 |                 tst_brkm__(file, lineno, flags, cleanup, fmt, ##__VA_ARGS__); \
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| safe_macros.c:1061:17: note: in expansion of macro 'tst_brkm_'
|  1061 |                 tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
|       |                 ^~~~~~~~~
| safe_macros.c:1055:16: note: call to 'closedir' here
|  1055 |         rval = closedir(dirp);
|       |                ^~~~~~~~~~~~~~
| CC lib/parse_opts.o
| CC lib/safe_pthread.o
| CC lib/tst_checksum.o
| CC lib/safe_file_ops.o
| CC lib/tst_arch.o
| CC lib/tst_af_alg.o
| CC lib/tst_assert.o
| tst_capability.c:82:6: warning: conflicting types for 'tst_cap_setup' due to enum/integer mismatch; have 'void(struct tst_cap *, unsigned int)' [-Wenum-int-mismatch]
|    82 | void tst_cap_setup(struct tst_cap *caps, unsigned int action_mask)
|       |      ^~~~~~~~~~~~~
| In file included from ../include/tst_test.h:41,
|                  from tst_capability.c:9:
| ../include/tst_capability.h:133:6: note: previous declaration of 'tst_cap_setup' with type 'void(struct tst_cap *, enum tst_cap_act)'
|   133 | void tst_cap_setup(struct tst_cap *cap, enum tst_cap_act action_mask);
|       |      ^~~~~~~~~~~~~
| CC lib/tst_bool_expr.o
| CC lib/safe_net.o
| CC lib/tst_buffers.o
| CC lib/tst_capability.o
| CC lib/tst_checkpoint.o
| CC libs/newipc/tse_newipc.o
| AR libltpnewipc.a
| In file included from tst_clone.c:11:
| ../include/lapi/sched.h: In function 'ltp_clone3':
| ../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| RANLIB libltpnewipc.a
| CC lib/tst_clone.o
| CC lib/tst_coredump.o
| CC lib/tst_cpu.o
| CC lib/tlibio.o
| CC lib/tst_dir_is_empty.o
| CC lib/tst_crypto.o
| CC lib/tst_fill_file.o
| CC lib/tst_cmd.o
| CC lib/tst_clocks.o
| CC lib/tst_epoll.o
| CC lib/tst_fs_has_free.o
| CC lib/tst_get_bad_addr.o
| CC lib/tst_fs_type.o
| CC lib/tst_fill_fs.o
| CC libs/numa/tse_numa.o
| AR libltpnuma.a
| RANLIB libltpnuma.a
| CC lib/tst_fs_setup.o
| CC lib/tst_ioctl.o
| CC lib/tst_kernel.o
| CC lib/tst_fd.o
| CC lib/tst_hugepage.o
| CC lib/tst_fs_link_count.o
| CC lib/safe_macros.o
| CC lib/tst_kvercmp.o
| CC lib/tst_rand_data.o
| CC lib/tst_cgroup.o
| CC lib/tst_path_exists.o
| CC lib/tst_mkfs.o
| CC lib/tst_device.o
| In file included from tst_net.c:17:
| ../include/lapi/sched.h: In function 'ltp_clone3':
| ../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC lib/tst_module.o
| CC lib/tst_parse_opts.o
| CC lib/tst_memutils.o
| CC lib/tst_path_has_mnt_flags.o
| tst_netlink.c: In function 'tst_netlink_add_message':
| tst_netlink.c:250:16: warning: variable 'size' set but not used [-Wunused-but-set-variable=]
|   250 |         size_t size;
|       |                ^~~~
| CC lib/tst_process_state.o
| CC lib/tst_net.o
| CC lib/tst_pid.o
| CC lib/tst_resource.o
| CC lib/tst_kconfig.o
| tst_sig.c: In function 'tst_sig':
| tst_sig.c:210:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
|   210 |                         if (fork_flag == FORK)
|       |                            ^
| tst_sig.c:213:17: note: here
|   213 |                 default:
|       |                 ^~~~~~~
| CC lib/tst_rtctime.o
| CC libs/sigwait/tse_sigwait.o
| AR libltpsigwait.a
| RANLIB libltpsigwait.a
| CC lib/tst_sig.o
| CC lib/tst_safe_io_uring.o
| CC lib/tst_safe_timerfd.o
| CC lib/tst_netdevice.o
| CC lib/tst_netlink.o
| CC lib/tst_safe_file_at.o
| CC lib/tst_security.o
| CC lib/tst_safe_sysv_ipc.o
| CC lib/tst_sig_proc.o
| CC lib/tst_status.o
| CC lib/tst_thread_state.o
| CC lib/tst_res.o
| CC lib/tst_supported_fs_types.o
| CC lib/tst_taint.o
| CC lib/tst_sys_conf.o
| CC lib/tst_test_macros.o
| CC lib/tst_safe_macros.o
| CC lib/tst_virt.o
| CC lib/tst_timer.o
| CC libs/swap/tse_swap.o
| AR libltpswap.a
| RANLIB libltpswap.a
| CC lib/tst_uid.o
| CC lib/tst_tmpdir.o
| CC lib/tst_wallclock.o
| CC lib/tst_timer_test.o
| CC libs/uinput/tse_uinput.o
| AR libltpuinput.a
| RANLIB libltpuinput.a
| CC libs/ujson/ujson_common.o
| CC libs/ujson/ujson_utf.o
| CC libs/ujson/ujson_writer.o
| CC lib/tst_test.o
| AR libltp.a
| RANLIB libltp.a
| CC libs/ujson/ujson_reader.o
| AR libujson.a
| RANLIB libujson.a
| CC libs/vdso/tse_parse_vdso.o
| CC lib/newlib_tests/test01
| CC lib/newlib_tests/test13
| CC lib/newlib_tests/test19
| CC lib/newlib_tests/test02
| CC lib/newlib_tests/test06
| CC lib/newlib_tests/test05
| CC lib/newlib_tests/test04
| CC lib/newlib_tests/test14
| CC lib/newlib_tests/test07
| CC lib/newlib_tests/test20
| CC lib/newlib_tests/test11
| CC lib/newlib_tests/test03
| CC lib/newlib_tests/test09
| CC lib/newlib_tests/test08
| CC lib/newlib_tests/test15
| CC libs/vdso/vdso_helpers.o
| AR libltpvdso.a
| RANLIB libltpvdso.a
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/libs'
| CC lib/newlib_tests/test_assert
| CC lib/newlib_tests/test22
| CC lib/newlib_tests/test_brk_fail
| CC lib/newlib_tests/test_brk_variant
| CC lib/newlib_tests/test_exec_child
| CC lib/newlib_tests/test_brk_child
| CC lib/newlib_tests/test_brk_pass
| CC lib/newlib_tests/test_brk_parent
| CC lib/newlib_tests/test_fail_variant
| CC lib/newlib_tests/test_children_cleanup
| CC lib/newlib_tests/test_kconfig
| CC lib/newlib_tests/test_kconfig01
| CC lib/newlib_tests/test_exec
| CC lib/newlib_tests/test_guarded_buf
| CC lib/newlib_tests/test_kconfig02
| CC lib/newlib_tests/test_kconfig03
| CC lib/newlib_tests/test_runtime02
| CC lib/newlib_tests/test_runtime01
| CC lib/newlib_tests/test_macros01
| CC lib/newlib_tests/test_zero_hugepage
| CC lib/newlib_tests/test_macros06
| CC lib/newlib_tests/test_macros03
| CC lib/newlib_tests/test_macros04
| CC lib/newlib_tests/test_macros05
| CC lib/newlib_tests/tst_capability02
| CC lib/newlib_tests/tst_capability01
| CC lib/newlib_tests/test_parse_filesize
| CC lib/newlib_tests/tst_bool_expr
| CC lib/newlib_tests/tst_cgroup01
| CC lib/newlib_tests/test_macros02
| CC lib/newlib_tests/tst_cgroup02
| CC lib/newlib_tests/test_timer
| CC lib/newlib_tests/tst_checkpoint_child
| CC lib/newlib_tests/tst_checkpoint_parent
| CC lib/newlib_tests/tst_checkpoint_wait_timeout
| CC lib/newlib_tests/tst_checkpoint
| CC lib/newlib_tests/tst_checkpoint_wake_timeout
| CC lib/newlib_tests/tst_needs_cmds01
| CC lib/newlib_tests/tst_needs_cmds02
| CC lib/newlib_tests/tst_expiration_timer
| CC lib/newlib_tests/tst_device
| CC lib/newlib_tests/tst_filesystems01
| CC lib/newlib_tests/tst_needs_cmds03
| CC lib/newlib_tests/tst_needs_cmds04
| CC lib/newlib_tests/tst_needs_cmds05
| CC lib/newlib_tests/tst_needs_cmds06
| CC lib/newlib_tests/tst_needs_cmds07
| CC lib/newlib_tests/tst_needs_cmds08
| CC lib/newlib_tests/tst_print_result
| CC lib/newlib_tests/tst_res_flags
| CC lib/newlib_tests/tst_res_hexd
| CC lib/newlib_tests/tst_safe_fileops
| CC lib/newlib_tests/tst_safe_sscanf
| CC lib/newlib_tests/tst_fuzzy_sync03
| CC lib/newlib_tests/tst_strstatus
| CC lib/newlib_tests/variant
| CC lib/newlib_tests/tst_fuzzy_sync02
| CC lib/newlib_tests/tst_fuzzy_sync01
| CC lib/tests/tst_cleanup_once
| tst_dataroot02.c: In function 'main':
| tst_dataroot02.c:51:36: warning: '/datafiles' directive output may be truncated writing 10 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    51 |         snprintf(tmp, PATH_MAX, "%s/datafiles", curdir);
|       |                                    ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/stdio.h:974,
|                  from ../../include/old/test.h:14,
|                  from tst_dataroot02.c:23:
| In function 'snprintf',
|     inlined from 'main' at tst_dataroot02.c:51:2:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 11 and 4106 bytes into a destination of size 4096
|    68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    69 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    70 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| tst_dataroot03.c: In function 'main':
| tst_dataroot03.c:51:36: warning: '/datafiles' directive output may be truncated writing 10 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    51 |         snprintf(tmp, PATH_MAX, "%s/datafiles", curdir);
|       |                                    ^~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/stdio.h:974,
|                  from ../../include/old/test.h:14,
|                  from tst_dataroot03.c:23:
| In function 'snprintf',
|     inlined from 'main' at tst_dataroot03.c:51:2:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 11 and 4106 bytes into a destination of size 4096
|    68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    69 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    70 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| CC lib/tests/tst_fs_fill_hardlinks
| CC lib/tests/tst_record_childstatus
| CC lib/tests/tst_fs_fill_subdirs
| CC lib/tests/tst_strsig
| CC lib/tests/tst_strerrno
| CC lib/tests/tst_device
| CC lib/tests/tst_process_state
| CC lib/tests/tst_tmpdir_test
| CC lib/tests/tst_dataroot01
| CC lib/tests/tst_dataroot02
| CC lib/tests/tst_dataroot03
| CC lib/tests/tst_safe_macros
| CC lib/tests/trerrno
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib'
| make -C "utils" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/utils/Makefile" all
| make -C "testcases" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/testcases/Makefile" all
| make -C "tools" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/tools/Makefile" all
| make -C "metadata" \
| 	-f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/metadata/Makefile" all
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/utils'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/testcases'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/metadata'
| make[1]: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/tools'
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[4]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| HOSTCC metadata/metaparse-sh
| CC testcases/commands/file/datafiles/in
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[4]: Nothing to be done for 'all'.
| skip: 1, FORCE_MODULES:
| make[3]: Nothing to be done for 'all'.
| make[4]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[4]: Nothing to be done for 'all'.
| CC testcases/commands/ldd/datafiles/lddfile3.o
| CC testcases/commands/ldd/datafiles/main.o
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -sha
 red -o lddfile3.obj.so lddfile3.o
| CC testcases/commands/ldd/datafiles/lddfile1.o
| CC testcases/commands/ldd/datafiles/lddfile2.o
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -sha
 red -o lddfile1.obj.so lddfile1.o
| CC testcases/commands/ldd/datafiles/lddfile5.o
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -sha
 red -o lddfile2.obj.so lddfile2.o
| CC testcases/commands/ldd/datafiles/lddfile4.o
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -sha
 red -o lddfile5.obj.so lddfile5.o
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -sha
 red -o lddfile4.obj.so lddfile4.o
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -O2 -g -fcanon-prefix-map  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529=/usr/src/debug/ltp/20260529  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot-native=  -pipe -fomit-frame-pointer -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -std=gnu99 -O -
 o lddfile.out main.o lddfile1.obj.so lddfile2.obj.so lddfile3.obj.so lddfile4.obj.so lddfile5.obj.so
| CC tools/apicmds/ltpapicmd.o
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now  -L../../lib  ltpapicmd.o  -lltp -o tst_brk
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now  -L../../lib  ltpapicmd.o  -lltp -o tst_brkm
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now  -L../../lib  ltpapicmd.o  -lltp -o tst_exit
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now  -L../../lib  ltpapicmd.o  -lltp -o tst_res
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now  -L../../lib  ltpapicmd.o  -lltp -o tst_resm
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now  -L../../lib  ltpapicmd.o  -lltp -o tst_ncpus
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now  -L../../lib  ltpapicmd.o  -lltp -o tst_ncpus_conf
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now  -L../../lib  ltpapicmd.o  -lltp -o tst_ncpus_max
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now  -L../../lib  ltpapicmd.o  -lltp -o tst_fs_has_free
| rm lddfile2.o lddfile1.o lddfile4.o lddfile3.o lddfile5.o
| make[3]: Nothing to be done for 'all'.
| skip: 1, FORCE_MODULES:
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| CC utils/benchmark/ebizzy-0.3/ebizzy
| make[3]: Nothing to be done for 'all'.
| make -C "lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/utils/sctp/lib/Makefile" all
| make -C "testlib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/utils/sctp/testlib/Makefile" all
| make[2]: Nothing to be done for 'all'.
| make[2]: Nothing to be done for 'all'.
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/tools'
| CC testcases/commands/nm/datafiles/f1.o
| CC testcases/commands/nm/datafiles/f2.o
| CC testcases/commands/nm/datafiles/f3.o
| x86_64-poky-linux-gcc-ar rcs lib.a f1.o f2.o f3.o
| CC testcases/commands/nm/datafiles/f1
| CC testcases/commands/nm/datafiles/f2
| CC testcases/commands/nm/datafiles/f3
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| CC utils/sctp/lib/peeloff.o
| CC utils/sctp/lib/opt_info.o
| connectx.c:78:12: warning: 'sctp_connectx_orig' alias between functions of incompatible types 'int(int)' and 'int(int,  struct sockaddr *, int)' [-Wattribute-alias=]
|    78 | extern int sctp_connectx_orig (int)
|       |            ^~~~~~~~~~~~~~~~~~
| connectx.c:67:5: note: aliased declaration here
|    67 | int __sctp_connectx(int fd, struct sockaddr *addrs, int addrcnt)
|       |     ^~~~~~~~~~~~~~~
| CC utils/sctp/lib/bindx.o
| CC utils/sctp/lib/sendmsg.o
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| CC utils/sctp/lib/recvmsg.o
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| CC utils/sctp/lib/addrs.o
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| sctputil.c: In function 'test_peer_addr':
| sctputil.c:374:19: warning: variable 'addrs_size' set but not used [-Wunused-but-set-variable=]
|   374 |         socklen_t addrs_size = 0;
|       |                   ^~~~~~~~~~
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| CC utils/sctp/lib/connectx.o
| AR libsctp.a
| make[4]: Nothing to be done for 'all'.
| RANLIB libsctp.a
| make[3]: Nothing to be done for 'all'.
| make[3]: Nothing to be done for 'all'.
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| HOSTCC metadata/metaparse
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/metadata/parse.sh > ltp.json
| CC utils/sctp/testlib/sctputil.o
| AR libsctputil.a
| make[4]: Nothing to be done for 'all'.
| RANLIB libsctputil.a
| make[4]: Nothing to be done for 'all'.
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[5]: Nothing to be done for 'all'.
| make[5]: Nothing to be done for 'all'.
| CC utils/sctp/func_tests/test_basic_v6.o
| cve-2017-2618.c: In function 'do_test':
| cve-2017-2618.c:35:25: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    35 |                         write(fd, "\n", 1);
|       |                         ^~~~~~~~~~~~~~~~~~
| In file included from cve-2017-16939.c:29:
| ../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from icmp_rate_limit01.c:30:
| ../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/cve/cve-2017-2618
| CC testcases/cve/cve-2025-38236
| CC testcases/cve/cve-2022-4378
| CC testcases/cve/cve-2025-21756
| CC utils/sctp/func_tests/test_fragments_v6.o
| CC testcases/cve/cve-2016-10044
| CC testcases/cve/cve-2017-16939
| CC utils/sctp/func_tests/test_getname_v6.o
| CC utils/sctp/func_tests/test_inaddr_any_v6.o
| CC testcases/cve/cve-2016-7042
| CC utils/sctp/func_tests/test_peeloff_v6.o
| CC testcases/cve/cve-2017-17052
| CC utils/sctp/func_tests/test_sctp_sendrecvmsg_v6.o
| CC testcases/cve/cve-2017-17053
| CC utils/sctp/func_tests/test_sockopt_v6.o
| CC testcases/cve/icmp_rate_limit01
| CC utils/sctp/func_tests/test_tcp_style_v6.o
| CC testcases/cve/cve-2015-3290
| CC utils/sctp/func_tests/test_timetolive_v6.o
| In file included from tcindex01.c:24:
| ../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/cve/cve-2017-2671
| CC testcases/cve/cve-2014-0196
| CC testcases/cve/cve-2016-7117
| CC testcases/cve/tcindex01
| CC testcases/cve/stack_clash
| CC testcases/cve/meltdown
| CC utils/sctp/func_tests/test_1_to_1_accept_close
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| CC utils/sctp/func_tests/test_1_to_1_addrs
| CC utils/sctp/func_tests/test_1_to_1_connectx
| CC utils/sctp/func_tests/test_1_to_1_connect
| CC utils/sctp/func_tests/test_1_to_1_events
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC utils/sctp/func_tests/test_1_to_1_initmsg_connect
| CC utils/sctp/func_tests/test_1_to_1_rtoinfo
| CC utils/sctp/func_tests/test_1_to_1_nonblock
| CC utils/sctp/func_tests/test_1_to_1_recvmsg
| CC utils/sctp/func_tests/test_1_to_1_recvfrom
| CC utils/sctp/func_tests/test_1_to_1_send
| CC utils/sctp/func_tests/test_1_to_1_sendto
| CC utils/sctp/func_tests/test_1_to_1_sendmsg
| CC utils/sctp/func_tests/test_1_to_1_socket_bind_listen
| CC utils/sctp/func_tests/test_1_to_1_shutdown
| CC utils/sctp/func_tests/test_1_to_1_threads
| CC utils/sctp/func_tests/test_autoclose
| CC utils/sctp/func_tests/test_assoc_abort
| CC utils/sctp/func_tests/test_assoc_shutdown
| CC testcases/kernel/syscalls/abort/abort01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC utils/sctp/func_tests/test_1_to_1_sockopt
| CC utils/sctp/func_tests/test_connect
| GEN ltp-version.h
| CC utils/sctp/func_tests/test_fragments
| CC utils/sctp/func_tests/test_connectx
| LD utils/sctp/func_tests/test_basic_v6
| CC utils/sctp/func_tests/test_basic
| LD utils/sctp/func_tests/test_fragments_v6
| LD utils/sctp/func_tests/test_getname_v6
| LD utils/sctp/func_tests/test_inaddr_any_v6
| CC utils/sctp/func_tests/test_inaddr_any
| LD utils/sctp/func_tests/test_sctp_sendrecvmsg_v6
| CC utils/sctp/func_tests/test_getname
| LD utils/sctp/func_tests/test_peeloff_v6
| LD utils/sctp/func_tests/test_sockopt_v6
| make[6]: Nothing to be done for 'all'.
| LD utils/sctp/func_tests/test_tcp_style_v6
| LD utils/sctp/func_tests/test_timetolive_v6
| make[6]: Nothing to be done for 'all'.
| CC utils/sctp/func_tests/test_recvmsg
| CC utils/sctp/func_tests/test_peeloff
| CC utils/sctp/func_tests/test_sctp_sendrecvmsg
| CC utils/sctp/func_tests/test_timetolive
| CC utils/sctp/func_tests/test_tcp_style
| CC testcases/kernel/syscalls/accept/accept03
| CC testcases/kernel/syscalls/accept/accept01
| CC testcases/kernel/syscalls/accept/accept02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| CC utils/sctp/func_tests/test_sockopt
| rm test_fragments_v6.o test_getname_v6.o test_basic_v6.o test_peeloff_v6.o test_tcp_style_v6.o test_inaddr_any_v6.o test_sockopt_v6.o test_sctp_sendrecvmsg_v6.o test_timetolive_v6.o
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/utils'
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/accept4/accept4_01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/access/access03
| CC testcases/kernel/syscalls/access/access04
| CC testcases/kernel/syscalls/access/access02
| CC testcases/kernel/syscalls/access/access01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/acct/acct02_helper
| CC testcases/kernel/syscalls/acct/acct01
| CC testcases/kernel/syscalls/acct/acct02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/add_key/add_key02
| CC testcases/kernel/syscalls/add_key/add_key01
| CC testcases/kernel/syscalls/add_key/add_key03
| CC testcases/kernel/syscalls/add_key/add_key04
| CC testcases/kernel/syscalls/add_key/add_key05
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/adjtimex/adjtimex01
| CC testcases/kernel/syscalls/adjtimex/adjtimex03
| CC testcases/kernel/syscalls/adjtimex/adjtimex02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/alarm/alarm03
| CC testcases/kernel/syscalls/alarm/alarm07
| CC testcases/kernel/syscalls/alarm/alarm05
| CC testcases/kernel/syscalls/alarm/alarm06
| CC testcases/kernel/syscalls/alarm/alarm02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/arch_prctl/arch_prctl01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/bind/bind02
| CC testcases/kernel/syscalls/bind/bind03
| CC testcases/kernel/syscalls/bind/bind01
| CC testcases/kernel/syscalls/bind/bind04
| CC testcases/kernel/syscalls/bind/bind05
| CC testcases/kernel/syscalls/bind/bind06
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/bpf/bpf_common.o
| CC testcases/kernel/syscalls/bpf/bpf_prog01
| CC testcases/kernel/syscalls/bpf/bpf_prog04
| CC testcases/kernel/syscalls/bpf/bpf_prog06
| CC testcases/kernel/syscalls/bpf/bpf_prog02
| CC testcases/kernel/syscalls/bpf/bpf_prog07
| CC testcases/kernel/syscalls/bpf/bpf_map01
| CC testcases/kernel/syscalls/bpf/bpf_prog03
| CC testcases/kernel/syscalls/bpf/bpf_prog05
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/brk/brk02
| CC testcases/kernel/syscalls/brk/brk01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/cacheflush/cacheflush01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/cachestat/cachestat03
| CC testcases/kernel/syscalls/cachestat/cachestat04
| CC testcases/kernel/syscalls/cachestat/cachestat02
| CC testcases/kernel/syscalls/cachestat/cachestat01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/capget/capget01
| CC testcases/kernel/syscalls/capget/capget02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/capset/capset01
| CC testcases/kernel/syscalls/capset/capset03
| CC testcases/kernel/syscalls/capset/capset04
| CC testcases/kernel/syscalls/capset/capset02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/chdir/chdir04
| CC testcases/kernel/syscalls/chdir/chdir02
| CC testcases/kernel/syscalls/chdir/chdir01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/chmod/chmod07
| CC testcases/kernel/syscalls/chmod/chmod03
| CC testcases/kernel/syscalls/chmod/chmod08
| CC testcases/kernel/syscalls/chmod/chmod09
| CC testcases/kernel/syscalls/chmod/chmod01
| CC testcases/kernel/syscalls/chmod/chmod05
| CC testcases/kernel/syscalls/chmod/chmod06
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/chown/chown01_16.o
| CC testcases/kernel/syscalls/chown/chown02_16.o
| CC testcases/kernel/syscalls/chown/chown03_16.o
| CC testcases/kernel/syscalls/chown/chown04_16.o
| CC testcases/kernel/syscalls/chown/chown05_16.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/chown/chown01_16
| LD testcases/kernel/syscalls/chown/chown05_16
| LD testcases/kernel/syscalls/chown/chown04_16
| LD testcases/kernel/syscalls/chown/chown02_16
| LD testcases/kernel/syscalls/chown/chown03_16
| CC testcases/kernel/syscalls/chown/chown01
| CC testcases/kernel/syscalls/chown/chown05
| CC testcases/kernel/syscalls/chown/chown04
| CC testcases/kernel/syscalls/chown/chown02
| CC testcases/kernel/syscalls/chown/chown03
| rm chown04_16.o chown02_16.o chown01_16.o chown03_16.o chown05_16.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/chroot/chroot01
| CC testcases/kernel/syscalls/chroot/chroot04
| CC testcases/kernel/syscalls/chroot/chroot02
| CC testcases/kernel/syscalls/chroot/chroot03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/metadata'
| CC testcases/kernel/syscalls/clock_adjtime/clock_adjtime02
| CC testcases/kernel/syscalls/clock_adjtime/clock_adjtime01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/clock_getres/clock_getres01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libvdso.a
| GEN ltp-version.h
| make[5]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| In file included from clock_gettime03.c:19:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime02
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime01
| CC testcases/kernel/syscalls/clock_gettime/leapsec01
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime04
| CC testcases/kernel/syscalls/clock_gettime/clock_gettime03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| In file included from clock_nanosleep03.c:19:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep02
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01
| CC testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/clock_settime/clock_settime02
| CC testcases/kernel/syscalls/clock_settime/clock_settime03
| CC testcases/kernel/syscalls/clock_settime/clock_settime04
| CC testcases/kernel/syscalls/clock_settime/clock_settime01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| clone04.c:26:34: warning: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (11 chars into 10 available) [-Wunterminated-string-initialization]
|    26 |         {child_fn, NULL, EINVAL, "NULL stack"},
|       |                                  ^~~~~~~~~~~~
| clone02.c: In function 'sig_child_defined_handler':
| clone02.c:452:43: warning: unused parameter 'pid' [-Wunused-parameter]
|   452 | static void sig_child_defined_handler(int pid)
|       |                                       ~~~~^~~
| In file included from clone09.c:13:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from clone11.c:16:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/clone/clone01
| CC testcases/kernel/syscalls/clone/clone04
| CC testcases/kernel/syscalls/clone/clone06
| CC testcases/kernel/syscalls/clone/clone07
| CC testcases/kernel/syscalls/clone/clone03
| CC testcases/kernel/syscalls/clone/clone05
| CC testcases/kernel/syscalls/clone/clone09
| CC testcases/kernel/syscalls/clone/clone11
| CC testcases/kernel/syscalls/clone/clone10
| CC testcases/kernel/syscalls/clone/clone02
| CC testcases/kernel/syscalls/clone/clone08
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| In file included from clone304.c:15:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from clone301.c:16:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from clone302.c:16:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| In file included from clone303.c:17:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/clone3/clone303
| CC testcases/kernel/syscalls/clone3/clone302
| CC testcases/kernel/syscalls/clone3/clone304
| CC testcases/kernel/syscalls/clone3/clone301
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/close/close01
| CC testcases/kernel/syscalls/close/close02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| In file included from close_range01.c:29:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from close_range02.c:19:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/close_range/close_range02
| CC testcases/kernel/syscalls/close_range/close_range01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/cma/process_vm_readv02
| CC testcases/kernel/syscalls/cma/process_vm_writev02
| CC testcases/kernel/syscalls/cma/process_vm01
| CC testcases/kernel/syscalls/cma/process_vm_readv03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/confstr/confstr01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/connect/connect02
| CC testcases/kernel/syscalls/connect/connect01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/copy_file_range/copy_file_range03
| CC testcases/kernel/syscalls/copy_file_range/copy_file_range02
| CC testcases/kernel/syscalls/copy_file_range/copy_file_range01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/creat/creat07_child
| CC testcases/kernel/syscalls/creat/creat07
| CC testcases/kernel/syscalls/creat/creat04
| CC testcases/kernel/syscalls/creat/creat03
| CC testcases/kernel/syscalls/creat/creat01
| CC testcases/kernel/syscalls/creat/creat05
| CC testcases/kernel/syscalls/creat/creat06
| CC testcases/kernel/syscalls/creat/creat09
| CC testcases/kernel/syscalls/creat/creat08
| skip: 1, FORCE_MODULES:
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/delete_module/delete_module01
| CC testcases/kernel/syscalls/delete_module/delete_module03
| CC testcases/kernel/syscalls/delete_module/delete_module02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/dup/dup02
| CC testcases/kernel/syscalls/dup/dup05
| CC testcases/kernel/syscalls/dup/dup07
| CC testcases/kernel/syscalls/dup/dup01
| CC testcases/kernel/syscalls/dup/dup03
| CC testcases/kernel/syscalls/dup/dup04
| CC testcases/kernel/syscalls/dup/dup06
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/dup2/dup206
| CC testcases/kernel/syscalls/dup2/dup201
| CC testcases/kernel/syscalls/dup2/dup204
| CC testcases/kernel/syscalls/dup2/dup207
| CC testcases/kernel/syscalls/dup2/dup202
| CC testcases/kernel/syscalls/dup2/dup203
| CC testcases/kernel/syscalls/dup2/dup205
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/dup3/dup3_02
| CC testcases/kernel/syscalls/dup3/dup3_01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/epoll/epoll-ltp
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/epoll_create/epoll_create01
| CC testcases/kernel/syscalls/epoll_create/epoll_create02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/epoll_create1/epoll_create1_01
| CC testcases/kernel/syscalls/epoll_create1/epoll_create1_02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl02
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl03
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl04
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl05
| CC testcases/kernel/syscalls/epoll_ctl/epoll_ctl01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait02
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait06
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait05
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait03
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait04
| CC testcases/kernel/syscalls/epoll_pwait/epoll_pwait01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait03
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait07
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait02
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait05
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait04
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait06
| CC testcases/kernel/syscalls/epoll_wait/epoll_wait01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/eventfd/eventfd05
| CC testcases/kernel/syscalls/eventfd/eventfd01
| CC testcases/kernel/syscalls/eventfd/eventfd04
| CC testcases/kernel/syscalls/eventfd/eventfd02
| CC testcases/kernel/syscalls/eventfd/eventfd03
| CC testcases/kernel/syscalls/eventfd/eventfd06
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/eventfd2/eventfd2_02
| CC testcases/kernel/syscalls/eventfd2/eventfd2_01
| CC testcases/kernel/syscalls/eventfd2/eventfd2_03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/execl/execl01_child
| CC testcases/kernel/syscalls/execl/execl01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/execle/execle01_child
| CC testcases/kernel/syscalls/execle/execle01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/execlp/execlp01_child
| CC testcases/kernel/syscalls/execlp/execlp01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/execv/execv01_child
| CC testcases/kernel/syscalls/execv/execv01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| execve03.c: In function 'setup':
| execve03.c:75:32: warning: '/fake' directive writing 5 bytes into a region of size between 1 and 1024 [-Wformat-overflow=]
|    75 |         sprintf(test_name3, "%s/fake", test_name5);
|       |                                ^~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/stdio.h:974,
|                  from execve03.c:28:
| In function 'sprintf',
|     inlined from 'setup' at execve03.c:75:2:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/stdio2.h:30:10: note: '__builtin___sprintf_chk' output between 6 and 1029 bytes into a destination of size 1024
|    30 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    31 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    32 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/execve/execve06_child
| CC testcases/kernel/syscalls/execve/execve_child
| CC testcases/kernel/syscalls/execve/execve01_child
| CC testcases/kernel/syscalls/execve/execve01
| CC testcases/kernel/syscalls/execve/execve06
| CC testcases/kernel/syscalls/execve/execve02
| CC testcases/kernel/syscalls/execve/execve04
| CC testcases/kernel/syscalls/execve/execve05
| CC testcases/kernel/syscalls/execve/execve03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| In file included from execveat01.c:28:
| execveat.h: In function 'check_execveat':
| execveat.h:11:15: warning: argument 3 null where non-null expected [-Wnonnull]
|    11 |         ret = execveat(-1, "", NULL, NULL, AT_EMPTY_PATH);
|       |               ^~~~~~~~
| In file included from ../../../../include/tst_test.h:14,
|                  from execveat01.c:25:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/unistd.h:300:12: note: in a call to function 'execveat' declared 'nonnull'
|   300 | extern int execveat (int __fd, const char *__path, char *const __argv[],
|       |            ^~~~~~~~
| In file included from execveat02.c:26:
| execveat.h: In function 'check_execveat':
| execveat.h:11:15: warning: argument 3 null where non-null expected [-Wnonnull]
|    11 |         ret = execveat(-1, "", NULL, NULL, AT_EMPTY_PATH);
|       |               ^~~~~~~~
| In file included from ../../../../include/tst_test.h:14,
|                  from execveat02.c:23:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/unistd.h:300:12: note: in a call to function 'execveat' declared 'nonnull'
|   300 | extern int execveat (int __fd, const char *__path, char *const __argv[],
|       |            ^~~~~~~~
| In file included from execveat03.c:35:
| execveat.h: In function 'check_execveat':
| execveat.h:11:15: warning: argument 3 null where non-null expected [-Wnonnull]
|    11 |         ret = execveat(-1, "", NULL, NULL, AT_EMPTY_PATH);
|       |               ^~~~~~~~
| In file included from ../../../../include/tst_test.h:14,
|                  from execveat03.c:32:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/unistd.h:300:12: note: in a call to function 'execveat' declared 'nonnull'
|   300 | extern int execveat (int __fd, const char *__path, char *const __argv[],
|       |            ^~~~~~~~
| execveat01.c: In function 'setup':
| execveat01.c:72:35: warning: '%s' directive writing 22 bytes into a region of size between 0 and 511 [-Wformat-overflow=]
|    72 |         sprintf(app_abs_path, "%s/%s", cur_dir_path, TEST_REL_APP);
|       |                                   ^~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/stdio.h:974,
|                  from execveat01.c:22:
| In function 'sprintf',
|     inlined from 'setup' at execveat01.c:72:2:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/stdio2.h:30:10: note: '__builtin___sprintf_chk' output between 24 and 535 bytes into a destination of size 512
|    30 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    31 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    32 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| execveat02.c: In function 'setup':
| execveat02.c:80:35: warning: '%s' directive writing 22 bytes into a region of size between 0 and 511 [-Wformat-overflow=]
|    80 |         sprintf(app_abs_path, "%s/%s", cur_dir_path, TEST_REL_APP);
|       |                                   ^~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/stdio.h:974,
|                  from execveat02.c:20:
| In function 'sprintf',
|     inlined from 'setup' at execveat02.c:80:2:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/stdio2.h:30:10: note: '__builtin___sprintf_chk' output between 24 and 535 bytes into a destination of size 512
|    30 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    31 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    32 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| execveat02.c: In function 'setup':
| execveat02.c:81:35: warning: '%s' directive writing 24 bytes into a region of size between 0 and 511 [-Wformat-overflow=]
|    81 |         sprintf(app_sym_path, "%s/%s", cur_dir_path, TEST_ERL_SYMLINK);
|       |                                   ^~
| In function 'sprintf',
|     inlined from 'setup' at execveat02.c:81:2:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/stdio2.h:30:10: note: '__builtin___sprintf_chk' output between 26 and 537 bytes into a destination of size 512
|    30 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    31 |                                   __glibc_objsize (__s), __fmt,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    32 |                                   __va_arg_pack ());
|       |                                   ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/execveat/execveat_child
| CC testcases/kernel/syscalls/execveat/execveat_errno
| CC testcases/kernel/syscalls/execveat/execveat03
| CC testcases/kernel/syscalls/execveat/execveat01
| CC testcases/kernel/syscalls/execveat/execveat02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/execvp/execvp01_child
| CC testcases/kernel/syscalls/execvp/execvp01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/exit/exit01
| CC testcases/kernel/syscalls/exit/exit02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/exit_group/exit_group01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/faccessat/faccessat01
| CC testcases/kernel/syscalls/faccessat/faccessat02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/faccessat2/faccessat201
| CC testcases/kernel/syscalls/faccessat2/faccessat202
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/fadvise/posix_fadvise01_64.o
| CC testcases/kernel/syscalls/fadvise/posix_fadvise02_64.o
| CC testcases/kernel/syscalls/fadvise/posix_fadvise03_64.o
| CC testcases/kernel/syscalls/fadvise/posix_fadvise04_64.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/fadvise/posix_fadvise01_64
| LD testcases/kernel/syscalls/fadvise/posix_fadvise02_64
| LD testcases/kernel/syscalls/fadvise/posix_fadvise04_64
| LD testcases/kernel/syscalls/fadvise/posix_fadvise03_64
| CC testcases/kernel/syscalls/fadvise/posix_fadvise01
| CC testcases/kernel/syscalls/fadvise/posix_fadvise04
| CC testcases/kernel/syscalls/fadvise/posix_fadvise02
| CC testcases/kernel/syscalls/fadvise/posix_fadvise03
| rm posix_fadvise03_64.o posix_fadvise02_64.o posix_fadvise04_64.o posix_fadvise01_64.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fallocate/fallocate02
| CC testcases/kernel/syscalls/fallocate/fallocate03
| CC testcases/kernel/syscalls/fallocate/fallocate01
| CC testcases/kernel/syscalls/fallocate/fallocate05
| CC testcases/kernel/syscalls/fallocate/fallocate06
| CC testcases/kernel/syscalls/fallocate/fallocate04
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fanotify/fanotify08
| CC testcases/kernel/syscalls/fanotify/fanotify02
| CC testcases/kernel/syscalls/fanotify/fanotify11
| CC testcases/kernel/syscalls/fanotify/fanotify07
| CC testcases/kernel/syscalls/fanotify/fanotify04
| CC testcases/kernel/syscalls/fanotify/fanotify12
| CC testcases/kernel/syscalls/fanotify/fanotify06
| CC testcases/kernel/syscalls/fanotify/fanotify05
| CC testcases/kernel/syscalls/fanotify/fanotify14
| CC testcases/kernel/syscalls/fanotify/fanotify03
| CC testcases/kernel/syscalls/fanotify/fanotify15
| CC testcases/kernel/syscalls/fanotify/fanotify13
| CC testcases/kernel/syscalls/fanotify/fanotify09
| CC testcases/kernel/syscalls/fanotify/fanotify_child
| CC testcases/kernel/syscalls/fanotify/fanotify01
| In file included from fanotify17.c:25:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/fanotify/fanotify10
| CC testcases/kernel/syscalls/fanotify/fanotify16
| CC testcases/kernel/syscalls/fanotify/fanotify17
| CC testcases/kernel/syscalls/fanotify/fanotify18
| CC testcases/kernel/syscalls/fanotify/fanotify20
| CC testcases/kernel/syscalls/fanotify/fanotify19
| CC testcases/kernel/syscalls/fanotify/fanotify25
| CC testcases/kernel/syscalls/fanotify/fanotify23
| CC testcases/kernel/syscalls/fanotify/fanotify21
| CC testcases/kernel/syscalls/fanotify/fanotify22
| CC testcases/kernel/syscalls/fanotify/fanotify24
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fchdir/fchdir03
| CC testcases/kernel/syscalls/fchdir/fchdir01
| CC testcases/kernel/syscalls/fchdir/fchdir02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fchmod/fchmod03
| CC testcases/kernel/syscalls/fchmod/fchmod04
| CC testcases/kernel/syscalls/fchmod/fchmod02
| CC testcases/kernel/syscalls/fchmod/fchmod01
| CC testcases/kernel/syscalls/fchmod/fchmod05
| CC testcases/kernel/syscalls/fchmod/fchmod06
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fchmodat/fchmodat02
| CC testcases/kernel/syscalls/fchmodat/fchmodat01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fchmodat2/fchmodat2_02
| CC testcases/kernel/syscalls/fchmodat2/fchmodat2_01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/fchown/fchown01_16.o
| CC testcases/kernel/syscalls/fchown/fchown02_16.o
| CC testcases/kernel/syscalls/fchown/fchown03_16.o
| CC testcases/kernel/syscalls/fchown/fchown04_16.o
| CC testcases/kernel/syscalls/fchown/fchown05_16.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/fchown/fchown01_16
| LD testcases/kernel/syscalls/fchown/fchown04_16
| LD testcases/kernel/syscalls/fchown/fchown05_16
| LD testcases/kernel/syscalls/fchown/fchown02_16
| LD testcases/kernel/syscalls/fchown/fchown03_16
| CC testcases/kernel/syscalls/fchown/fchown01
| CC testcases/kernel/syscalls/fchown/fchown04
| CC testcases/kernel/syscalls/fchown/fchown05
| CC testcases/kernel/syscalls/fchown/fchown02
| CC testcases/kernel/syscalls/fchown/fchown03
| rm fchown04_16.o fchown02_16.o fchown03_16.o fchown05_16.o fchown01_16.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fchownat/fchownat03
| CC testcases/kernel/syscalls/fchownat/fchownat02
| CC testcases/kernel/syscalls/fchownat/fchownat01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/fcntl/fcntl01_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl02_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl03_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl04_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl05_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl07_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl08_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl09_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl10_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl11_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl12_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl13_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl14_64.o
| GEN ltp-version.h
| CC testcases/kernel/syscalls/fcntl/fcntl15_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl16_64.o
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fcntl/fcntl17_64.o
| fcntl16.c: In function 'catch_alarm':
| fcntl16.c:338:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   338 | void catch_alarm(int sig)
|       |                  ~~~~^~~
| fcntl16.c: In function 'catch_usr1':
| fcntl16.c:343:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   343 | void catch_usr1(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_usr2':
| fcntl16.c:352:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   352 | void catch_usr2(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_int':
| fcntl16.c:361:20: warning: unused parameter 'sig' [-Wunused-parameter]
|   361 | void catch_int(int sig)
|       |                ~~~~^~~
| fcntl16.c: In function 'run_test':
| fcntl16.c:445:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   445 |                 (void)write(fd, FILEDATA, 10);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl18_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl19_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl20_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl21_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl22_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl23_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl24_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl25_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl26_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl27_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl29_64.o
| fcntl17.c: In function 'catch_alarm':
| fcntl17.c:414:9: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   414 |         sighold(SIGCHLD);
|       |         ^~~~~~~
| In file included from fcntl17.c:50:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl30_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl31_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl32_64.o
| fcntl21.c: In function 'setup':
| fcntl21.c:93:9: warning: ignoring return value of 'pipe' declared with attribute 'warn_unused_result' [-Wunused-result]
|    93 |         pipe(parent_pipe);
|       |         ^~~~~~~~~~~~~~~~~
| fcntl21.c:94:9: warning: ignoring return value of 'pipe' declared with attribute 'warn_unused_result' [-Wunused-result]
|    94 |         pipe(child_pipe);
|       |         ^~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl33_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl34_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl35_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl36_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl37_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl38_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl39_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl40_64.o
| CC testcases/kernel/syscalls/fcntl/fcntl01
| CC testcases/kernel/syscalls/fcntl/fcntl02
| CC testcases/kernel/syscalls/fcntl/fcntl03
| CC testcases/kernel/syscalls/fcntl/fcntl04
| fcntl16.c: In function 'catch_alarm':
| fcntl16.c:338:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   338 | void catch_alarm(int sig)
|       |                  ~~~~^~~
| fcntl16.c: In function 'catch_usr1':
| fcntl16.c:343:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   343 | void catch_usr1(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_usr2':
| fcntl16.c:352:21: warning: unused parameter 'sig' [-Wunused-parameter]
|   352 | void catch_usr2(int sig)
|       |                 ~~~~^~~
| fcntl16.c: In function 'catch_int':
| fcntl16.c:361:20: warning: unused parameter 'sig' [-Wunused-parameter]
|   361 | void catch_int(int sig)
|       |                ~~~~^~~
| fcntl16.c: In function 'run_test':
| fcntl16.c:445:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   445 |                 (void)write(fd, FILEDATA, 10);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl05
| fcntl17.c: In function 'catch_alarm':
| fcntl17.c:414:9: warning: 'sighold' is deprecated: Use the sigprocmask function instead [-Wdeprecated-declarations]
|   414 |         sighold(SIGCHLD);
|       |         ^~~~~~~
| In file included from fcntl17.c:50:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:355:12: note: declared here
|   355 | extern int sighold (int __sig) __THROW
|       |            ^~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl07
| CC testcases/kernel/syscalls/fcntl/fcntl08
| CC testcases/kernel/syscalls/fcntl/fcntl09
| CC testcases/kernel/syscalls/fcntl/fcntl10
| CC testcases/kernel/syscalls/fcntl/fcntl12
| CC testcases/kernel/syscalls/fcntl/fcntl13
| fcntl21.c: In function 'setup':
| fcntl21.c:93:9: warning: ignoring return value of 'pipe' declared with attribute 'warn_unused_result' [-Wunused-result]
|    93 |         pipe(parent_pipe);
|       |         ^~~~~~~~~~~~~~~~~
| fcntl21.c:94:9: warning: ignoring return value of 'pipe' declared with attribute 'warn_unused_result' [-Wunused-result]
|    94 |         pipe(child_pipe);
|       |         ^~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/fcntl/fcntl15
| CC testcases/kernel/syscalls/fcntl/fcntl18
| CC testcases/kernel/syscalls/fcntl/fcntl14
| CC testcases/kernel/syscalls/fcntl/fcntl16
| CC testcases/kernel/syscalls/fcntl/fcntl17
| CC testcases/kernel/syscalls/fcntl/fcntl22
| CC testcases/kernel/syscalls/fcntl/fcntl11
| CC testcases/kernel/syscalls/fcntl/fcntl23
| CC testcases/kernel/syscalls/fcntl/fcntl24
| CC testcases/kernel/syscalls/fcntl/fcntl25
| CC testcases/kernel/syscalls/fcntl/fcntl26
| CC testcases/kernel/syscalls/fcntl/fcntl19
| CC testcases/kernel/syscalls/fcntl/fcntl27
| CC testcases/kernel/syscalls/fcntl/fcntl29
| CC testcases/kernel/syscalls/fcntl/fcntl20
| LD testcases/kernel/syscalls/fcntl/fcntl01_64
| LD testcases/kernel/syscalls/fcntl/fcntl02_64
| CC testcases/kernel/syscalls/fcntl/fcntl21
| CC testcases/kernel/syscalls/fcntl/fcntl30
| LD testcases/kernel/syscalls/fcntl/fcntl03_64
| LD testcases/kernel/syscalls/fcntl/fcntl04_64
| CC testcases/kernel/syscalls/fcntl/fcntl32
| LD testcases/kernel/syscalls/fcntl/fcntl05_64
| LD testcases/kernel/syscalls/fcntl/fcntl08_64
| LD testcases/kernel/syscalls/fcntl/fcntl07_64
| LD testcases/kernel/syscalls/fcntl/fcntl09_64
| LD testcases/kernel/syscalls/fcntl/fcntl10_64
| CC testcases/kernel/syscalls/fcntl/fcntl31
| LD testcases/kernel/syscalls/fcntl/fcntl11_64
| LD testcases/kernel/syscalls/fcntl/fcntl12_64
| CC testcases/kernel/syscalls/fcntl/fcntl33
| CC testcases/kernel/syscalls/fcntl/fcntl35
| LD testcases/kernel/syscalls/fcntl/fcntl13_64
| LD testcases/kernel/syscalls/fcntl/fcntl14_64
| LD testcases/kernel/syscalls/fcntl/fcntl15_64
| LD testcases/kernel/syscalls/fcntl/fcntl16_64
| LD testcases/kernel/syscalls/fcntl/fcntl17_64
| LD testcases/kernel/syscalls/fcntl/fcntl18_64
| CC testcases/kernel/syscalls/fcntl/fcntl37
| CC testcases/kernel/syscalls/fcntl/fcntl40
| CC testcases/kernel/syscalls/fcntl/fcntl38
| LD testcases/kernel/syscalls/fcntl/fcntl19_64
| CC testcases/kernel/syscalls/fcntl/fcntl39
| LD testcases/kernel/syscalls/fcntl/fcntl20_64
| CC testcases/kernel/syscalls/fcntl/fcntl34
| LD testcases/kernel/syscalls/fcntl/fcntl21_64
| LD testcases/kernel/syscalls/fcntl/fcntl22_64
| LD testcases/kernel/syscalls/fcntl/fcntl23_64
| LD testcases/kernel/syscalls/fcntl/fcntl24_64
| LD testcases/kernel/syscalls/fcntl/fcntl25_64
| LD testcases/kernel/syscalls/fcntl/fcntl26_64
| LD testcases/kernel/syscalls/fcntl/fcntl27_64
| LD testcases/kernel/syscalls/fcntl/fcntl29_64
| LD testcases/kernel/syscalls/fcntl/fcntl30_64
| LD testcases/kernel/syscalls/fcntl/fcntl31_64
| LD testcases/kernel/syscalls/fcntl/fcntl32_64
| LD testcases/kernel/syscalls/fcntl/fcntl33_64
| LD testcases/kernel/syscalls/fcntl/fcntl35_64
| LD testcases/kernel/syscalls/fcntl/fcntl34_64
| LD testcases/kernel/syscalls/fcntl/fcntl36_64
| LD testcases/kernel/syscalls/fcntl/fcntl37_64
| LD testcases/kernel/syscalls/fcntl/fcntl38_64
| LD testcases/kernel/syscalls/fcntl/fcntl39_64
| LD testcases/kernel/syscalls/fcntl/fcntl40_64
| CC testcases/kernel/syscalls/fcntl/fcntl36
| rm fcntl35_64.o fcntl08_64.o fcntl40_64.o fcntl03_64.o fcntl23_64.o fcntl29_64.o fcntl25_64.o fcntl30_64.o fcntl34_64.o fcntl37_64.o fcntl19_64.o fcntl14_64.o fcntl20_64.o fcntl21_64.o fcntl31_64.o fcntl15_64.o fcntl07_64.o fcntl12_64.o fcntl26_64.o fcntl10_64.o fcntl22_64.o fcntl13_64.o fcntl02_64.o fcntl11_64.o fcntl17_64.o fcntl38_64.o fcntl24_64.o fcntl16_64.o fcntl04_64.o fcntl18_64.o fcntl09_64.o fcntl33_64.o fcntl32_64.o fcntl05_64.o fcntl27_64.o fcntl39_64.o fcntl36_64.o fcntl01_64.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fdatasync/fdatasync01
| CC testcases/kernel/syscalls/fdatasync/fdatasync02
| CC testcases/kernel/syscalls/fdatasync/fdatasync03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fgetxattr/fgetxattr03
| CC testcases/kernel/syscalls/fgetxattr/fgetxattr01
| CC testcases/kernel/syscalls/fgetxattr/fgetxattr02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/file_attr/file_attr05
| CC testcases/kernel/syscalls/file_attr/file_attr03
| CC testcases/kernel/syscalls/file_attr/file_attr04
| CC testcases/kernel/syscalls/file_attr/file_attr01
| CC testcases/kernel/syscalls/file_attr/file_attr02
| skip: 1, FORCE_MODULES:
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/finit_module/finit_module01
| CC testcases/kernel/syscalls/finit_module/finit_module02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/flistxattr/flistxattr03
| CC testcases/kernel/syscalls/flistxattr/flistxattr02
| CC testcases/kernel/syscalls/flistxattr/flistxattr01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/flock/flock01
| CC testcases/kernel/syscalls/flock/flock06
| CC testcases/kernel/syscalls/flock/flock02
| CC testcases/kernel/syscalls/flock/flock04
| CC testcases/kernel/syscalls/flock/flock03
| CC testcases/kernel/syscalls/flock/flock07
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| fmtmsg01.c: In function 'main':
| fmtmsg01.c:103:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   103 |         fread(buf, sizeof(buf[0]), strlen(str1), fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:112:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   112 |         fread(&ch, sizeof(ch), 1, fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:114:17: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   114 |                 fread(&ch, sizeof(ch), 1, fp);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:118:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   118 |         fread(buf, sizeof(buf[0]), strlen(str2), fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:169:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   169 |         fread(buf, sizeof(buf[0]), strlen(str3), fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:178:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   178 |         fread(&ch, sizeof(ch), 1, fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:180:17: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   180 |                 fread(&ch, sizeof(ch), 1, fp);
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| fmtmsg01.c:184:9: warning: ignoring return value of 'fread' declared with attribute 'warn_unused_result' [-Wunused-result]
|   184 |         fread(buf, sizeof(buf[0]), strlen(str4), fp);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/fmtmsg/fmtmsg01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fork/fork05
| CC testcases/kernel/syscalls/fork/fork03
| CC testcases/kernel/syscalls/fork/fork_procs
| CC testcases/kernel/syscalls/fork/fork04
| CC testcases/kernel/syscalls/fork/fork07
| CC testcases/kernel/syscalls/fork/fork08
| CC testcases/kernel/syscalls/fork/fork13
| CC testcases/kernel/syscalls/fork/fork01
| CC testcases/kernel/syscalls/fork/fork10
| CC testcases/kernel/syscalls/fork/fork14
| CC testcases/kernel/syscalls/fork/fork09
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fpathconf/fpathconf01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fremovexattr/fremovexattr01
| CC testcases/kernel/syscalls/fremovexattr/fremovexattr02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fsconfig/fsconfig02
| CC testcases/kernel/syscalls/fsconfig/fsconfig03
| CC testcases/kernel/syscalls/fsconfig/fsconfig01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fsetxattr/fsetxattr01
| CC testcases/kernel/syscalls/fsetxattr/fsetxattr02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fsmount/fsmount02
| CC testcases/kernel/syscalls/fsmount/fsmount01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fsopen/fsopen02
| CC testcases/kernel/syscalls/fsopen/fsopen01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fspick/fspick02
| CC testcases/kernel/syscalls/fspick/fspick01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/fstat/fstat02_64.o
| CC testcases/kernel/syscalls/fstat/fstat03_64.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/fstat/fstat03_64
| LD testcases/kernel/syscalls/fstat/fstat02_64
| CC testcases/kernel/syscalls/fstat/fstat03
| CC testcases/kernel/syscalls/fstat/fstat02
| rm fstat02_64.o fstat03_64.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fstatat/fstatat01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/fstatfs/fstatfs01_64.o
| CC testcases/kernel/syscalls/fstatfs/fstatfs02_64.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/fstatfs/fstatfs01_64
| LD testcases/kernel/syscalls/fstatfs/fstatfs02_64
| CC testcases/kernel/syscalls/fstatfs/fstatfs01
| CC testcases/kernel/syscalls/fstatfs/fstatfs02
| rm fstatfs02_64.o fstatfs01_64.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/fsync/fsync01
| CC testcases/kernel/syscalls/fsync/fsync03
| CC testcases/kernel/syscalls/fsync/fsync04
| CC testcases/kernel/syscalls/fsync/fsync02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/ftruncate/ftruncate01_64.o
| CC testcases/kernel/syscalls/ftruncate/ftruncate03_64.o
| CC testcases/kernel/syscalls/ftruncate/ftruncate04_64.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/ftruncate/ftruncate03_64
| LD testcases/kernel/syscalls/ftruncate/ftruncate01_64
| LD testcases/kernel/syscalls/ftruncate/ftruncate04_64
| CC testcases/kernel/syscalls/ftruncate/ftruncate03
| CC testcases/kernel/syscalls/ftruncate/ftruncate04
| CC testcases/kernel/syscalls/ftruncate/ftruncate01
| rm ftruncate03_64.o ftruncate01_64.o ftruncate04_64.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/futex/futex_wait05
| CC testcases/kernel/syscalls/futex/futex_wake01
| CC testcases/kernel/syscalls/futex/futex_wait03
| CC testcases/kernel/syscalls/futex/futex_wait01
| CC testcases/kernel/syscalls/futex/futex_cmp_requeue02
| CC testcases/kernel/syscalls/futex/futex_wait04
| CC testcases/kernel/syscalls/futex/futex_wait02
| CC testcases/kernel/syscalls/futex/futex_wake03
| CC testcases/kernel/syscalls/futex/futex_waitv02
| CC testcases/kernel/syscalls/futex/futex_wake02
| CC testcases/kernel/syscalls/futex/futex_wake04
| CC testcases/kernel/syscalls/futex/futex_cmp_requeue01
| CC testcases/kernel/syscalls/futex/futex_waitv03
| CC testcases/kernel/syscalls/futex/futex_waitv01
| CC testcases/kernel/syscalls/futex/futex_wait_bitset01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/futimesat/futimesat01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnuma.a
| make[5]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/get_mempolicy/get_mempolicy01
| CC testcases/kernel/syscalls/get_mempolicy/get_mempolicy02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/get_robust_list/get_robust_list01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getcontext/getcontext01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| In file included from getcpu01.c:22:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from getcpu02.c:16:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/getcpu/getcpu02
| CC testcases/kernel/syscalls/getcpu/getcpu01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getcwd/getcwd04
| CC testcases/kernel/syscalls/getcwd/getcwd02
| CC testcases/kernel/syscalls/getcwd/getcwd01
| CC testcases/kernel/syscalls/getcwd/getcwd03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getdents/getdents02
| CC testcases/kernel/syscalls/getdents/getdents01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getdomainname/getdomainname01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/getegid/getegid01_16.o
| CC testcases/kernel/syscalls/getegid/getegid02_16.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/getegid/getegid01_16
| LD testcases/kernel/syscalls/getegid/getegid02_16
| CC testcases/kernel/syscalls/getegid/getegid01
| CC testcases/kernel/syscalls/getegid/getegid02
| rm getegid01_16.o getegid02_16.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/geteuid/geteuid01_16.o
| CC testcases/kernel/syscalls/geteuid/geteuid02_16.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/geteuid/geteuid01_16
| LD testcases/kernel/syscalls/geteuid/geteuid02_16
| CC testcases/kernel/syscalls/geteuid/geteuid01
| CC testcases/kernel/syscalls/geteuid/geteuid02
| rm geteuid01_16.o geteuid02_16.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/getgid/getgid01_16.o
| CC testcases/kernel/syscalls/getgid/getgid03_16.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/getgid/getgid01_16
| LD testcases/kernel/syscalls/getgid/getgid03_16
| CC testcases/kernel/syscalls/getgid/getgid01
| CC testcases/kernel/syscalls/getgid/getgid03
| rm getgid03_16.o getgid01_16.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/getgroups/getgroups01_16.o
| CC testcases/kernel/syscalls/getgroups/getgroups03_16.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/getgroups/getgroups01_16
| LD testcases/kernel/syscalls/getgroups/getgroups03_16
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/features.h:540,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/unistd.h:25,
|                  from getgroups01.c:48:
| In function 'getgroups',
|     inlined from 'GETGROUPS' at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/testcases/kernel/syscalls/getgroups/../utils/compat_16.h:82:2,
|     inlined from 'main' at getgroups01.c:88:3:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/unistd.h:153:10: warning: argument 1 value -1 is negative [-Wstringop-overflow=]
|   153 |   return __glibc_fortify (getgroups, __size, sizeof (__gid_t),
|       |          ^~~~~~~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/unistd.h:23,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/unistd.h:1217:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/unistd-decl.h: In function 'main':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/unistd-decl.h:133:12: note: in a call to function '__getgroups_chk' declared with attribute 'access (write_only, 2, 1)'
|   133 | extern int __getgroups_chk (int __size, __gid_t __list[], size_t __listlen)
|       |            ^~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/getgroups/getgroups01
| CC testcases/kernel/syscalls/getgroups/getgroups03
| rm getgroups01_16.o getgroups03_16.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/gethostbyname_r/gethostbyname_r01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/gethostid/gethostid01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/gethostname/gethostname01
| CC testcases/kernel/syscalls/gethostname/gethostname02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getitimer/getitimer02
| CC testcases/kernel/syscalls/getitimer/getitimer01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getpagesize/getpagesize01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getpeername/getpeername01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getpgid/getpgid02
| CC testcases/kernel/syscalls/getpgid/getpgid01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getpgrp/getpgrp01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getpid/getpid01
| CC testcases/kernel/syscalls/getpid/getpid02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getppid/getppid02
| CC testcases/kernel/syscalls/getppid/getppid01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getpriority/getpriority01
| CC testcases/kernel/syscalls/getpriority/getpriority02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getrandom/getrandom01
| CC testcases/kernel/syscalls/getrandom/getrandom03
| CC testcases/kernel/syscalls/getrandom/getrandom04
| CC testcases/kernel/syscalls/getrandom/getrandom05
| CC testcases/kernel/syscalls/getrandom/getrandom02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/getresgid/getresgid01_16.o
| CC testcases/kernel/syscalls/getresgid/getresgid02_16.o
| CC testcases/kernel/syscalls/getresgid/getresgid03_16.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/getresgid/getresgid01_16
| LD testcases/kernel/syscalls/getresgid/getresgid02_16
| LD testcases/kernel/syscalls/getresgid/getresgid03_16
| CC testcases/kernel/syscalls/getresgid/getresgid01
| CC testcases/kernel/syscalls/getresgid/getresgid02
| CC testcases/kernel/syscalls/getresgid/getresgid03
| rm getresgid03_16.o getresgid01_16.o getresgid02_16.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/getresuid/getresuid01_16.o
| CC testcases/kernel/syscalls/getresuid/getresuid02_16.o
| CC testcases/kernel/syscalls/getresuid/getresuid03_16.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/getresuid/getresuid01_16
| LD testcases/kernel/syscalls/getresuid/getresuid03_16
| LD testcases/kernel/syscalls/getresuid/getresuid02_16
| CC testcases/kernel/syscalls/getresuid/getresuid01
| CC testcases/kernel/syscalls/getresuid/getresuid02
| CC testcases/kernel/syscalls/getresuid/getresuid03
| rm getresuid02_16.o getresuid01_16.o getresuid03_16.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getrlimit/getrlimit01
| CC testcases/kernel/syscalls/getrlimit/getrlimit02
| CC testcases/kernel/syscalls/getrlimit/getrlimit03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getrusage/getrusage01
| CC testcases/kernel/syscalls/getrusage/getrusage04
| CC testcases/kernel/syscalls/getrusage/getrusage03_child
| CC testcases/kernel/syscalls/getrusage/getrusage02
| CC testcases/kernel/syscalls/getrusage/getrusage03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getsid/getsid02
| CC testcases/kernel/syscalls/getsid/getsid01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getsockname/getsockname01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/getsockopt/getsockopt01
| CC testcases/kernel/syscalls/getsockopt/getsockopt02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/gettid/gettid01
| CC testcases/kernel/syscalls/gettid/gettid02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/gettimeofday/gettimeofday01
| CC testcases/kernel/syscalls/gettimeofday/gettimeofday02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/getuid/getuid01_16.o
| CC testcases/kernel/syscalls/getuid/getuid03_16.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/getuid/getuid01_16
| LD testcases/kernel/syscalls/getuid/getuid03_16
| CC testcases/kernel/syscalls/getuid/getuid01
| CC testcases/kernel/syscalls/getuid/getuid03
| rm getuid03_16.o getuid01_16.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| In file included from getxattr05.c:35:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/getxattr/getxattr03
| CC testcases/kernel/syscalls/getxattr/getxattr04
| CC testcases/kernel/syscalls/getxattr/getxattr02
| CC testcases/kernel/syscalls/getxattr/getxattr01
| CC testcases/kernel/syscalls/getxattr/getxattr05
| skip: 1, FORCE_MODULES:
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/init_module/init_module01
| CC testcases/kernel/syscalls/init_module/init_module02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| inotify02.c: In function 'verify_inotify':
| inotify02.c:89:39: warning: '.rename1' directive output may be truncated writing 8 bytes into a region of size between 1 and 256 [-Wformat-truncation=]
|    89 |         snprintf(fname2, BUF_SIZE, "%s.rename1", fname1);
|       |                                       ^~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/stdio.h:974,
|                  from inotify02.c:13:
| In function 'snprintf',
|     inlined from 'verify_inotify' at inotify02.c:89:2:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 9 and 264 bytes into a destination of size 256
|    68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    69 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    70 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| inotify02.c: In function 'verify_inotify':
| inotify02.c:106:39: warning: '.rename2' directive output may be truncated writing 8 bytes into a region of size between 1 and 256 [-Wformat-truncation=]
|   106 |         snprintf(fname3, BUF_SIZE, "%s.rename2", fname1);
|       |                                       ^~~~~~~~
| In function 'snprintf',
|     inlined from 'verify_inotify' at inotify02.c:106:2:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 9 and 264 bytes into a destination of size 256
|    68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    69 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    70 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/inotify/inotify06
| CC testcases/kernel/syscalls/inotify/inotify11
| CC testcases/kernel/syscalls/inotify/inotify12
| CC testcases/kernel/syscalls/inotify/inotify01
| CC testcases/kernel/syscalls/inotify/inotify05
| CC testcases/kernel/syscalls/inotify/inotify04
| CC testcases/kernel/syscalls/inotify/inotify03
| CC testcases/kernel/syscalls/inotify/inotify02
| CC testcases/kernel/syscalls/inotify/inotify08
| CC testcases/kernel/syscalls/inotify/inotify07
| CC testcases/kernel/syscalls/inotify/inotify10
| CC testcases/kernel/syscalls/inotify/inotify09
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/inotify_init/inotify_init1_01
| CC testcases/kernel/syscalls/inotify_init/inotify_init1_02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/io_cancel/io_cancel02
| CC testcases/kernel/syscalls/io_cancel/io_cancel01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/io_destroy/io_destroy01
| CC testcases/kernel/syscalls/io_destroy/io_destroy02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/io_getevents/io_getevents02
| CC testcases/kernel/syscalls/io_getevents/io_getevents01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/io_pgetevents/io_pgetevents01
| CC testcases/kernel/syscalls/io_pgetevents/io_pgetevents02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/io_setup/io_setup01
| CC testcases/kernel/syscalls/io_setup/io_setup02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/io_submit/io_submit01
| CC testcases/kernel/syscalls/io_submit/io_submit04
| CC testcases/kernel/syscalls/io_submit/io_submit02
| CC testcases/kernel/syscalls/io_submit/io_submit03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/io_uring/io_uring02
| CC testcases/kernel/syscalls/io_uring/io_uring01
| CC testcases/kernel/syscalls/io_uring/io_uring03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ioctl/ioctl07
| CC testcases/kernel/syscalls/ioctl/ioctl05
| CC testcases/kernel/syscalls/ioctl/ioctl03
| CC testcases/kernel/syscalls/ioctl/ioctl04
| CC testcases/kernel/syscalls/ioctl/ioctl06
| CC testcases/kernel/syscalls/ioctl/ioctl08
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlone04
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlone02
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlonerange02
| CC testcases/kernel/syscalls/ioctl/ioctl01
| CC testcases/kernel/syscalls/ioctl/ioctl09
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlone03
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlone01
| CC testcases/kernel/syscalls/ioctl/ioctl02
| CC testcases/kernel/syscalls/ioctl/ioctl_ficlonerange01
| CC testcases/kernel/syscalls/ioctl/ioctl10
| In file included from ioctl_ns01.c:23:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from ioctl_ns05.c:22:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from ioctl_ns06.c:23:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/ioctl/ioctl_loop03
| CC testcases/kernel/syscalls/ioctl/ioctl_loop04
| CC testcases/kernel/syscalls/ioctl/ioctl_ns02
| CC testcases/kernel/syscalls/ioctl/ioctl_loop06
| CC testcases/kernel/syscalls/ioctl/ioctl_ns03
| CC testcases/kernel/syscalls/ioctl/ioctl_loop01
| CC testcases/kernel/syscalls/ioctl/ioctl_ns04
| CC testcases/kernel/syscalls/ioctl/ioctl_loop02
| CC testcases/kernel/syscalls/ioctl/ioctl_getlbmd01
| CC testcases/kernel/syscalls/ioctl/ioctl_ns01
| CC testcases/kernel/syscalls/ioctl/ioctl_fiemap01
| CC testcases/kernel/syscalls/ioctl/ioctl_loop05
| CC testcases/kernel/syscalls/ioctl/ioctl_loop07
| CC testcases/kernel/syscalls/ioctl/ioctl_ns07
| CC testcases/kernel/syscalls/ioctl/ioctl_ns06
| CC testcases/kernel/syscalls/ioctl/ioctl_ns05
| In file included from ioctl_pidfd03.c:13:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from ioctl_pidfd02.c:13:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from ioctl_pidfd05.c:16:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from ioctl_pidfd04.c:12:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from ioctl_pidfd06.c:13:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/ioctl/ioctl_pidfd01
| CC testcases/kernel/syscalls/ioctl/ioctl_pidfd05
| CC testcases/kernel/syscalls/ioctl/ioctl_pidfd03
| CC testcases/kernel/syscalls/ioctl/ioctl_pidfd06
| CC testcases/kernel/syscalls/ioctl/ioctl_pidfd02
| CC testcases/kernel/syscalls/ioctl/ioctl_pidfd04
| CC testcases/kernel/syscalls/ioctl/ioctl_sg01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ioperm/ioperm01
| CC testcases/kernel/syscalls/ioperm/ioperm02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/iopl/iopl01
| CC testcases/kernel/syscalls/iopl/iopl02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ioprio/ioprio_get01
| CC testcases/kernel/syscalls/ioprio/ioprio_set03
| CC testcases/kernel/syscalls/ioprio/ioprio_set02
| CC testcases/kernel/syscalls/ioprio/ioprio_set01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl03
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl02
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl12
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl05
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl01
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl06
| CC testcases/kernel/syscalls/ipc/msgctl/msgctl04
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgget/msgget04
| CC testcases/kernel/syscalls/ipc/msgget/msgget01
| CC testcases/kernel/syscalls/ipc/msgget/msgget05
| CC testcases/kernel/syscalls/ipc/msgget/msgget02
| CC testcases/kernel/syscalls/ipc/msgget/msgget03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnewipc.a
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv08
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv06
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv01
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv05
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv03
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv02
| CC testcases/kernel/syscalls/ipc/msgrcv/msgrcv07
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd01
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd06
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd02
| CC testcases/kernel/syscalls/ipc/msgsnd/msgsnd05
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/msgstress/msgstress01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libipc.a
| BUILD libnewipc.a
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| semctl06.c: In function 'term':
| semctl06.c:283:22: warning: unused parameter 'sig' [-Wunused-parameter]
|   283 | static void term(int sig)
|       |                  ~~~~^~~
| semctl09.c: In function 'do_semctl':
| semctl09.c:59:16: warning: storing the address of local variable 'info' in 'un.buf' [-Wdangling-pointer=]
|    59 |         un.buf = &info;
|       |         ~~~~~~~^~~~~~~
| semctl09.c:57:25: note: 'info' declared here
|    57 |         struct semid_ds info;
|       |                         ^~~~
| semctl09.c:49:20: note: 'un' declared here
|    49 | static union semun un;
|       |                    ^~
| CC testcases/kernel/syscalls/ipc/semctl/semctl08
| CC testcases/kernel/syscalls/ipc/semctl/semctl02
| CC testcases/kernel/syscalls/ipc/semctl/semctl05
| CC testcases/kernel/syscalls/ipc/semctl/semctl06
| CC testcases/kernel/syscalls/ipc/semctl/semctl04
| CC testcases/kernel/syscalls/ipc/semctl/semctl07
| CC testcases/kernel/syscalls/ipc/semctl/semctl03
| CC testcases/kernel/syscalls/ipc/semctl/semctl09
| CC testcases/kernel/syscalls/ipc/semctl/semctl01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnewipc.a
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/semget/semget01
| CC testcases/kernel/syscalls/ipc/semget/semget02
| CC testcases/kernel/syscalls/ipc/semget/semget05
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| semop05.c: In function 'main':
| semop05.c:74:16: warning: variable 'rc' set but not used [-Wunused-but-set-variable=]
|    74 |         int i, rc;
|       |                ^~
| semop05.c: In function 'waiter':
| semop05.c:123:20: warning: unused parameter 'foo' [-Wunused-parameter]
|   123 | void *waiter(void *foo)
|       |              ~~~~~~^~~
| semop05.c: In function 'poster':
| semop05.c:142:20: warning: unused parameter 'foo' [-Wunused-parameter]
|   142 | void *poster(void *foo)
|       |              ~~~~~~^~~
| CC testcases/kernel/syscalls/ipc/semop/semop05
| CC testcases/kernel/syscalls/ipc/semop/semop04
| CC testcases/kernel/syscalls/ipc/semop/semop01
| CC testcases/kernel/syscalls/ipc/semop/semop03
| CC testcases/kernel/syscalls/ipc/semop/semop02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnewipc.a
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/shmat/shmat03
| CC testcases/kernel/syscalls/ipc/shmat/shmat04
| CC testcases/kernel/syscalls/ipc/shmat/shmat02
| CC testcases/kernel/syscalls/ipc/shmat/shmat01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| shmctl08.c: In function 'check_mode':
| shmctl08.c:39:31: warning: comparison of integer expressions of different signedness: '__mode_t' {aka 'unsigned int'} and 'short int' [-Wsign-compare]
|    39 |         if (ds->shm_perm.mode == exp_mode) {
|       |                               ^~
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl03
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl06
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl07
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl02
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl08
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl04
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl01
| CC testcases/kernel/syscalls/ipc/shmctl/shmctl05
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/shmdt/shmdt02
| CC testcases/kernel/syscalls/ipc/shmdt/shmdt01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnewipc.a
| make[6]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[7]: Nothing to be done for 'all'.
| make[7]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/ipc/shmget/shmget05
| CC testcases/kernel/syscalls/ipc/shmget/shmget06
| CC testcases/kernel/syscalls/ipc/shmget/shmget04
| CC testcases/kernel/syscalls/ipc/shmget/shmget03
| CC testcases/kernel/syscalls/ipc/shmget/shmget02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| In file included from kcmp03.c:23:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/kcmp/kcmp01
| CC testcases/kernel/syscalls/kcmp/kcmp03
| CC testcases/kernel/syscalls/kcmp/kcmp02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/keyctl/keyctl08
| CC testcases/kernel/syscalls/keyctl/keyctl04
| CC testcases/kernel/syscalls/keyctl/keyctl03
| CC testcases/kernel/syscalls/keyctl/keyctl01
| CC testcases/kernel/syscalls/keyctl/keyctl06
| CC testcases/kernel/syscalls/keyctl/keyctl09
| CC testcases/kernel/syscalls/keyctl/keyctl07
| CC testcases/kernel/syscalls/keyctl/keyctl02
| CC testcases/kernel/syscalls/keyctl/keyctl05
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libnewipc.a
| make[5]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| kill02.c: In function 'setup':
| kill02.c:603:13: warning: variable 'errno_buf' set but not used [-Wunused-but-set-variable=]
|   603 |         int errno_buf;          /*indicates the errno if pipe set up fails.             */
|       |             ^~~~~~~~~
| kill10.c: In function 'ack_ready':
| kill10.c:365:47: warning: unused parameter 'data' [-Wunused-parameter]
|   365 | void ack_ready(int sig, siginfo_t * si, void *data)
|       |                                         ~~~~~~^~~~
| kill10.c: In function 'ack_done':
| kill10.c:392:46: warning: unused parameter 'data' [-Wunused-parameter]
|   392 | void ack_done(int sig, siginfo_t * si, void *data)
|       |                                        ~~~~~~^~~~
| kill02.c: In function 'child1_rout':
| kill02.c:411:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   411 |                 (void)write(pipe1_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:435:31: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   435 |                         (void)write(pipe2_fd[1], CHAR_SET_FAILED, 1);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:450:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   450 |                 (void)write(pipe1_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:460:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   460 |                 (void)write(pipe1_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:471:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   471 |                 (void)write(pipe1_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:499:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   499 |                 (void)write(pipe1_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:506:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   506 |         (void)write(pipe1_fd[1], CHAR_SET_PASSED, 1);
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill10.c: In function 'set_create_procs':
| kill10.c:477:27: warning: unused parameter 'sig' [-Wunused-parameter]
|   477 | void set_create_procs(int sig)
|       |                       ~~~~^~~
| kill02.c: In function 'child2_rout':
| kill02.c:542:23: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   542 |                 (void)write(pipe2_fd[1], CHAR_SET_FAILED, 1);
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c:547:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   547 |         (void)write(pipe2_fd[1], CHAR_SET_PASSED, 1);
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c: In function 'childA_rout':
| kill02.c:563:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   563 |         write(pipeA_fd[1], CHAR_SET_PASSED, 1);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill02.c: In function 'childB_rout':
| kill02.c:587:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   587 |         write(pipeB_fd[1], CHAR_SET_PASSED, 1);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill10.c: In function 'graceful_exit':
| kill10.c:608:24: warning: unused parameter 'sig' [-Wunused-parameter]
|   608 | void graceful_exit(int sig)
|       |                    ~~~~^~~
| kill10.c: In function 'set_signal_parents':
| kill10.c:613:29: warning: unused parameter 'sig' [-Wunused-parameter]
|   613 | void set_signal_parents(int sig)
|       |                         ~~~~^~~
| kill10.c: In function 'clear_signal_parents':
| kill10.c:620:31: warning: unused parameter 'sig' [-Wunused-parameter]
|   620 | void clear_signal_parents(int sig)
|       |                           ~~~~^~~
| kill10.c: In function 'set_confirmed_ready':
| kill10.c:627:30: warning: unused parameter 'sig' [-Wunused-parameter]
|   627 | void set_confirmed_ready(int sig)
|       |                          ~~~~^~~
| kill10.c: In function 'reset_counter':
| kill10.c:635:24: warning: unused parameter 'sig' [-Wunused-parameter]
|   635 | void reset_counter(int sig)
|       |                    ~~~~^~~
| kill10.c: In function 'reply_to_child':
| kill10.c:643:25: warning: unused parameter 'sig' [-Wunused-parameter]
|   643 | void reply_to_child(int sig, siginfo_t * si, void *data)
|       |                     ~~~~^~~
| kill10.c:643:52: warning: unused parameter 'data' [-Wunused-parameter]
|   643 | void reply_to_child(int sig, siginfo_t * si, void *data)
|       |                                              ~~~~~~^~~~
| kill10.c: In function 'wakeup':
| kill10.c:670:17: warning: unused parameter 'sig' [-Wunused-parameter]
|   670 | void wakeup(int sig)
|       |             ~~~~^~~
| kill02.c: In function 'chld1_kill':
| kill02.c:757:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   757 |         (void)write(pipe1_fd[1], CHAR_SET_PASSED, 1);
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| kill12.c: In function 'main':
| kill12.c:89:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|    89 |         if (sigset(SIGCHLD, chsig) == SIG_ERR) {
|       |         ^~
| In file included from kill12.c:43:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| kill12.c:168:39: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
|   168 |                                 } else;
|       |                                       ^
| kill12.c:79:13: warning: variable 'core' set but not used [-Wunused-but-set-variable=]
|    79 |         int core;
|       |             ^~~~
| kill12.c:77:19: warning: variable 'exno' set but not used [-Wunused-but-set-variable=]
|    77 |         int nsig, exno, nexno, status;
|       |                   ^~~~
| kill12.c: In function 'do_child':
| kill12.c:201:9: warning: 'sigset' is deprecated: Use the signal and sigprocmask functions instead [-Wdeprecated-declarations]
|   201 |         sigset(sig, SIG_IGN);   /* set to ignore signal */
|       |         ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/signal.h:367:23: note: declared here
|   367 | extern __sighandler_t sigset (int __sig, __sighandler_t __disp) __THROW
|       |                       ^~~~~~
| kill02.c: In function 'parent_rout':
| kill02.c:277:9: warning: '__builtin_strncpy' output may be truncated copying 1 byte from a string of length 9 [-Wstringop-truncation]
|   277 |         strncpy(buf_tmp1, pipe_buf, 1);
|       |         ^
| kill02.c:283:9: warning: '__builtin_strncpy' output may be truncated copying 1 byte from a string of length 9 [-Wstringop-truncation]
|   283 |         strncpy(buf_tmp2, pipe_buf, 1);
|       |         ^
| kill02.c:397:17: warning: '__builtin_strncpy' output may be truncated copying 1 byte from a string of length 9 [-Wstringop-truncation]
|   397 |                 strncpy(buf_tmp1, pipe_buf, 1);
|       |                 ^
| CC testcases/kernel/syscalls/kill/kill12
| CC testcases/kernel/syscalls/kill/kill03
| CC testcases/kernel/syscalls/kill/kill06
| CC testcases/kernel/syscalls/kill/kill13
| CC testcases/kernel/syscalls/kill/kill08
| CC testcases/kernel/syscalls/kill/kill05
| CC testcases/kernel/syscalls/kill/kill11
| CC testcases/kernel/syscalls/kill/kill02
| CC testcases/kernel/syscalls/kill/kill10
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/landlock/landlock_exec
| CC testcases/kernel/syscalls/landlock/landlock01
| CC testcases/kernel/syscalls/landlock/landlock03
| CC testcases/kernel/syscalls/landlock/landlock02
| CC testcases/kernel/syscalls/landlock/landlock10
| CC testcases/kernel/syscalls/landlock/landlock05
| CC testcases/kernel/syscalls/landlock/landlock09
| CC testcases/kernel/syscalls/landlock/landlock06
| CC testcases/kernel/syscalls/landlock/landlock07
| CC testcases/kernel/syscalls/landlock/landlock08
| CC testcases/kernel/syscalls/landlock/landlock04
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/lchown/lchown01_16.o
| CC testcases/kernel/syscalls/lchown/lchown02_16.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| lchown01.c: In function 'run':
| lchown01.c:44:36: warning: comparison of integer expressions of different signedness: 'uid_t' {aka 'unsigned int'} and 'int' [-Wsign-compare]
|    44 |         uid_t cmp_usr_id = user_id == -1 ? stat_buf.st_uid : user_id;
|       |                                    ^~
| lchown01.c:45:37: warning: comparison of integer expressions of different signedness: 'gid_t' {aka 'unsigned int'} and 'int' [-Wsign-compare]
|    45 |         gid_t cmp_grp_id = group_id == -1 ? stat_buf.st_gid : group_id;
|       |                                     ^~
| LD testcases/kernel/syscalls/lchown/lchown01_16
| lchown01.c: In function 'run':
| lchown01.c:44:36: warning: comparison of integer expressions of different signedness: 'uid_t' {aka 'unsigned int'} and 'int' [-Wsign-compare]
|    44 |         uid_t cmp_usr_id = user_id == -1 ? stat_buf.st_uid : user_id;
|       |                                    ^~
| lchown01.c:45:37: warning: comparison of integer expressions of different signedness: 'gid_t' {aka 'unsigned int'} and 'int' [-Wsign-compare]
|    45 |         gid_t cmp_grp_id = group_id == -1 ? stat_buf.st_gid : group_id;
|       |                                     ^~
| LD testcases/kernel/syscalls/lchown/lchown02_16
| CC testcases/kernel/syscalls/lchown/lchown01
| CC testcases/kernel/syscalls/lchown/lchown02
| rm lchown01_16.o lchown02_16.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/lgetxattr/lgetxattr02
| CC testcases/kernel/syscalls/lgetxattr/lgetxattr01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/link/link08
| CC testcases/kernel/syscalls/link/link02
| CC testcases/kernel/syscalls/link/link04
| CC testcases/kernel/syscalls/link/link05
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/linkat/linkat01
| CC testcases/kernel/syscalls/linkat/linkat02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/listen/listen01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| In file included from listmount01.c:22:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| In file included from listmount02.c:23:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/listmount/listmount04
| CC testcases/kernel/syscalls/listmount/listmount03
| CC testcases/kernel/syscalls/listmount/listmount01
| CC testcases/kernel/syscalls/listmount/listmount02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/listxattr/listxattr03
| CC testcases/kernel/syscalls/listxattr/listxattr02
| CC testcases/kernel/syscalls/listxattr/listxattr01
| CC testcases/kernel/syscalls/listxattr/listxattr04
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/llistxattr/llistxattr03
| CC testcases/kernel/syscalls/llistxattr/llistxattr02
| CC testcases/kernel/syscalls/llistxattr/llistxattr01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/llseek/llseek02
| CC testcases/kernel/syscalls/llseek/llseek01
| CC testcases/kernel/syscalls/llseek/llseek03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/lremovexattr/lremovexattr01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/lseek/lseek02
| CC testcases/kernel/syscalls/lseek/lseek01
| CC testcases/kernel/syscalls/lseek/lseek07
| CC testcases/kernel/syscalls/lseek/lseek11
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/lsm/lsm_get_self_attr01
| CC testcases/kernel/syscalls/lsm/lsm_set_self_attr01
| CC testcases/kernel/syscalls/lsm/lsm_list_modules01
| CC testcases/kernel/syscalls/lsm/lsm_get_self_attr02
| CC testcases/kernel/syscalls/lsm/lsm_get_self_attr03
| CC testcases/kernel/syscalls/lsm/lsm_list_modules02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| CC testcases/kernel/syscalls/lstat/lstat01_64.o
| CC testcases/kernel/syscalls/lstat/lstat02_64.o
| CC testcases/kernel/syscalls/lstat/lstat03_64.o
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| LD testcases/kernel/syscalls/lstat/lstat01_64
| LD testcases/kernel/syscalls/lstat/lstat02_64
| LD testcases/kernel/syscalls/lstat/lstat03_64
| CC testcases/kernel/syscalls/lstat/lstat01
| CC testcases/kernel/syscalls/lstat/lstat02
| CC testcases/kernel/syscalls/lstat/lstat03
| rm lstat02_64.o lstat01_64.o lstat03_64.o
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| madvise08.c: In function 'find_sequence':
| madvise08.c:136:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
|   136 |                         if (expectc == 'z') {
|       |                            ^
| madvise08.c:140:17: note: here
|   140 |                 default:
|       |                 ^~~~~~~
| CC testcases/kernel/syscalls/madvise/madvise05
| CC testcases/kernel/syscalls/madvise/madvise03
| CC testcases/kernel/syscalls/madvise/madvise07
| CC testcases/kernel/syscalls/madvise/madvise01
| CC testcases/kernel/syscalls/madvise/madvise12
| CC testcases/kernel/syscalls/madvise/madvise10
| CC testcases/kernel/syscalls/madvise/madvise02
| CC testcases/kernel/syscalls/madvise/madvise08
| CC testcases/kernel/syscalls/madvise/madvise06
| CC testcases/kernel/syscalls/madvise/madvise09
| CC testcases/kernel/syscalls/madvise/madvise11
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| mallinfo02.c: In function 'test_mallinfo':
| mallinfo02.c:24:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    24 |         info = mallinfo();
|       |         ^~~~
| In file included from mallinfo_common.h:11,
|                  from mallinfo02.c:12:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| mallinfo02.c:33:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    33 |         info = mallinfo();
|       |         ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| mallinfo02.c:37:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    37 |         info = mallinfo();
|       |         ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| mallinfo01.c: In function 'test_mallinfo':
| mallinfo01.c:41:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    41 |         info2 = mallinfo();
|       |         ^~~~~
| In file included from mallinfo_common.h:11,
|                  from mallinfo01.c:11:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| mallinfo01.c:51:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    51 |         info2 = mallinfo();
|       |         ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| mallinfo01.c: In function 'setup':
| mallinfo01.c:66:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    66 |         info1 = mallinfo();
|       |         ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| CC testcases/kernel/syscalls/mallinfo/mallinfo02
| CC testcases/kernel/syscalls/mallinfo/mallinfo01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mallinfo2/mallinfo2_01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| mallopt01.c: In function 'test_mallopt':
| mallopt01.c:29:9: warning: 'mallinfo' is deprecated [-Wdeprecated-declarations]
|    29 |         info = mallinfo();
|       |         ^~~~
| In file included from ../mallinfo/mallinfo_common.h:11,
|                  from mallopt01.c:14:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/malloc.h:114:24: note: declared here
|   114 | extern struct mallinfo mallinfo (void) __THROW __MALLOC_DEPRECATED;
|       |                        ^~~~~~~~
| CC testcases/kernel/syscalls/mallopt/mallopt01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| make -C /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/testcases/kernel/lib -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/testcases/kernel/lib/Makefile" all
| BUILD libnuma.a
| make[5]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| numa_helper.c: In function 'get_allowed_nodes_arr':
| numa_helper.c:152:31: warning: unused parameter 'flag' [-Wunused-parameter]
|   152 | int get_allowed_nodes_arr(int flag, int *num_nodes, int **nodes)
|       |                           ~~~~^~~~
| numa_cpuset.c: In function 'write_node_cpusets':
| numa_cpuset.c:27:52: warning: '/online' directive output may be truncated writing 7 bytes into a region of size between 1 and 8192 [-Wformat-truncation=]
|    27 |                         snprintf(path1, BUFSIZ, "%s/online", path);
|       |                                                    ^~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/stdio.h:974,
|                  from ../../../include/safe_stdio_fn.h:21,
|                  from ../../../include/tst_safe_macros.h:27,
|                  from ../../../include/tst_test.h:187,
|                  from numa_cpuset.c:8:
| In function 'snprintf',
|     inlined from 'gather_node_cpus' at numa_cpuset.c:27:4,
|     inlined from 'write_node_cpusets' at numa_cpuset.c:51:2:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 8 and 8199 bytes into a destination of size 8192
|    68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    69 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    70 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/lib/numa_helper.o
| CC testcases/kernel/lib/ksm_helper.o
| CC testcases/kernel/lib/numa_cpuset.o
| AR libkerntest.a
| RANLIB libkerntest.a
| CC testcases/kernel/syscalls/mbind/mbind04
| CC testcases/kernel/syscalls/mbind/mbind01
| CC testcases/kernel/syscalls/mbind/mbind02
| CC testcases/kernel/syscalls/mbind/mbind03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/membarrier/membarrier01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/memcmp/memcmp01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/memcpy/memcpy01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| memfd_create_common.c: In function 'check_mfd_growable_by_write':
| memfd_create_common.c:446:13: warning: 'buf' is used uninitialized [-Wuninitialized]
|   446 |         if (pwrite(fd, buf, sizeof(buf), 0) != sizeof(buf)) {
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from memfd_create_common.c:15:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/unistd.h:398:16: note: in a call to 'pwrite' declared with attribute 'access (read_only, 2, 3)' here
|   398 | extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
|       |                ^~~~~~
| memfd_create_common.c:444:14: note: 'buf' declared here
|   444 |         char buf[MFD_DEF_SIZE * 8];
|       |              ^~~
| memfd_create_common.c: In function 'check_mfd_non_growable_by_write':
| memfd_create_common.c:465:13: warning: 'buf' is used uninitialized [-Wuninitialized]
|   465 |         if (pwrite(fd, buf, sizeof(buf), 0) == sizeof(buf)) {
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/unistd.h:398:16: note: in a call to 'pwrite' declared with attribute 'access (read_only, 2, 3)' here
|   398 | extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,
|       |                ^~~~~~
| memfd_create_common.c:463:14: note: 'buf' declared here
|   463 |         char buf[MFD_DEF_SIZE * 8];
|       |              ^~~
| CC testcases/kernel/syscalls/memfd_create/memfd_create_common.o
| CC testcases/kernel/syscalls/memfd_create/memfd_create02
| CC testcases/kernel/syscalls/memfd_create/memfd_create04
| CC testcases/kernel/syscalls/memfd_create/memfd_create03
| CC testcases/kernel/syscalls/memfd_create/memfd_create01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/memset/memset01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| make -C /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/testcases/kernel/lib -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/testcases/kernel/lib/Makefile" all
| make[5]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/migrate_pages/migrate_pages_common.o
| CC testcases/kernel/syscalls/migrate_pages/migrate_pages01
| CC testcases/kernel/syscalls/migrate_pages/migrate_pages02
| CC testcases/kernel/syscalls/migrate_pages/migrate_pages03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mincore/mincore03
| CC testcases/kernel/syscalls/mincore/mincore01
| CC testcases/kernel/syscalls/mincore/mincore02
| CC testcases/kernel/syscalls/mincore/mincore04
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mkdir/mkdir04
| CC testcases/kernel/syscalls/mkdir/mkdir02
| CC testcases/kernel/syscalls/mkdir/mkdir05
| CC testcases/kernel/syscalls/mkdir/mkdir03
| CC testcases/kernel/syscalls/mkdir/mkdir09
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mkdirat/mkdirat01
| CC testcases/kernel/syscalls/mkdirat/mkdirat02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mknod/mknod09
| CC testcases/kernel/syscalls/mknod/mknod01
| CC testcases/kernel/syscalls/mknod/mknod03
| CC testcases/kernel/syscalls/mknod/mknod05
| CC testcases/kernel/syscalls/mknod/mknod04
| CC testcases/kernel/syscalls/mknod/mknod06
| CC testcases/kernel/syscalls/mknod/mknod02
| CC testcases/kernel/syscalls/mknod/mknod08
| CC testcases/kernel/syscalls/mknod/mknod07
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mknodat/mknodat01
| CC testcases/kernel/syscalls/mknodat/mknodat02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mlock/mlock01
| CC testcases/kernel/syscalls/mlock/mlock03
| CC testcases/kernel/syscalls/mlock/mlock04
| CC testcases/kernel/syscalls/mlock/mlock05
| CC testcases/kernel/syscalls/mlock/mlock02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mlock2/mlock203
| CC testcases/kernel/syscalls/mlock2/mlock202
| CC testcases/kernel/syscalls/mlock2/mlock201
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| mlockall02.c: In function 'cleanup_test':
| mlockall02.c:231:17: warning: ignoring return value of 'seteuid' declared with attribute 'warn_unused_result' [-Wunused-result]
|   231 |                 seteuid(0);
|       |                 ^~~~~~~~~~
| CC testcases/kernel/syscalls/mlockall/mlockall01
| CC testcases/kernel/syscalls/mlockall/mlockall02
| CC testcases/kernel/syscalls/mlockall/mlockall03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| mmap11.c: In function 'wait_thread':
| mmap11.c:128:25: warning: unused parameter 'args' [-Wunused-parameter]
|   128 | void *wait_thread(void *args)
|       |                   ~~~~~~^~~~
| mmap11.c: In function 'wait_thread2':
| mmap11.c:139:26: warning: unused parameter 'args' [-Wunused-parameter]
|   139 | void *wait_thread2(void *args)
|       |                    ~~~~~~^~~~
| CC testcases/kernel/syscalls/mmap/mmap11
| CC testcases/kernel/syscalls/mmap/mmap15
| CC testcases/kernel/syscalls/mmap/mmap08
| CC testcases/kernel/syscalls/mmap/mmap14
| CC testcases/kernel/syscalls/mmap/mmap05
| CC testcases/kernel/syscalls/mmap/mmap06
| CC testcases/kernel/syscalls/mmap/mmap02
| CC testcases/kernel/syscalls/mmap/mmap04
| CC testcases/kernel/syscalls/mmap/mmap09
| CC testcases/kernel/syscalls/mmap/mmap13
| CC testcases/kernel/syscalls/mmap/mmap17
| CC testcases/kernel/syscalls/mmap/mmap10
| CC testcases/kernel/syscalls/mmap/mmap03
| CC testcases/kernel/syscalls/mmap/mmap01
| CC testcases/kernel/syscalls/mmap/mmap12
| CC testcases/kernel/syscalls/mmap/mmap16
| CC testcases/kernel/syscalls/mmap/mmap18
| CC testcases/kernel/syscalls/mmap/mmap20
| CC testcases/kernel/syscalls/mmap/mmap19
| CC testcases/kernel/syscalls/mmap/mmap21
| CC testcases/kernel/syscalls/mmap/mmap22
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/modify_ldt/modify_ldt01
| CC testcases/kernel/syscalls/modify_ldt/modify_ldt02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mount/mount03_suid_child
| CC testcases/kernel/syscalls/mount/mount01
| CC testcases/kernel/syscalls/mount/mount04
| CC testcases/kernel/syscalls/mount/mount08
| CC testcases/kernel/syscalls/mount/mount05
| CC testcases/kernel/syscalls/mount/mount06
| CC testcases/kernel/syscalls/mount/mount02
| CC testcases/kernel/syscalls/mount/mount07
| CC testcases/kernel/syscalls/mount/mount03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mount_setattr/mount_setattr01
| CC testcases/kernel/syscalls/mount_setattr/mount_setattr02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| In file included from move_mount03.c:76:
| ../../../../include/lapi/sched.h: In function 'ltp_clone3':
| ../../../../include/lapi/sched.h:90:49: warning: unused parameter 'cl_args' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                              ~~~~~~~~~~~~~~~~~~~^~~~~~~
| ../../../../include/lapi/sched.h:90:65: warning: unused parameter 'size' [-Wunused-parameter]
|    90 | static inline int ltp_clone3(struct clone_args *cl_args, size_t size,
|       |                                                          ~~~~~~~^~~~
| ../../../../include/lapi/sched.h:91:36: warning: unused parameter 'fn' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                              ~~~~~~^~~~~~~~~~~
| ../../../../include/lapi/sched.h:91:55: warning: unused parameter 'arg' [-Wunused-parameter]
|    91 |                              int (*fn)(void *), void *arg)
|       |                                                 ~~~~~~^~~
| CC testcases/kernel/syscalls/move_mount/move_mount01
| CC testcases/kernel/syscalls/move_mount/move_mount02
| CC testcases/kernel/syscalls/move_mount/move_mount03
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| make -C /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/testcases/kernel/lib -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/testcases/kernel/lib/Makefile" all
| make[5]: Nothing to be done for 'all'.
| GEN ltp-version.h
| move_pages_support.c: In function 'free_pages':
| move_pages_support.c:37:24: warning: unused parameter 'pages' [-Wunused-parameter]
|    37 | void free_pages(void **pages, unsigned int num)
|       |                 ~~~~~~~^~~~~
| move_pages_support.c:37:44: warning: unused parameter 'num' [-Wunused-parameter]
|    37 | void free_pages(void **pages, unsigned int num)
|       |                               ~~~~~~~~~~~~~^~~
| move_pages_support.c: In function 'verify_pages_on_nodes':
| move_pages_support.c:169:30: warning: unused parameter 'pages' [-Wunused-parameter]
|   169 | verify_pages_on_nodes(void **pages, int *status, unsigned int num, int *nodes)
|       |                       ~~~~~~~^~~~~
| move_pages_support.c:169:42: warning: unused parameter 'status' [-Wunused-parameter]
|   169 | verify_pages_on_nodes(void **pages, int *status, unsigned int num, int *nodes)
|       |                                     ~~~~~^~~~~~
| move_pages_support.c:169:63: warning: unused parameter 'num' [-Wunused-parameter]
|   169 | verify_pages_on_nodes(void **pages, int *status, unsigned int num, int *nodes)
|       |                                                  ~~~~~~~~~~~~~^~~
| move_pages_support.c:169:73: warning: unused parameter 'nodes' [-Wunused-parameter]
|   169 | verify_pages_on_nodes(void **pages, int *status, unsigned int num, int *nodes)
|       |                                                                    ~~~~~^~~~~
| move_pages_support.c: In function 'verify_pages_linear':
| move_pages_support.c:215:33: warning: unused parameter 'pages' [-Wunused-parameter]
|   215 | void verify_pages_linear(void **pages, int *status, unsigned int num)
|       |                          ~~~~~~~^~~~~
| move_pages_support.c:215:45: warning: unused parameter 'status' [-Wunused-parameter]
|   215 | void verify_pages_linear(void **pages, int *status, unsigned int num)
|       |                                        ~~~~~^~~~~~
| move_pages_support.c:215:66: warning: unused parameter 'num' [-Wunused-parameter]
|   215 | void verify_pages_linear(void **pages, int *status, unsigned int num)
|       |                                                     ~~~~~~~~~~~~~^~~
| move_pages_support.c: In function 'alloc_shared_pages_on_node':
| move_pages_support.c:270:39: warning: unused parameter 'pages' [-Wunused-parameter]
|   270 | int alloc_shared_pages_on_node(void **pages, unsigned int num, int node)
|       |                                ~~~~~~~^~~~~
| move_pages_support.c:270:59: warning: unused parameter 'num' [-Wunused-parameter]
|   270 | int alloc_shared_pages_on_node(void **pages, unsigned int num, int node)
|       |                                              ~~~~~~~~~~~~~^~~
| move_pages_support.c:270:68: warning: unused parameter 'node' [-Wunused-parameter]
|   270 | int alloc_shared_pages_on_node(void **pages, unsigned int num, int node)
|       |                                                                ~~~~^~~~
| move_pages_support.c: In function 'check_config':
| move_pages_support.c:393:32: warning: unused parameter 'min_nodes' [-Wunused-parameter]
|   393 | void check_config(unsigned int min_nodes)
|       |                   ~~~~~~~~~~~~~^~~~~~~~~
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/move_pages/move_pages_support.o
| CC testcases/kernel/syscalls/move_pages/move_pages01
| CC testcases/kernel/syscalls/move_pages/move_pages02
| CC testcases/kernel/syscalls/move_pages/move_pages07
| CC testcases/kernel/syscalls/move_pages/move_pages09
| CC testcases/kernel/syscalls/move_pages/move_pages06
| CC testcases/kernel/syscalls/move_pages/move_pages10
| CC testcases/kernel/syscalls/move_pages/move_pages05
| CC testcases/kernel/syscalls/move_pages/move_pages03
| CC testcases/kernel/syscalls/move_pages/move_pages11
| CC testcases/kernel/syscalls/move_pages/move_pages04
| CC testcases/kernel/syscalls/move_pages/move_pages12
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mprotect/mprotect03
| CC testcases/kernel/syscalls/mprotect/mprotect01
| CC testcases/kernel/syscalls/mprotect/mprotect02
| CC testcases/kernel/syscalls/mprotect/mprotect05
| CC testcases/kernel/syscalls/mprotect/mprotect04
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mq_notify/mq_notify02
| CC testcases/kernel/syscalls/mq_notify/mq_notify03
| CC testcases/kernel/syscalls/mq_notify/mq_notify01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mq_open/mq_open01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mq_timedsend/mq_timedsend01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mq_unlink/mq_unlink01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| BUILD libipc.a
| make[5]: Nothing to be done for 'all'.
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mremap/mremap03
| CC testcases/kernel/syscalls/mremap/mremap02
| CC testcases/kernel/syscalls/mremap/mremap04
| CC testcases/kernel/syscalls/mremap/mremap01
| CC testcases/kernel/syscalls/mremap/mremap06
| CC testcases/kernel/syscalls/mremap/mremap05
| CC testcases/kernel/syscalls/mremap/mremap07
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/mseal/mseal02
| CC testcases/kernel/syscalls/mseal/mseal01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/msync/msync02
| CC testcases/kernel/syscalls/msync/msync01
| CC testcases/kernel/syscalls/msync/msync03
| CC testcases/kernel/syscalls/msync/msync04
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/munlock/munlock01
| CC testcases/kernel/syscalls/munlock/munlock02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/munlockall/munlockall01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/munmap/munmap03
| CC testcases/kernel/syscalls/munmap/munmap01
| CC testcases/kernel/syscalls/munmap/munmap04
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02
| CC testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at03
| CC testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/nanosleep/nanosleep04
| CC testcases/kernel/syscalls/nanosleep/nanosleep01
| CC testcases/kernel/syscalls/nanosleep/nanosleep02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/newuname/newuname01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| test_func.c: In function 'test_func1':
| test_func.c:41:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|    41 | test_func1(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:42:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|    42 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func.c:42:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|    42 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func3':
| test_func.c:76:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|    76 | test_func3(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:77:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|    77 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func.c:77:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|    77 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func4':
| test_func.c:101:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   101 | test_func4(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:102:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   102 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func.c:102:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   102 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func5':
| test_func.c:114:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   114 | test_func5(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:115:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   115 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func7':
| test_func.c:137:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   137 | test_func7(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:138:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   138 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func.c:138:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   138 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func8':
| test_func.c:168:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   168 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func9':
| tools.c: In function 'nftw_fn':
| test_func.c:248:54: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   248 | test_func9(const char *path_name, const struct stat *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:249:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   249 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| tools.c:158:25: warning: unused parameter 'path' [-Wunused-parameter]
|   158 | int nftw_fn(const char *path, const struct stat *st, int ival, struct FTW *FTWS)
|       |             ~~~~~~~~~~~~^~~~
| tools.c:158:50: warning: unused parameter 'st' [-Wunused-parameter]
|   158 | int nftw_fn(const char *path, const struct stat *st, int ival, struct FTW *FTWS)
|       |                               ~~~~~~~~~~~~~~~~~~~^~
| tools.c:158:58: warning: unused parameter 'ival' [-Wunused-parameter]
|   158 | int nftw_fn(const char *path, const struct stat *st, int ival, struct FTW *FTWS)
|       |                                                      ~~~~^~~~
| tools.c:158:76: warning: unused parameter 'FTWS' [-Wunused-parameter]
|   158 | int nftw_fn(const char *path, const struct stat *st, int ival, struct FTW *FTWS)
|       |                                                                ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func10':
| test_func.c:283:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   283 | test_func10(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:284:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   284 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| lib.c: In function 'get_long_name_buffer':
| lib.c:65:62: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|    65 |         if ((path_length = pathconf(tmp_path, _PC_PATH_MAX)) == -1) {
|       |                                                              ^~
| tools.c: In function 'do_info':
| test_func.c: In function 'test_func11':
| tools.c:250:26: warning: unused parameter 'path_name' [-Wunused-parameter]
|   250 | void do_info(const char *path_name)
|       |              ~~~~~~~~~~~~^~~~~~~~~
| test_func.c:317:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   317 | test_func11(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:318:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   318 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| lib.c:72:62: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|    72 |         if ((name_length = pathconf(tmp_path, _PC_NAME_MAX)) == -1) {
|       |                                                              ^~
| test_func.c: In function 'test_func12':
| test_func.c:351:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   351 | test_func12(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:352:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   352 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func13':
| test_func.c:383:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   383 | test_func13(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:384:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   384 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| tools.c: In function 'cleanup_function':
| test_func.c: In function 'test_func14':
| test_func.c:418:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   418 | test_func14(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:419:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   419 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| tools.c:53:9: warning: ignoring return value of 'system' declared with attribute 'warn_unused_result' [-Wunused-result]
|    53 |         system("rm -rf ./tmp");
|       |         ^~~~~~~~~~~~~~~~~~~~~~
| test_func.c: In function 'test_func15':
| test_func.c:453:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   453 | test_func15(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:454:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   454 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| lib.c: In function 'test_ENAMETOOLONG_path':
| lib.c:183:60: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|   183 |         if ((pcPathMax = pathconf(tmp_path, _PC_PATH_MAX)) == -1) {
|       |                                                            ^~
| test_func.c: In function 'test_func16':
| test_func.c:468:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   468 | test_func16(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:469:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   469 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func.c: In function 'test_func17':
| test_func.c:497:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   497 | test_func17(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| lib.c:208:27: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   208 |         while (pathLength < pcPathMax) {
|       |                           ^
| test_func.c:498:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   498 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func18':
| test_func.c:510:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   510 | test_func18(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:511:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   511 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| lib.c:219:27: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   219 |         while (pathLength <= pcPathMax) {
|       |                           ^~
| lib.c:226:24: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   226 |         if (pathLength != pcPathMax + 1) {
|       |                        ^~
| test_func.c: In function 'test_func19':
| test_func.c:522:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   522 | test_func19(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:523:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   523 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func.c: In function 'test_func20':
| test_func.c:546:25: warning: unused parameter 'path_name' [-Wunused-parameter]
|   546 | test_func20(const char *path_name, const struct stat *stat_pointer,
|       |             ~~~~~~~~~~~~^~~~~~~~~
| test_func.c:546:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   546 | test_func20(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:547:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   547 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func.c:547:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   547 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| nftw.c: In function 'setup':
| test_func.c: In function 'test_func21':
| test_func.c:553:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   553 | test_func21(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:554:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   554 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func.c:554:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   554 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| nftw.c:686:9: warning: ignoring return value of 'setuid' declared with attribute 'warn_unused_result' [-Wunused-result]
|   686 |         setuid(ltpuser->pw_uid);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~
| test_func.c: In function 'test_func22':
| test_func.c:581:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   581 | test_func22(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:582:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   582 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func.c: In function 'test_func23':
| test_func.c:613:55: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   613 | test_func23(const char *path_name, const struct stat *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func.c:614:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   614 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func1':
| test_func64.c:41:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|    41 | test_func1(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:42:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|    42 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func64.c:42:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|    42 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func3':
| test_func64.c:75:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|    75 | test_func3(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:76:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|    76 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func64.c:76:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|    76 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| nftw64.c: In function 'setup':
| test_func64.c: In function 'test_func4':
| test_func64.c:100:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   100 | test_func4(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:101:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   101 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func64.c:101:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   101 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| nftw64.c:713:9: warning: ignoring return value of 'setuid' declared with attribute 'warn_unused_result' [-Wunused-result]
|   713 |         setuid(ltpuser->pw_uid);
|       |         ^~~~~~~~~~~~~~~~~~~~~~~
| test_func64.c: In function 'test_func5':
| test_func64.c:113:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   113 | test_func5(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:114:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   114 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func7':
| test_func64.c:137:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   137 | test_func7(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:138:16: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   138 |            int ftw_integer, struct FTW *ftwp)
|       |            ~~~~^~~~~~~~~~~
| test_func64.c:138:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   138 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| tools64.c: In function 'nftw64_fn':
| tools64.c:158:23: warning: unused parameter 'path' [-Wunused-parameter]
|   158 | nftw64_fn(const char *path, const struct stat64 *st, int ival, struct FTW *FTWS)
|       |           ~~~~~~~~~~~~^~~~
| tools64.c:158:50: warning: unused parameter 'st' [-Wunused-parameter]
|   158 | nftw64_fn(const char *path, const struct stat64 *st, int ival, struct FTW *FTWS)
|       |                             ~~~~~~~~~~~~~~~~~~~~~^~
| tools64.c:158:58: warning: unused parameter 'ival' [-Wunused-parameter]
|   158 | nftw64_fn(const char *path, const struct stat64 *st, int ival, struct FTW *FTWS)
|       |                                                      ~~~~^~~~
| tools64.c:158:76: warning: unused parameter 'FTWS' [-Wunused-parameter]
|   158 | nftw64_fn(const char *path, const struct stat64 *st, int ival, struct FTW *FTWS)
|       |                                                                ~~~~~~~~~~~~^~~~
| lib64.c: In function 'get_long_name_buffer':
| test_func64.c: In function 'test_func8':
| test_func64.c:169:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   169 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| lib64.c:65:62: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|    65 |         if ((path_length = pathconf(tmp_path, _PC_PATH_MAX)) == -1) {
|       |                                                              ^~
| lib64.c:72:62: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|    72 |         if ((name_length = pathconf(tmp_path, _PC_NAME_MAX)) == -1) {
|       |                                                              ^~
| test_func64.c: In function 'test_func9':
| tools64.c: In function 'do_info':
| test_func64.c:250:56: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   250 | test_func9(const char *path_name, const struct stat64 *stat_pointer,
|       |                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| tools64.c:250:26: warning: unused parameter 'path_name' [-Wunused-parameter]
|   250 | void do_info(const char *path_name)
|       |              ~~~~~~~~~~~~^~~~~~~~~
| test_func64.c:251:41: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   251 |            int ftw_integer, struct FTW *ftwp)
|       |                             ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func10':
| test_func64.c:286:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   286 | test_func10(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:287:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   287 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func11':
| test_func64.c:321:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   321 | test_func11(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:322:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   322 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| tools64.c: In function 'cleanup_function':
| tools64.c:52:9: warning: ignoring return value of 'system' declared with attribute 'warn_unused_result' [-Wunused-result]
|    52 |         system("rm -rf ./tmp");
|       |         ^~~~~~~~~~~~~~~~~~~~~~
| test_func64.c: In function 'test_func12':
| lib64.c: In function 'test_ENAMETOOLONG_path':
| test_func64.c:356:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   356 | test_func12(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:357:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   357 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| lib64.c:183:60: warning: comparison of integer expressions of different signedness: 'size_t' {aka 'long unsigned int'} and 'int' [-Wsign-compare]
|   183 |         if ((pcPathMax = pathconf(tmp_path, _PC_PATH_MAX)) == -1) {
|       |                                                            ^~
| test_func64.c: In function 'test_func13':
| lib64.c:208:27: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   208 |         while (pathLength < pcPathMax) {
|       |                           ^
| test_func64.c:389:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   389 | test_func13(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:390:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   390 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| lib64.c:219:27: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   219 |         while (pathLength <= pcPathMax) {
|       |                           ^~
| lib64.c:226:24: warning: comparison of integer expressions of different signedness: 'int' and 'size_t' {aka 'long unsigned int'} [-Wsign-compare]
|   226 |         if (pathLength != pcPathMax + 1) {
|       |                        ^~
| test_func64.c: In function 'test_func14':
| test_func64.c:425:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   425 | test_func14(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:426:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   426 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func15':
| test_func64.c:461:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   461 | test_func15(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:462:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   462 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func16':
| test_func64.c:478:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   478 | test_func16(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:479:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   479 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func64.c: In function 'test_func17':
| test_func64.c:508:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   508 | test_func17(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:509:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   509 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func18':
| test_func64.c:521:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   521 | test_func18(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:522:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   522 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func19':
| test_func64.c:533:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   533 | test_func19(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:534:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   534 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func20':
| test_func64.c:558:25: warning: unused parameter 'path_name' [-Wunused-parameter]
|   558 | test_func20(const char *path_name, const struct stat64 *stat_pointer,
|       |             ~~~~~~~~~~~~^~~~~~~~~
| test_func64.c:558:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   558 | test_func20(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:559:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   559 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func64.c:559:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   559 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| test_func64.c: In function 'test_func21':
| test_func64.c:565:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   565 | test_func21(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:566:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   566 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func64.c:566:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   566 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| make[6]: Nothing to be done for 'all'.
| test_func64.c: In function 'test_func22':
| test_func64.c:594:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   594 | test_func22(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:595:17: warning: unused parameter 'ftw_integer' [-Wunused-parameter]
|   595 |             int ftw_integer, struct FTW *ftwp)
|       |             ~~~~^~~~~~~~~~~
| test_func64.c: In function 'test_func23':
| test_func64.c:626:57: warning: unused parameter 'stat_pointer' [-Wunused-parameter]
|   626 | test_func23(const char *path_name, const struct stat64 *stat_pointer,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
| test_func64.c:627:42: warning: unused parameter 'ftwp' [-Wunused-parameter]
|   627 |             int ftw_integer, struct FTW *ftwp)
|       |                              ~~~~~~~~~~~~^~~~
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/nftw/nftw64.o
| CC testcases/kernel/syscalls/nftw/nftw.o
| CC testcases/kernel/syscalls/nftw/tools.o
| CC testcases/kernel/syscalls/nftw/tools64.o
| CC testcases/kernel/syscalls/nftw/lib.o
| CC testcases/kernel/syscalls/nftw/lib64.o
| CC testcases/kernel/syscalls/nftw/test_func.o
| CC testcases/kernel/syscalls/nftw/test.o
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now  -L../../../../lib  nftw.o tools.o test_func.o test.o lib.o  -lltp -o nftw01
| CC testcases/kernel/syscalls/nftw/test_func64.o
| CC testcases/kernel/syscalls/nftw/test64.o
| x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now  -L../../../../lib  nftw64.o tools64.o test_func64.o test64.o lib64.o  -lltp -o nftw6401
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| nice05.c: In function 'do_something':
| nice05.c:47:22: warning: variable 'number' set but not used [-Wunused-but-set-variable=]
|    47 |         volatile int number = 0;
|       |                      ^~~~~~
| nice05.c: In function 'setup':
| nice05.c:76:13: warning: 'some_cpu' may be used uninitialized [-Wmaybe-uninitialized]
|    76 |         int some_cpu;
|       |             ^~~~~~~~
| CC testcases/kernel/syscalls/nice/nice02
| CC testcases/kernel/syscalls/nice/nice04
| CC testcases/kernel/syscalls/nice/nice03
| CC testcases/kernel/syscalls/nice/nice01
| CC testcases/kernel/syscalls/nice/nice05
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/open/open12_child
| CC testcases/kernel/syscalls/open/open03
| CC testcases/kernel/syscalls/open/open06
| CC testcases/kernel/syscalls/open/open09
| CC testcases/kernel/syscalls/open/open07
| CC testcases/kernel/syscalls/open/open15
| CC testcases/kernel/syscalls/open/open08
| CC testcases/kernel/syscalls/open/open02
| CC testcases/kernel/syscalls/open/open01
| CC testcases/kernel/syscalls/open/open10
| CC testcases/kernel/syscalls/open/open04
| CC testcases/kernel/syscalls/open/open11
| CC testcases/kernel/syscalls/open/open13
| CC testcases/kernel/syscalls/open/open12
| CC testcases/kernel/syscalls/open/open14
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02
| CC testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/open_tree/open_tree02
| CC testcases/kernel/syscalls/open_tree/open_tree01
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| CC testcases/kernel/syscalls/openat/openat02_child
| openat01.c: In function 'setup':
| openat01.c:85:49: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 256 [-Wformat-truncation=]
|    85 |         snprintf(glob_path, sizeof(glob_path), "%s/" TEST_DIR TEST_FILE, buf);
|       |                                                 ^~                       ~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/stdio.h:974,
|                  from openat01.c:32:
| In function 'snprintf',
|     inlined from 'setup' at openat01.c:85:2:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/stdio2.h:68:10: note: '__builtin___snprintf_chk' output between 20 and 4115 bytes into a destination of size 256
|    68 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    69 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    70 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| CC testcases/kernel/syscalls/openat/openat01
| CC testcases/kernel/syscalls/openat/openat04
| CC testcases/kernel/syscalls/openat/openat03
| CC testcases/kernel/syscalls/openat/openat02
| make -C "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib" -f "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/lib/Makefile" all
| GEN ltp-version.h
| make[6]: Nothing to be done for 'all'.
| make[6]: Nothing to be done for 'all'.
| In file included from openat202.c:14:
| ../../../../include/lapi/openat2.h:35:8: error: redefinition of 'struct open_how'
|    35 | struct open_how {
|       |        ^~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl-linux.h:466,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl.h:61,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/fcntl.h:35,
|                  from openat202.c:11:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/linux/openat2.h:19:8: note: originally defined here
|    19 | struct open_how {
|       |        ^~~~~~~~
| ../../../../include/lapi/openat2.h:55:19: error: conflicting types for 'openat2'; have 'int(int,  const char *, struct open_how *, size_t)' {aka 'int(int,  const char *, struct open_how *, long unsigned int)'}
|    55 | static inline int openat2(int dfd, const char *pathname,
|       |                   ^~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl-linux.h:490:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl-linux-fortify.h:36:1: note: previous definition of 'openat2' with type 'int(int,  const char *, const struct open_how *, long unsigned int)'
|    36 | openat2 (int __dfd, const char *__filename, const struct open_how *__how,
|       | ^~~~~~~
| In file included from openat203.c:14:
| ../../../../include/lapi/openat2.h:35:8: error: redefinition of 'struct open_how'
|    35 | struct open_how {
|       |        ^~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl-linux.h:466,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl.h:61,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/fcntl.h:35,
|                  from openat203.c:11:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/linux/openat2.h:19:8: note: originally defined here
|    19 | struct open_how {
|       |        ^~~~~~~~
| ../../../../include/lapi/openat2.h:55:19: error: conflicting types for 'openat2'; have 'int(int,  const char *, struct open_how *, size_t)' {aka 'int(int,  const char *, struct open_how *, long unsigned int)'}
|    55 | static inline int openat2(int dfd, const char *pathname,
|       |                   ^~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl-linux.h:490:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl-linux-fortify.h:36:1: note: previous definition of 'openat2' with type 'int(int,  const char *, const struct open_how *, long unsigned int)'
|    36 | openat2 (int __dfd, const char *__filename, const struct open_how *__how,
|       | ^~~~~~~
| In file included from openat201.c:14:
| ../../../../include/lapi/openat2.h:35:8: error: redefinition of 'struct open_how'
|    35 | struct open_how {
|       |        ^~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl-linux.h:466,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl.h:61,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/fcntl.h:35,
|                  from openat201.c:11:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/linux/openat2.h:19:8: note: originally defined here
|    19 | struct open_how {
|       |        ^~~~~~~~
| ../../../../include/lapi/openat2.h:55:19: error: conflicting types for 'openat2'; have 'int(int,  const char *, struct open_how *, size_t)' {aka 'int(int,  const char *, struct open_how *, long unsigned int)'}
|    55 | static inline int openat2(int dfd, const char *pathname,
|       |                   ^~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl-linux.h:490:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/recipe-sysroot/usr/include/bits/fcntl-linux-fortify.h:36:1: note: previous definition of 'openat2' with type 'int(int,  const char *, const struct open_how *, long unsigned int)'
|    36 | openat2 (int __dfd, const char *__filename, const struct open_how *__how,
|       | ^~~~~~~
| make[4]: *** [../../../../include/mk/rules.mk:48: openat202] Error 1
| make[4]: *** Waiting for unfinished jobs....
| make[4]: *** [../../../../include/mk/rules.mk:48: openat203] Error 1
| make[4]: *** [../../../../include/mk/rules.mk:48: openat201] Error 1
| make[3]: *** [../../../include/mk/generic_trunk_target.inc:92: all] Error 2
| make[2]: *** [../../include/mk/generic_trunk_target.inc:92: all] Error 2
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/sources/ltp-20260529/testcases'
| make[1]: *** [../include/mk/generic_trunk_target.inc:92: all] Error 2
| make: *** [Makefile:85: testcases-all] Error 2
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/temp/run.do_compile.1541206:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/temp/run.do_compile.1541206, line 174
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/temp/run.do_compile.1541206, line 158
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/temp/run.do_compile.1541206, line 153
| 	#4: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/temp/run.do_compile.1541206, line 148
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/temp/run.do_compile.1541206, line 187
NOTE: recipe ltp-20260529-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 3251 tasks of which 3242 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611112000.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611112000.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/temp/log.do_compile.1541206
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ltp-20260529-r0 do_compile: oe_runmake failed
ERROR: ltp-20260529-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/temp/run.do_compile.1541206' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/ltp/20260529/temp/log.do_compile.1541206
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/ltp/ltp_20260529.bb:do_compile) failed with exit code '1'

--===============9001977325126745060==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ltp-upgrade-20260130-20260529.patch"

RnJvbSA0OTZiMDA5NDQ0ZDViOGM2MTQ0YWJiZDE4M2ZlY2M5YzNkZDQwNWRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTE6MjE6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
dHA6IHVwZ3JhZGUgMjAyNjAxMzAgLT4gMjAyNjA1MjkKCi0tLQogLi4uMDEtQWRkLV9fY2xlYXJf
Y2FjaGUtZGVjbGFyYXRpb24tZm9yLWNsYW5nLnBhdGNoIHwgIDQgKystLQogLi4uL2x0cC8wMDAx
LVJlbW92ZS1PT00tdGVzdHMtZnJvbS1ydW50ZXN0LW1tLnBhdGNoIHwgIDIgKy0KIC4uLjAwMDEt
bHRwLWZpeC1idWlsZC1mYWlsdXJlLXdpdGgtZ2xpYmMtMi40My5wYXRjaCB8IDEzICsrKysrKysr
Ky0tLS0KIC4uLmVtY3RsMDgtU2tpcC1zZW1jdGwwOC13aGVuLV9fVVNFX1RJTUU2NF9SRS5wYXRj
aCB8ICA2ICsrKy0tLQogLi4uL2x0cC97bHRwXzIwMjYwMTMwLmJiID0+IGx0cF8yMDI2MDUyOS5i
Yn0gICAgICAgIHwgIDIgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC97bHRwXzIwMjYw
MTMwLmJiID0+IGx0cF8yMDI2MDUyOS5iYn0gKDk5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLUFkZC1fX2NsZWFyX2NhY2hlLWRlY2xhcmF0aW9uLWZv
ci1jbGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtQWRkLV9f
Y2xlYXJfY2FjaGUtZGVjbGFyYXRpb24tZm9yLWNsYW5nLnBhdGNoCmluZGV4IDI0ZTg3NjJmNzcu
LjA3Nzc4ZWM2ZmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAw
MDEtQWRkLV9fY2xlYXJfY2FjaGUtZGVjbGFyYXRpb24tZm9yLWNsYW5nLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtQWRkLV9fY2xlYXJfY2FjaGUtZGVjbGFy
YXRpb24tZm9yLWNsYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMmNlMDRjYjgyZDU0
NWYzZGJhYjcxZGU3ZmE1NWVhYWQzZGYzMDYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBjZWZhNWVkZTUwOTg1ODAzMTI0ZmQwOWU5YzZmMmQwN2UyNDcxZTFiIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1v
biwgMTAgSnVuIDIwMjQgMjI6NTI6NTYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIF9fY2xl
YXJfY2FjaGUgZGVjbGFyYXRpb24gZm9yIGNsYW5nCkBAIC0xOSw3ICsxOSw3IEBAIENjOiBIdWkg
TWluIE1pbmEgQ2hvdSA8bWluYWNob3VAYW5kZXN0ZWNoLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL2h1Z2V0
bGIvaHVnZW1tYXAvaHVnZW1tYXAxNS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9tZW0vaHVnZXRsYi9o
dWdlbW1hcC9odWdlbW1hcDE1LmMKLWluZGV4IDFkZGU5ZTg3Yi4uNmE2ZjVmZTVlIDEwMDY0NAor
aW5kZXggZjI5ODRlMmRjLi41Njg1YmI4NjQgMTAwNjQ0CiAtLS0gYS90ZXN0Y2FzZXMva2VybmVs
L21lbS9odWdldGxiL2h1Z2VtbWFwL2h1Z2VtbWFwMTUuYwogKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9tZW0vaHVnZXRsYi9odWdlbW1hcC9odWdlbW1hcDE1LmMKIEBAIC0xOSw2ICsxOSw3IEBACmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLVJlbW92ZS1PT00t
dGVzdHMtZnJvbS1ydW50ZXN0LW1tLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9s
dHAvMDAwMS1SZW1vdmUtT09NLXRlc3RzLWZyb20tcnVudGVzdC1tbS5wYXRjaAppbmRleCA4NjBi
MmYxMjdmLi4zYTVhYzJiNWEwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRw
L2x0cC8wMDAxLVJlbW92ZS1PT00tdGVzdHMtZnJvbS1ydW50ZXN0LW1tLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtUmVtb3ZlLU9PTS10ZXN0cy1mcm9tLXJ1
bnRlc3QtbW0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJiOTE0NmRkMzIyYWY5OGE3YmI5
NmFkMGQ4NGVjMzc2NTg5YzZjZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI3YmY2
ZjQ5ZmRjOThkYzBhYWM5Y2E2ZjJkNTgxNjg4ZTA4M2VkN2EgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiAiTWluZ2RlIChNYXR0aGV3KSBaZW5nIiA8bWF0dGhld3ptZEBnbWFpbC5jb20+
CiBEYXRlOiBXZWQsIDI5IEp1bCAyMDIwIDA4OjQ3OjA5IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IFJlbW92ZSBPT00gdGVzdHMgZnJvbSBydW50ZXN0L21tCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLWx0cC1maXgtYnVpbGQtZmFpbHVyZS13aXRoLWdsaWJj
LTIuNDMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLWx0cC1maXgt
YnVpbGQtZmFpbHVyZS13aXRoLWdsaWJjLTIuNDMucGF0Y2gKaW5kZXggN2M3ODY2MGUzZS4uYzlk
ZTc4MzVkNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1s
dHAtZml4LWJ1aWxkLWZhaWx1cmUtd2l0aC1nbGliYy0yLjQzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtbHRwLWZpeC1idWlsZC1mYWlsdXJlLXdpdGgtZ2xp
YmMtMi40My5wYXRjaApAQCAtMSw0ICsxLDcgQEAKLWx0cDogZml4IGJ1aWxkIGZhaWx1cmUgd2l0
aCBnbGliYyAyLjQzCitGcm9tIGNlNjU0M2Y4ZGI5Y2Y0MWVhN2M3ZGMzZDg2ZWIyNmVlNzk4NzNm
ZGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBIZW1hbnRoIEt1bWFyIE0gRCA8SGVt
YW50aC5LdW1hck1EQHdpbmRyaXZlci5jb20+CitEYXRlOiBUaHUsIDEyIE1hciAyMDI2IDA5OjEw
OjIxIC0wNzAwCitTdWJqZWN0OiBbUEFUQ0hdIGx0cDogZml4IGJ1aWxkIGZhaWx1cmUgd2l0aCBn
bGliYyAyLjQzCiAKIGdsaWJjIDIuNDMgYWRkZWQgbmF0aXZlIG9wZW5hdDIoKSBzdXBwb3J0IGZv
ciB0aGUgZmlyc3QgdGltZS4gVGhpcwogY2F1c2VkIGNvbXBhdGliaWxpdHkgaXNzdWVzIHdpdGgg
TFRQJ3MgaW50ZXJuYWwgb3BlbmF0MiBkZWZpbml0aW9ucwpAQCAtMTMsMTUgKzE2LDE4IEBAIG93
biBpbnRlcm5hbCBkZWZpbml0aW9ucy50aGlzIGlzIGEgd29ya2Fyb3VuZCB1bnRpbCB0aGUgZml4
IGlzIGZvdW5kLgogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAKIFNpZ25lZC1vZmYtYnk6IEhl
bWFudGggS3VtYXIgTSBEIDxIZW1hbnRoLkt1bWFyTURAd2luZHJpdmVyLmNvbT4KKy0tLQorIGlu
Y2x1ZGUvbGFwaS9vcGVuYXQyLmggfCA1ICsrKysrCisgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9sYXBpL29wZW5hdDIuaCBiL2luY2x1ZGUv
bGFwaS9vcGVuYXQyLmgKIGluZGV4IDAzMzI3YmRiNy4uYmQ0NDU3M2M5IDEwMDY0NAogLS0tIGEv
aW5jbHVkZS9sYXBpL29wZW5hdDIuaAogKysrIGIvaW5jbHVkZS9sYXBpL29wZW5hdDIuaAogQEAg
LTE0LDYgKzE0LDExIEBACi0KKyAKICAjaW5jbHVkZSAiY29uZmlnLmgiCi0KKyAKICsvKiBnbGli
YyAyLjQzIHByb3ZpZGVzIG9wZW5hdDIgYnV0IExUUCB1c2VzIGl0cyBvd24gc3lzY2FsbCB3cmFw
cGVyICovCiArI2lmZGVmIEhBVkVfT1BFTkFUMgogKyN1bmRlZiBIQVZFX09QRU5BVDIKQEAgLTMw
LDQgKzM2LDMgQEAgaW5kZXggMDMzMjdiZGI3Li5iZDQ0NTczYzkgMTAwNjQ0CiAgI2lmbmRlZiBI
QVZFX09QRU5BVDIKICAvKgogICAqIEFyZ3VtZW50cyBmb3IgaG93IG9wZW5hdDIoMikgc2hvdWxk
IG9wZW4gdGhlIHRhcmdldCBwYXRoLiBJZiBvbmx5IEBmbGFncyBhbmQKLQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1zeXNjYWxscy1zZW1jdGwwOC1Ta2lw
LXNlbWN0bDA4LXdoZW4tX19VU0VfVElNRTY0X1JFLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2x0cC9sdHAvMDAwMS1zeXNjYWxscy1zZW1jdGwwOC1Ta2lwLXNlbWN0bDA4LXdoZW4tX19V
U0VfVElNRTY0X1JFLnBhdGNoCmluZGV4IDM2NGUyMDNlMjMuLmUzOGU5YzNlMjEgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtc3lzY2FsbHMtc2VtY3RsMDgt
U2tpcC1zZW1jdGwwOC13aGVuLV9fVVNFX1RJTUU2NF9SRS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLXN5c2NhbGxzLXNlbWN0bDA4LVNraXAtc2VtY3RsMDgt
d2hlbi1fX1VTRV9USU1FNjRfUkUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA5MzY0YTc1
OGRmOWQ4OWEwOTY4ODk0Mzc2ZjgyZjYzNjQ0MWFkZGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDg5YzgzMTg1ZTc1N2RkYWViMDI2MmMxN2ExMGY2MDUwNTZmNTM5MTYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBKaWF5aW5nIFNvbmcgPGppYXlpbmcuc29uZy5jbkB3aW5k
cml2ZXIuY29tPgogRGF0ZTogRnJpLCAyMyBNYXkgMjAyNSAxNToxNzo0OSArMDgwMAogU3ViamVj
dDogW1BBVENIXSBzeXNjYWxscy9zZW1jdGwwODogU2tpcCBzZW1jdGwwOCB3aGVuIF9fVVNFX1RJ
TUU2NF9SRURJUkVDVFMKQEAgLTIwLDEyICsyMCwxMiBAQCBTaWduZWQtb2ZmLWJ5OiBKaWF5aW5n
IFNvbmcgPGppYXlpbmcuc29uZy5jbkB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2lwYy9zZW1jdGwvc2VtY3RsMDguYyBiL3Rlc3RjYXNlcy9rZXJuZWwv
c3lzY2FsbHMvaXBjL3NlbWN0bC9zZW1jdGwwOC5jCi1pbmRleCBmNDU0OWFkZjQuLjI4Nzc2ZjI2
NiAxMDA2NDQKK2luZGV4IDA4MzE3OWM5Mi4uYTk4ZWIzNWQ2IDEwMDY0NAogLS0tIGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9pcGMvc2VtY3RsL3NlbWN0bDA4LmMKICsrKyBiL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvaXBjL3NlbWN0bC9zZW1jdGwwOC5jCiBAQCAtMTIsNyArMTIsMTEg
QEAKICAjaW5jbHVkZSAidHN0X3Rlc3QuaCIKLSAjaW5jbHVkZSAibGlibmV3aXBjLmgiCisgI2lu
Y2x1ZGUgInRzZV9uZXdpcGMuaCIKICAKIC0jaWZkZWYgSEFWRV9TRU1JRDY0X0RTX1RJTUVfSElH
SAogKyNpZiAhZGVmaW5lZChIQVZFX1NFTUlENjRfRFNfVElNRV9ISUdIKQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyNjAxMzAuYmIgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbHRwL2x0cF8yMDI2MDUyOS5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDI2MDEzMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyNjA1MjkuYmIKaW5kZXggNDE4M2I1ZDQ5
Ny4uMWVlNjNjYTJlMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBf
MjAyNjAxMzAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyNjA1Mjku
YmIKQEAgLTI0LDcgKzI0LDcgQEAgVFVORV9DQ0FSR1M6cmVtb3ZlOng4Ni02NCA9ICItbWZwbWF0
aD1zc2UiCiAKIENGTEFHUzphcHBlbmQ6cG93ZXJwYzY0ID0gIiAtRF9fU0FORV9VU0VSU1BBQ0Vf
VFlQRVNfXyIKIENGTEFHUzphcHBlbmQ6bWlwc2FyY2huNjQgPSAiIC1EX19TQU5FX1VTRVJTUEFD
RV9UWVBFU19fIgotU1JDUkVWID0gIjZhNjBhZTU5MmNkMzc1ZjAwNGRmMDY5NGVmYzdkNTBkZGFl
OWFhNWUiCitTUkNSRVYgPSAiM2E2NGQ3OGY1OGJkY2ViYTkzZWQzMjFlOTEyMTVmYjk2OWEwNDdl
ZCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAu
Z2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1SZW1vdmUtT09NLXRlc3RzLWZyb20tcnVudGVzdC1tbS5wYXRjaCBcCi0tIAoyLjQ3LjEKCg==

--===============9001977325126745060==--

