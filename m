Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60C5C27C6D
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:11 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.174033.1692224344600870144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XVGJEVAc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=O/SfE1Eh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a006e6abe-d6332948-1116-4278-a507-dfb008b0ee3f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z1QVGraPj2jpziJ8Ups5eBpoXhZ1FRmDcDVNnzRSPkg=;
	b=XVGJEVAcZ4dgWPWRFvYK8SR0pmXjSdw9V29g9zANTWonqvk+PiiAsZP2t6JqHWxt
	K7QcdvcsloQFIkWsDEMXnLgXA4EHXifR6Q64nXO7WdrXLk2yPVvT6lEjV9qgHmXV/Yy
	bfuBdV3aq4j4ZWUuUEmBe5sByU2NmnmJTTz4ivxk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z1QVGraPj2jpziJ8Ups5eBpoXhZ1FRmDcDVNnzRSPkg=;
	b=O/SfE1EhYQxWGEbDR2hsyDlutEIZZaZFWiPaee7gOvDLExWs3eCjrmiOLkULPOaW
	q45mI+iDv0hqf0/heXZd5DM2p77ZXxcsBg4xRteEiNSeo5k4CR0WuWhBdRjxb2R+18E
	C3B0blD7EKPVcdMcnVgfurAhHN1P77xLzPUgVUeQ=
Content-Type: multipart/mixed; boundary="===============2515648581383600713=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <0101018a006e6abe-d6332948-1116-4278-a507-dfb008b0ee3f-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186227

--===============2515648581383600713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-validation-layers* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-validation-layers-upgrade-1.3.250.0-1.3.250.1.patch
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
From 99909c966743e569e07da95e55db1d14616da7ab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 15:55:39 +0000
Subject: [PATCH] vulkan-validation-layers: upgrade 1.3.250.0 -> 1.3.250.1

---
 ...ayers_1.3.250.0.bb => vulkan-validation-layers_1.3.250.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.250.0.bb => vulkan-validation-layers_1.3.250.1.bb} (97%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb
similarity index 97%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb
index 62c6343c45..e15a6fb299 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8df9e8826734226d08cb412babfa599c"
 SRC_URI = "git://git@github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.250;protocol=https \
            file://0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch \
            "
-SRCREV = "1541e00a63cd125f15d231d5a8059ebe66503b25"
+SRCREV = "d6c1e5a5a6229b52c20c643ff626a948d4850865"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============2515648581383600713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 40 recipes from the core2-32 sysroot...done.
Removing 40 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:49449478bdd5e30364ed37a6a345cded987bff86"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 298 Local 285 Mirrors 0 Missed 13 Current 272 (95% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 277 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 278 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 283 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 288 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 318 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 321 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: Running task 893 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_recipe_qa)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 326 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 342 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 349 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 900 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 352 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running task 907 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 367 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 375 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 378 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 380 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 384 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 385 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 390 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 392 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 399 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 941 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 401 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 402 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 942 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 970 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 423 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 427 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 431 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 434 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 454 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 461 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 981 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 982 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 983 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 465 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 478 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 487 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 491 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 492 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 498 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 990 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to 9f70df985dc28b88172569b5fab2bb890ed648c35689424349610a34cebef300
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 505 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 511 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1057 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 516 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 524 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 534 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 555 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 563 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1527 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata)
NOTE: Running task 1533 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1576 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: Running task 1578 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1580 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Tasks Summary: Attempted 1580 tasks of which 1564 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-lesspipe went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/spirv-tools/1.3.250.0/temp/log.do_packagedata.538150
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============2515648581383600713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:49449478bdd5e30364ed37a6a345cded987bff86"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 65 Mirrors 0 Missed 13 Current 492 (83% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 522 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1453 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_recipe_qa)
NOTE: Running task 1560 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_create_spdx)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1561 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1563 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 570 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1565 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1566 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1567 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1568 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1569 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to 9f70df985dc28b88172569b5fab2bb890ed648c35689424349610a34cebef300
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1578 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata)
NOTE: Running task 1580 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1581 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 1581 tasks of which 1568 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-lesspipe went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/spirv-tools/1.3.250.0/temp/log.do_packagedata.526641
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============2515648581383600713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-validation-layers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PKGSIZE changed from 279552640 to 279589164 (+0%)
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PKGSIZE changed from 24854449 to 24857238 (+0%)
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PV changed from "1.3.250.0" to "1.3.250.1"

