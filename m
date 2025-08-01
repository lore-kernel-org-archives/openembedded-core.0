Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75328CA0EFA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.88812.1754057271307449629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nbeBL4Oa;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LLzekv9E;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019865f62300-5a1470e3-7937-4b23-8b67-25ee971234ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057286;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gnLl5ADz3x9ieEbI0K47xoT3Ok+Xf4AdXvoLhgSRzXQ=;
	b=nbeBL4OaIBfW78G2lWumPq27AZO4jNHDsk2kFi44feyOjVzd7Pq+iS3CDcAUyALj
	R24KJc0SPtQ0tWFqbd1VkoVut9NxuAOxGF2iYRG/9hdFlxr+5RiAtygzAu5YsGL66H/
	MqB8dj67C0ZoxdEcszrFX9OLjgvRDuUmVPY7rp7w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057286;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gnLl5ADz3x9ieEbI0K47xoT3Ok+Xf4AdXvoLhgSRzXQ=;
	b=LLzekv9Essfh8s+ZhO0n74LSUvJQ3Q89s9SR7Ewic+sa6dYpxjCPnd2fWE1A8pLd
	6wTMWO1HXZlI34RPfswEGc3HFaCV4jpMIY4kmxc523NkGutR5wtmFrl+eQIkZN5jfYW
	Cx0GvMwP8CMfjpko98Rf+3dzEBUqLAm3IlkMRzV8=
Content-Type: multipart/mixed; boundary="===============6721396755534855624=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.4.321.0 SUCCEEDED
Message-ID: <0101019865f62300-5a1470e3-7937-4b23-8b67-25ee971234ca-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221322

--===============6721396755534855624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-volk* to *1.4.321.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.4.313.0-1.4.321.0.patch
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
From 7aa970168af47f5220eaa739cc28ae750dd4a92d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 12:07:10 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.4.313.0 -> 1.4.321.0

---
 .../{vulkan-volk_1.4.313.0.bb => vulkan-volk_1.4.321.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.313.0.bb => vulkan-volk_1.4.321.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
index cde1be1671..17a290ed1d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "43c29e655cb8117fd9cfb65ad9cefe2d40965102"
+SRCREV = "a8da8ef3368482b0ee9b0ec0c6079a16a89c6924"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============6721396755534855624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-volk: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-volk: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 432187 to 446455 (+3%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 424073 to 438341 (+3%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 712396 to 712748 (+0%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.4.313.0" to "1.4.321.0"

--===============6721396755534855624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1934 targets, 50 skipped, 0 masked, 0 errors.
Removing 73 recipes from the core2-64 sysroot...done.
Removing 73 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-ce29578c285db72db47f9d7c98c9a47a6a611935"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ce29578c285db72db47f9d7c98c9a47a6a611935"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 120 Local 109 Mirrors 0 Missed 11 Current 191 (90% match, 96% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 225 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 251 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 753 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_recipe_qa)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 257 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 259 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 261 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vulkan-headers/1.4.313.0/temp/log.do_packagedata_setscene.2957497
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 262 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_package_setscene)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 266 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: Running task 754 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_fetch: Succeeded
NOTE: Running task 773 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_unpack)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_unpack: Succeeded
NOTE: Running task 774 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_patch)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 271 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_patch: Succeeded
NOTE: Running task 775 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 776 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 276 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 278 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 279 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 281 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 283 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 286 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 287 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 292 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 302 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 303 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 310 of 311 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 899 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_packagedata)
NOTE: Running task 900 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata: Succeeded
NOTE: Running task 914 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 915 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_configure)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_configure: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_configure: Succeeded
NOTE: Running task 916 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_compile)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_compile: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_compile: Succeeded
NOTE: Running task 917 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_install)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_install: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_install: Succeeded
NOTE: Running task 918 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_package)
NOTE: Running task 919 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_package: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_package: Succeeded
NOTE: Running task 920 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_packagedata)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_packagedata: Succeeded
NOTE: Running task 921 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_create_spdx)
NOTE: Running task 922 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_package_write_ipk)
NOTE: Running task 923 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_package_write_deb)
NOTE: Running task 924 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_package_write_rpm)
NOTE: Running task 925 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_package_qa)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_package_write_ipk: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_package_write_deb: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_package_qa: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 926 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_create_package_spdx)
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_create_package_spdx: Started
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_package_qa: Succeeded
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vulkan-volk-1.4.321.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 927 of 927 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb:do_build)
NOTE: Tasks Summary: Attempted 927 tasks of which 905 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.4.313.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.4.321.0-r0 to 0:1.4.313.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.313.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.4.321.0-r0 to 0:1.4.313.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.313.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.4.321.0-r0 to 0:1.4.313.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.313.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.4.321.0-r0 to 0:1.4.313.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.313.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.4.321.0-r0 to 0:1.4.313.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.313.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.4.321.0-r0 to 0:1.4.313.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.313.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.4.321.0-r0 to 0:1.4.313.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.313.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6721396755534855624==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.4.313.0-1.4.321.0.patch"

RnJvbSA3YWE5NzAxNjhhZjQ3ZjUyMjBlYWE3MzljYzI4YWU3NTBkZDRhOTJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMjowNzoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi12b2xrOiB1cGdyYWRlIDEuNC4zMTMuMCAtPiAxLjQuMzIxLjAKCi0tLQogLi4uL3t2dWxr
YW4tdm9sa18xLjQuMzEzLjAuYmIgPT4gdnVsa2FuLXZvbGtfMS40LjMyMS4wLmJifSAgICAgIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXZvbGtfMS40LjMxMy4wLmJi
ID0+IHZ1bGthbi12b2xrXzEuNC4zMjEuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuNC4zMTMuMC5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZvbGtfMS40LjMyMS4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2Fu
LXZvbGtfMS40LjMxMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi12b2xrXzEuNC4zMjEuMC5iYgppbmRleCBjZGUxYmUxNjcxLi4xN2EyOTBlZDFkIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuNC4z
MTMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEu
NC4zMjEuMC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWZiM2Q2ZTgwNTFhNzFlZGNhMWU1NGJjMzhk
MzVlNWFmIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vemV1eC92b2xrLmdpdDticmFu
Y2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjQzYzI5ZTY1NWNiODExN2ZkOWNm
YjY1YWQ5Y2VmZTJkNDA5NjUxMDIiCitTUkNSRVYgPSAiYThkYThlZjMzNjg0ODJiMGVlOWIwZWMw
YzYwNzlhMTZhODljNjkyNCIKIAogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gInZ1bGthbiIK
IAotLSAKMi40Ny4xCgo=

--===============6721396755534855624==--

