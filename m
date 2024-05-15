Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3DAC3DA5F
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:31 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1294.1715794339685412820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KSI3BVzk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tqpef6w/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018f7d4fe478-cf7badec-c6c2-4848-bcda-5ae385b807f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kkXJ7RHilyaieJ09FTLTBxbK9d8NF2sEd1IjFZ6UGwc=;
	b=KSI3BVzk9Qn3qg8a/a/kB3rAbZ0P3YZv2azVJBg7jmYpLriMQqKASeH58gPoHRQi
	wg+74X8d7u4J1R73sQHV9bIfwTlAT0qxGmomAIEOZXhBmIC5V3YvIn0lNCf3nTMEsKl
	6XLJn3P/DFJlH7sUJsnv/guc3K48xMgwXDco8Ync=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kkXJ7RHilyaieJ09FTLTBxbK9d8NF2sEd1IjFZ6UGwc=;
	b=tqpef6w/a30FxehbOOWkOJEoWZyfgR0vkIiuwwDZx8IOEEov+EFiT6QIX/wNlVVL
	QPXl7r7ekNok0SC4ywzzk8HHVfb8Ek5UCAZS4sTepL9lSmgXYCvVYfe3hXvWezAozqB
	Ur8RMJrTFQqNaVM6L03afeh3wBqE7kE1eLZQ/5RY=
Content-Type: multipart/mixed; boundary="===============8881198901557039038=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-utility-libraries: upgrading to 1.3.283.0 SUCCEEDED
Message-ID: <0101018f7d4fe478-cf7badec-c6c2-4848-bcda-5ae385b807f4-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199394

--===============8881198901557039038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-utility-libraries* to *1.3.283.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-utility-libraries-upgrade-1.3.280.0-1.3.283.0.patch
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
From 2512c5dc9e74c32f806231d786c4e6ba84d5fd21 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 14:28:54 +0000
Subject: [PATCH] vulkan-utility-libraries: upgrade 1.3.280.0 -> 1.3.283.0

---
 ...aries_1.3.280.0.bb => vulkan-utility-libraries_1.3.283.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.3.280.0.bb => vulkan-utility-libraries_1.3.283.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb
index 3ab31af96a..5fb63327a8 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
-SRCREV = "a4140c5fd47dcf3a030726a60b293db61cfb54a3"
+SRCREV = "ad7f699a7b2b5deb66eb3de19f24aa33597ed65b"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============8881198901557039038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1880 targets, 46 skipped, 0 masked, 0 errors.
Removing 40 recipes from the core2-64 sysroot...done.
Removing 47 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-52dead40536f1ebf0524f488fac726670f140390"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:52dead40536f1ebf0524f488fac726670f140390"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 132 Local 120 Mirrors 0 Missed 12 Current 182 (90% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 190 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 199 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 633 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_recipe_qa)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 260 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 261 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 263 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vulkan-headers/1.3.280.0/temp/log.do_packagedata_setscene.2430805
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 264 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_package_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 268 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 696 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_fetch: Succeeded
NOTE: Running task 780 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_unpack)
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_unpack: Succeeded
NOTE: Running task 781 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 272 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_patch: Succeeded
NOTE: Running task 782 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 783 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_generate_toolchain_file)
NOTE: Running task 784 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_populate_lic: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 277 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 279 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 280 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_populate_lic unihash changed to c25eae4b7b683a0d2112f40fc61a2c128842e793af4eeb85517a28da365e26a4
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 283 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 304 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 309 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 310 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 908 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_packagedata)
NOTE: Running task 910 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 922 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_packagedata: Succeeded
NOTE: Running task 924 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_configure: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_configure: Succeeded
NOTE: Running task 925 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_compile)
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_compile: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_compile: Succeeded
NOTE: Running task 926 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_install)
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_install: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_install: Succeeded
NOTE: Running task 927 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_package)
NOTE: Running task 928 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_package: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_package: Succeeded
NOTE: Running task 929 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_packagedata)
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_packagedata: Succeeded
NOTE: Running task 930 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_create_spdx)
NOTE: Running task 931 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_package_write_ipk)
NOTE: Running task 932 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_package_write_deb)
NOTE: Running task 933 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_package_write_rpm)
NOTE: Running task 934 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_package_qa)
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_package_write_ipk: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_package_write_deb: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_package_qa: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 935 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_create_runtime_spdx)
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_package_qa: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.283.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 936 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb:do_build)
NOTE: Tasks Summary: Attempted 936 tasks of which 913 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.283.0-r0 to 0:1.3.280.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.283.0-r0 to 0:1.3.280.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.283.0-r0 to 0:1.3.280.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.283.0-r0 to 0:1.3.280.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.283.0-r0 to 0:1.3.280.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.283.0-r0 to 0:1.3.280.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.283.0-r0 to 0:1.3.280.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.280.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8881198901557039038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-utility-libraries: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries: PV changed from "1.3.280.0" to "1.3.283.0"
Changes to packages/core2-64-poky-linux/vulkan-utility-libraries (sysroot):
  /usr/include/vulkan/utility/vk_concurrent_unordered_map.hpp was added
  /usr/include/vulkan/utility/vk_safe_struct.hpp was added
  /usr/include/vulkan/utility/vk_safe_struct_utils.hpp was added
  /usr/include/vulkan/utility/vk_small_containers.hpp was added
  /usr/include/vulkan/utility/vk_sparse_range_map.hpp was added
  /usr/lib/libVulkanSafeStruct.a was added
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dbg: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dbg: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: FILELIST: added "/usr/include/vulkan/utility/vk_sparse_range_map.hpp /usr/include/vulkan/utility/vk_safe_struct.hpp /usr/include/vulkan/utility/vk_safe_struct_utils.hpp /usr/include/vulkan/utility/vk_small_containers.hpp /usr/include/vulkan/utility/vk_concurrent_unordered_map.hpp"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PKGSIZE changed from 929384 to 2186625 (+135%)
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-doc: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-doc: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-locale: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-locale: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-src: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-src: FILELIST: directory renamed /usr/src/debug/vulkan-utility-libraries/1.3.280.0/include/vulkan/layer -> /usr/src/debug/vulkan-utility-libraries/1.3.283.0/include/vulkan/layer, directory renamed /usr/src/debug/vulkan-utility-libraries/1.3.280.0/src/layer -> /usr/src/debug/vulkan-utility-libraries/1.3.283.0/src/layer, added "/usr/src/debug/vulkan-utility-libraries/1.3.283.0/include/vulkan/utility/vk_concurrent_unordered_map.hpp /usr/src/debug/vulkan-utility-libraries/1.3.283.0/src/vulkan/vk_safe_struct_utils.cpp /usr/src/debug/vulkan-utility-libraries/1.3.283.0/include/vulkan/utility/vk_safe_struct.hpp /usr/src/debug/vulkan-utility-libraries/1.3.283.0/src/vulkan/vk_safe_struct_manual.cpp /usr/src/debug/vulkan-utility-libraries/1.3.283.0/src/vulkan/vk_safe_struct_core.cpp /usr/src/debug/vulkan-utility-libraries/1.3.283.0/include/vulkan/utility/vk_safe_struct_utils.hpp /usr/src/debug/vulkan-utility-librarie
 s/1.3.283.0/src/vulkan/vk_safe_struct_khr.cpp /usr/src/debug/vulkan-utility-libraries/1.3.283.0/src/vulkan/vk_safe_struct_vendor.cpp /usr/src/debug/vulkan-utility-libraries/1.3.283.0/include/vulkan/utility/vk_struct_helper.hpp /usr/src/debug/vulkan-utility-libraries/1.3.283.0/src/vulkan/vk_safe_struct_ext.cpp"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-src: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-src: PKGSIZE changed from 72588 to 4606527 (+6246%)
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-staticdev: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-staticdev: FILELIST: added "/usr/lib/libVulkanSafeStruct.a"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-staticdev: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-staticdev: PKGSIZE changed from 5208836 to 13906168 (+167%)
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries: PV changed from "1.3.280.0" to "1.3.283.0"