--===============2515648581383600713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:49449478bdd5e30364ed37a6a345cded987bff86"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 65 Mirrors 0 Missed 13 Current 492 (83% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 522 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 527 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1453 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_recipe_qa)
NOTE: Running task 1559 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1561 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1563 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 570 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1564 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1565 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1566 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1568 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to 9f70df985dc28b88172569b5fab2bb890ed648c35689424349610a34cebef300
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1569 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1578 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata)
NOTE: Running task 1580 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1581 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 1581 tasks of which 1568 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-lesspipe went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/spirv-tools/1.3.250.0/temp/log.do_packagedata.524309
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============2515648581383600713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:49449478bdd5e30364ed37a6a345cded987bff86"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 63 Mirrors 0 Missed 15 Current 492 (80% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 522 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 570 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1453 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_recipe_qa)
NOTE: Running task 1559 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1562 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1563 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1564 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: Running task 1565 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1566 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1567 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: Running task 1568 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1572 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1574 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1575 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to 9f70df985dc28b88172569b5fab2bb890ed648c35689424349610a34cebef300
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1576 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1577 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1578 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 1579 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1580 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1581 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_compile)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1583 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1583 tasks of which 1560 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-lesspipe went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/spirv-tools/1.3.250.0/temp/log.do_packagedata.519924
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============2515648581383600713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:49449478bdd5e30364ed37a6a345cded987bff86"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 63 Mirrors 0 Missed 15 Current 492 (80% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 522 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 570 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1402 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 1455 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_recipe_qa)
NOTE: Running task 1562 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1563 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1564 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1565 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1566 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1567 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: Running task 1568 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1572 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1574 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1575 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to 9f70df985dc28b88172569b5fab2bb890ed648c35689424349610a34cebef300
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1576 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1577 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1578 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 1579 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1580 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1581 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_compile)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1583 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1583 tasks of which 1560 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-lesspipe went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.3.250.0/temp/log.do_packagedata.511936
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============2515648581383600713==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-validation-layers-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSA5OTkwOWM5NjY3NDNlNTY5ZTA3ZGE5NWU1NWRiMWQxNDYxNmRhN2FiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMTU6NTU6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdmFsaWRhdGlvbi1sYXllcnM6IHVwZ3JhZGUgMS4zLjI1MC4wIC0+IDEuMy4yNTAuMQoK
LS0tCiAuLi5heWVyc18xLjMuMjUwLjAuYmIgPT4gdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEu
My4yNTAuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdmFs
aWRhdGlvbi1sYXllcnNfMS4zLjI1MC4wLmJiID0+IHZ1bGthbi12YWxpZGF0aW9uLWxheWVyc18x
LjMuMjUwLjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI1MC4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI1MC4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxr
YW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuMy4yNTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI1MC4x
LmJiCmluZGV4IDYyYzYzNDNjNDUuLmUxNWE2ZmIyOTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuMy4yNTAuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVy
c18xLjMuMjUwLjEuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRS50eHQ7bWQ1PThkZjllODgyNjczNDIyNmQwOGNiNDEyYmFiZmE1OTljIgogU1JD
X1VSSSA9ICJnaXQ6Ly9naXRAZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVZhbGlkYXRp
b25MYXllcnMuZ2l0O2JyYW5jaD1zZGstMS4zLjI1MDtwcm90b2NvbD1odHRwcyBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLXNjcmlwdHMtQ01ha2VMaXN0cy50eHQtYXBwZW5kLXRvLUNNQUtFX0ZJ
TkRfUk9PVF9QQVQucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiMTU0MWUwMGE2M2Nk
MTI1ZjE1ZDIzMWQ1YTgwNTllYmU2NjUwM2IyNSIKK1NSQ1JFViA9ICJkNmMxZTVhNWE2MjI5YjUy
YzIwYzY0M2ZmNjI2YTk0OGQ0ODUwODY1IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoy
LjM5LjIKCg==

--===============2515648581383600713==--

