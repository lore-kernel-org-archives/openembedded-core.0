Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05090CD98DF
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:05 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1561.1780328133183049099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Rs9QDH9Q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aPkQ1gqH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d3bc2f-f4e17311-07dd-4be0-be5c-722611f7abc4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hmz+o4J6wciPZ/l0T3JkkQmB7QsxWIRu8xwPfZMmLs8=;
	b=Rs9QDH9Q/ryUHR3ytuf5QvNNki5chdt761ltjdsjxyJWefOjJVZX/hFx/XFwC/YD
	c3CS2O+P5pedlPhtP8RNmmm+RSRs71aqMOjpFF+qH9bbKKXT78JNFyjAg1lkA2PphQ8
	Q+VqGRm5hzegRY7yYmU28vletC+2vtK9NS70yQYM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328152;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hmz+o4J6wciPZ/l0T3JkkQmB7QsxWIRu8xwPfZMmLs8=;
	b=aPkQ1gqHKOrP15eScl9EU5PhEQbMH6xeSiCVky+91bf2nZpK38DpY/biopngeEpM
	7wRuaFa2AoqYrw11g1PefeP9+VxHIvhERS1UiPp/8xpRwbR6vQ2TVB0KsoYaz0VN+T0
	I3zTXZSCXumBcEYmWqRL5/upL8DD+E64vyKEUA/I=
Content-Type: multipart/mixed; boundary="===============1082373594000253036=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-volk: upgrading to 1.4.350.0 SUCCEEDED
Message-ID: <0101019e83d3bc2f-f4e17311-07dd-4be0-be5c-722611f7abc4-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237936

--===============1082373594000253036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-volk* to *1.4.350.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.4.341.0-1.4.350.0.patch
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
From ab8841db30d9ca8e884bd45cd8f0cdc655c8fe5f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 12:15:22 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.4.341.0 -> 1.4.350.0

---
 .../{vulkan-volk_1.4.341.0.bb => vulkan-volk_1.4.350.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.341.0.bb => vulkan-volk_1.4.350.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb
index 144e44969a..4541b71a98 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=cfcbdd69e15396e371f639c69acf40bf"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "d979819fd03de3a7606d6e23d6ff4968942599da"
+SRCREV = "3ca312a4f38baa63d8006b6905abbeeb89c8087d"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============1082373594000253036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-b78d5ebc0c303c269e35fc067e1d7158c2b9c6be"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:b78d5ebc0c303c269e35fc067e1d7158c2b9c6be"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 134 Local 124 Mirrors 0 Missed 10 Current 248 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 278 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 319 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 323 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 324 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 325 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 871 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_fetch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 329 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 331 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vulkan-headers/1.4.341.0/temp/log.do_packagedata_setscene.3521648
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 332 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_package_setscene)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 336 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_fetch: Succeeded
NOTE: Running task 872 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_unpack: Started
NOTE: Running task 883 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_unpack: Succeeded
NOTE: Running task 884 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 346 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 347 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_patch: Succeeded
NOTE: Running task 886 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 353 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 357 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 366 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 380 of 382 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1006 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata)
NOTE: Running task 1010 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1014 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_configure)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_configure: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_configure: Succeeded
NOTE: Running task 1015 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_compile)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_compile: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_compile: Succeeded
NOTE: Running task 1016 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_install)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_install: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_install: Succeeded
NOTE: Running task 1017 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_package)
NOTE: Running task 1018 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package: Succeeded
NOTE: Running task 1019 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_packagedata)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1020 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_create_spdx)
NOTE: Running task 1021 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_package_write_ipk)
NOTE: Running task 1022 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_package_write_deb)
NOTE: Running task 1023 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_package_write_rpm)
NOTE: Running task 1024 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_package_qa)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package_write_ipk: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package_write_deb: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package_qa: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1025 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_create_package_spdx)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_create_package_spdx: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_package_qa unihash changed to 76a7cf9b6345be1ee997d9bdbed5c5c8c2d8bd7e926e73552cabda624535af83
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1026 of 1026 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1026 tasks of which 1006 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.4.341.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.4.350.0-r0 to 0:1.4.341.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.341.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.4.350.0-r0 to 0:1.4.341.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.341.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.4.350.0-r0 to 0:1.4.341.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.341.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.4.350.0-r0 to 0:1.4.341.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.341.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.4.350.0-r0 to 0:1.4.341.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.341.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.4.350.0-r0 to 0:1.4.341.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.341.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.4.350.0-r0 to 0:1.4.341.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.341.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1082373594000253036==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSBhYjg4NDFkYjMwZDljYThlODg0YmQ0NWNkOGYwY2RjNjU1YzhmZTVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMjoxNToyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi12b2xrOiB1cGdyYWRlIDEuNC4zNDEuMCAtPiAxLjQuMzUwLjAKCi0tLQogLi4uL3t2dWxr
YW4tdm9sa18xLjQuMzQxLjAuYmIgPT4gdnVsa2FuLXZvbGtfMS40LjM1MC4wLmJifSAgICAgIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXZvbGtfMS40LjM0MS4wLmJi
ID0+IHZ1bGthbi12b2xrXzEuNC4zNTAuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuNC4zNDEuMC5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZvbGtfMS40LjM1MC4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2Fu
LXZvbGtfMS40LjM0MS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi12b2xrXzEuNC4zNTAuMC5iYgppbmRleCAxNDRlNDQ5NjlhLi40NTQxYjcxYTk4IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuNC4z
NDEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEu
NC4zNTAuMC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWNmY2JkZDY5ZTE1Mzk2ZTM3MWY2MzljNjlh
Y2Y0MGJmIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vemV1eC92b2xrLmdpdDticmFu
Y2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzO3RhZz12dWxrYW4tc2RrLSR7UFZ9IgotU1JDUkVWID0g
ImQ5Nzk4MTlmZDAzZGUzYTc2MDZkNmUyM2Q2ZmY0OTY4OTQyNTk5ZGEiCitTUkNSRVYgPSAiM2Nh
MzEyYTRmMzhiYWE2M2Q4MDA2YjY5MDVhYmJlZWI4OWM4MDg3ZCIKIAogUkVRVUlSRURfRElTVFJP
X0ZFQVRVUkVTID0gInZ1bGthbiIKIAotLSAKMi40Ny4xCgo=

--===============1082373594000253036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-volk: SRC_URI changed from "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-1.4.341.0" to "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-volk: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 508417 to 540197 (+6%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: FILELIST: directory renamed /usr/src/debug/vulkan-volk/1.4.341.0 -> /usr/src/debug/vulkan-volk/1.4.350.0
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 500304 to 532084 (+6%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 799428 to 800236 (+0%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.4.341.0" to "1.4.350.0"

--===============1082373594000253036==--