--===============8881198901557039038==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-utility-libraries-upgrade-1.3.280.0-1.3.283.0.patch"

RnJvbSAyNTEyYzVkYzllNzRjMzJmODA2MjMxZDc4NmM0ZTZiYTg0ZDVmZDIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTQ6Mjg6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdXRpbGl0eS1saWJyYXJpZXM6IHVwZ3JhZGUgMS4zLjI4MC4wIC0+IDEuMy4yODMuMAoK
LS0tCiAuLi5hcmllc18xLjMuMjgwLjAuYmIgPT4gdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEu
My4yODMuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdXRp
bGl0eS1saWJyYXJpZXNfMS4zLjI4MC4wLmJiID0+IHZ1bGthbi11dGlsaXR5LWxpYnJhcmllc18x
LjMuMjgzLjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI4MC4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI4My4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxr
YW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuMy4yODAuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI4My4w
LmJiCmluZGV4IDNhYjMxYWY5NmEuLjVmYjYzMzI3YTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuMy4yODAuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmll
c18xLjMuMjgzLjAuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDRU5TRSA9ICJBcGFjaGUtMi4wIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9NGNhMmQ2Nzk5MDkxYWFh
OThhODUyMGYxYjc5MzkzOWIiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9z
R3JvdXAvVnVsa2FuLVV0aWxpdHktTGlicmFyaWVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1o
dHRwcyIKLVNSQ1JFViA9ICJhNDE0MGM1ZmQ0N2RjZjNhMDMwNzI2YTYwYjI5M2RiNjFjZmI1NGEz
IgorU1JDUkVWID0gImFkN2Y2OTlhN2IyYjVkZWI2NmViM2RlMTlmMjRhYTMzNTk3ZWQ2NWIiCiAK
IFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMAoK

--===============8881198901557039038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/vulkan-utility-libraries (sysroot):
  /usr/include/vulkan/utility/vk_concurrent_unordered_map.hpp was added
  /usr/include/vulkan/utility/vk_safe_struct.hpp was added
  /usr/include/vulkan/utility/vk_safe_struct_utils.hpp was added
  /usr/include/vulkan/utility/vk_small_containers.hpp was added
  /usr/include/vulkan/utility/vk_sparse_range_map.hpp was added
  /usr/lib/libVulkanSafeStruct.a was added
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: FILELIST: added "/usr/include/vulkan/utility/vk_safe_struct_utils.hpp /usr/include/vulkan/utility/vk_small_containers.hpp /usr/include/vulkan/utility/vk_concurrent_unordered_map.hpp /usr/include/vulkan/utility/vk_sparse_range_map.hpp /usr/include/vulkan/utility/vk_safe_struct.hpp"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PKGSIZE changed from 929384 to 2186625 (+135%)
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-src: PKGSIZE changed from 72588 to 4606527 (+6246%)
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-staticdev: FILELIST: added "/usr/lib/libVulkanSafeStruct.a"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-staticdev: PKGSIZE changed from 5208836 to 13906168 (+167%)

--===============8881198901557039038==--

