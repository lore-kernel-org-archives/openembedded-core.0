Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55997C071FD
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:07 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.13584.1713248037835722367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FKZi5HLz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Pf+qvQRU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018ee58a7f64-51c45c30-c812-45ee-b312-cbfafd1ce882-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wSkClNpet/j3TRg1c7BIe5mJGgiwOAaq5d5Aofk8NtA=;
	b=FKZi5HLzFH0WV6fy3gwILoHqnIVVNRunBJ0wFpp2r10/fSHgCsKlsNTcyf0pbKG4
	V4Lk8tpr7ygaKBFbJEHR/684PkKQDdZBXoziPYEy3bO2MpVQuP4AKOQpor7K2Ob0t7M
	usZ43ZQjiWbnoL503sA0S9L/dMLNgJmmiEY9h/08=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wSkClNpet/j3TRg1c7BIe5mJGgiwOAaq5d5Aofk8NtA=;
	b=Pf+qvQRU2HpC9tsefFo9QkJi5PEGrKNiwDn20kUfq6lFZ8JU/HC/Aq4+ymmM+t/m
	xqqUVCAegYIkWAJPldzHJGnrb5LQyIYg+5SrK5qpysB4toj99vFGlv9Aik5XoF1/8cI
	tAmRu72PIQ+28LPoZERd/h+eS4uuirHBM0QDlRpI=
Content-Type: multipart/mixed; boundary="===============1598550758687978053=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] zstd: upgrading to 1.5.6 FAILED
Message-ID: <0101018ee58a7f64-51c45c30-c812-45ee-b312-cbfafd1ce882-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198342

--===============1598550758687978053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zstd* to *1.5.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-zstd-upgrade-1.5.5-1.5.6.patch
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
From 107c0e9c40bf00b8fc2db7d26bb2aab5c982c215 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 22:14:02 +0000
Subject: [PATCH] zstd: upgrade 1.5.5 -> 1.5.6

---
 meta/recipes-extended/zstd/{zstd_1.5.5.bb => zstd_1.5.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/zstd/{zstd_1.5.5.bb => zstd_1.5.6.bb} (96%)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.5.bb b/meta/recipes-extended/zstd/zstd_1.5.6.bb
similarity index 96%
rename from meta/recipes-extended/zstd/zstd_1.5.5.bb
rename to meta/recipes-extended/zstd/zstd_1.5.6.bb
index 2d72af50a4..b65ab84efd 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.5.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.6.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
 SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https \
            file://0001-pzstd-use-directly-for-the-test-c-snippet.patch"
 
-SRCREV = "63779c798237346c2b245c546c40b72a5a5913fe"
+SRCREV = "794ea1b0afca0f020f4e57b6732332231fb23c70"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
-- 
2.42.0


--===============1598550758687978053==
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
DISTRO_VERSION       = "4.3+snapshot-ae70a4c34606fc550c7b070ab07fc4cc0fb2bbaa"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ae70a4c34606fc550c7b070ab07fc4cc0fb2bbaa"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 127 Local 79 Mirrors 0 Missed 48 Current 164 (62% match, 83% complete)
Removing 3 stale sstate objects for arch core2-64...done.
Removing 14 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 178 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 194 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 198 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 202 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 204 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 205 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 206 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 207 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 209 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 213 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 241 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 249 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 254 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 273 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 276 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-native-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 287 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 184 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: Running setscene task 288 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_create_spdx_setscene)
NOTE: Running noexec task 289 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_fetch)
NOTE: Running task 442 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: Running noexec task 444 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_fetch)
NOTE: Running task 471 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: Running task 519 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe zstd-native-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 570 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: Running task 571 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpfr-native-4.2.1-r0: task do_create_spdx_setscene: Started
NOTE: Running noexec task 602 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running task 613 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: Running noexec task 619 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-native-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 674 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 291 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe file-native-5.45-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 679 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 692 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe file-native-5.45-r0: task do_fetch: Succeeded
NOTE: Running task 693 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: Running task 694 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 725 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: Running task 726 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-native-5.45-r0: task do_unpack: Started
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 727 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: recipe zstd-native-1.5.6-r0: task do_unpack: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.7.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 729 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe file-native-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 730 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe file-native-5.45-r0: task do_patch: Started
NOTE: recipe file-native-5.45-r0: task do_patch: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 732 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe zstd-native-1.5.6-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 735 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_patch: Failed
NOTE: recipe zstd-native-1.5.6-r0: task do_patch: Failed
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 736 tasks of which 713 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240415221342.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240415221342.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: zstd-1.5.6-r0 do_patch: Applying patch '0001-pzstd-use-directly-for-the-test-c-snippet.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/zstd/1.5.6/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/zstd/1.5.6/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch
patching file contrib/pzstd/Makefile
Hunk #1 FAILED at 37.
1 out of 1 hunk FAILED -- rejects in file contrib/pzstd/Makefile
Patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch can be reverse-applied

stderr: ')
ERROR: zstd-native-1.5.6-r0 do_patch: Applying patch '0001-pzstd-use-directly-for-the-test-c-snippet.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/zstd-native/1.5.6/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/zstd-native/1.5.6/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch
patching file contrib/pzstd/Makefile
Hunk #1 FAILED at 37.
1 out of 1 hunk FAILED -- rejects in file contrib/pzstd/Makefile
Patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/zstd/1.5.6/temp/log.do_patch.312907
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/zstd-native/1.5.6/temp/log.do_patch.313189
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch) failed with exit code '1'

--===============1598550758687978053==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-zstd-upgrade-1.5.5-1.5.6.patch"

RnJvbSAxMDdjMGU5YzQwYmYwMGI4ZmMyZGI3ZDI2YmIyYWFiNWM5ODJjMjE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjI6MTQ6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB6
c3RkOiB1cGdyYWRlIDEuNS41IC0+IDEuNS42CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC96
c3RkL3t6c3RkXzEuNS41LmJiID0+IHpzdGRfMS41LjYuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3pzdGQve3pzdGRfMS41LjUuYmIgPT4genN0ZF8xLjUuNi5iYn0gKDk2JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvenN0ZC96c3RkXzEuNS41LmJiIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0ZF8xLjUuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvenN0ZC96c3RkXzEuNS41LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvenN0ZC96c3RkXzEuNS42LmJiCmluZGV4IDJkNzJh
ZjUwYTQuLmI2NWFiODRlZmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC96c3Rk
L3pzdGRfMS41LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQvenN0ZF8xLjUu
Ni5iYgpAQCAtMTMsNyArMTMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT0wODIyYTMyZjdhY2RiZTAxMzYwNjc0NjY0MTc0NmVlOCBcCiBTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vZmFjZWJvb2svenN0ZC5naXQ7YnJhbmNoPXJlbGVhc2U7cHJvdG9jb2w9aHR0
cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1wenN0ZC11c2UtZGlyZWN0bHktZm9yLXRoZS10
ZXN0LWMtc25pcHBldC5wYXRjaCIKIAotU1JDUkVWID0gIjYzNzc5Yzc5ODIzNzM0NmMyYjI0NWM1
NDZjNDBiNzJhNWE1OTEzZmUiCitTUkNSRVYgPSAiNzk0ZWExYjBhZmNhMGYwMjBmNGU1N2I2NzMy
MzMyMjMxZmIyM2M3MCIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5c
ZCsoXC5cZCspKykiCiAKIENWRV9QUk9EVUNUID0gInpzdGFuZGFyZCIKLS0gCjIuNDIuMAoK

--===============1598550758687978053==--

