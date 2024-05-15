Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458ABC27C7B
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1274.1715794337841958544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GdHlsA5G;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PgtudpUV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018f7d4fe3b5-c9ccc53f-69c0-4b1e-851b-0a72e08d7bd0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wa0DuOWeF/S2/5EAE5mYiuf0XtwLYhZnCCSqd0ZlPiE=;
	b=GdHlsA5GwxKKsZwT9oUuQ9YxC9pTyKu32YPdkUIRxLLSPCLkmNi0xOxPy/Aah3bN
	AvnXrmDvNiWFizGFyctQIeIAe115Vx65hF+3hVuOlCEbk6qpCIf8tDU+WsaElh83LGw
	Ay2PPsWzl/9j87IF4qz4TL+FrQauTNrjAsJBeHkA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wa0DuOWeF/S2/5EAE5mYiuf0XtwLYhZnCCSqd0ZlPiE=;
	b=PgtudpUVyGRS6HcG1KCpikmSeMHXkcHy8JzpYfGq+zek92A4o7gsY48igK+Zh/6A
	OoAEfrywkPjOxWYp4/1rIrExJk9zKGFIELvmaeaDvxpEg4OHROOJJ6/2Q8tvqsMHsNP
	Wtra5UF3wwiI4IBBhzJbnoiaVGm3nV5jEUAcCTKI=
Content-Type: multipart/mixed; boundary="===============3100330033705826796=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2024.1 SUCCEEDED
Message-ID: <0101018f7d4fe3b5-c9ccc53f-69c0-4b1e-851b-0a72e08d7bd0-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199364

--===============3100330033705826796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2024.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2024.0-2024.1.patch
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
From 16f51c3a4ba440d5dce1bacefdc81170f035560a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 13:58:09 +0000
Subject: [PATCH] shaderc: upgrade 2024.0 -> 2024.1

---
 .../0001-cmake-disable-building-external-dependencies.patch     | 2 +-
 .../0002-libshaderc_util-fix-glslang-header-file-location.patch | 2 +-
 .../shaderc/{shaderc_2024.0.bb => shaderc_2024.1.bb}            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.0.bb => shaderc_2024.1.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 5c49aa7fd5..0f5d34fc33 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 941f5f5831e7a52c26168f81f25d0470860ca6f1 Mon Sep 17 00:00:00 2001
+From c4c0cf5cef1ba2c1054d1c77fb4da00417a0d131 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 39f982b7f3..2480cc9a08 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From f5a3bb0b37c26f3bc6abb17ada594d93ac7d1ff0 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
diff --git a/meta/recipes-graphics/shaderc/shaderc_2024.0.bb b/meta/recipes-graphics/shaderc/shaderc_2024.1.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2024.0.bb
rename to meta/recipes-graphics/shaderc/shaderc_2024.1.bb
index 9975c608ac..1f0b12ef57 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2024.0.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2024.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "9f56ca620c07d6c4d119c65c1c1f3f1c584c9985"
+SRCREV = "5d7736da11e626b49c5463aadb2afb228ad20276"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.44.0


--===============3100330033705826796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1880 targets, 46 skipped, 0 masked, 0 errors.
Removing 59 recipes from the core2-64 sysroot...done.
Removing 98 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-1069d6c2a3c56cae635e7aab0b472454995c3efe"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1069d6c2a3c56cae635e7aab0b472454995c3efe"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 145 Local 134 Mirrors 0 Missed 11 Current 189 (92% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 197 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 206 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 208 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-1_1.3.280.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.280.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shaderc-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 708 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_fetch)
NOTE: recipe glslang-1_1.3.280.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 268 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb:do_create_spdx_setscene)
NOTE: recipe shaderc-2024.1-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.280.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glslang-1_1.3.280.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.280.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.3.280.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 270 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb:do_create_spdx_setscene)
NOTE: recipe shaderc-2024.1-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/glslang/1.3.280.0/temp/log.do_packagedata_setscene.2302663
NOTE: Running task 709 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_unpack)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 271 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb:do_package_setscene)
NOTE: recipe spirv-headers-1_1.3.280.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shaderc-2024.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.280.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 272 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 274 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shaderc-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 710 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shaderc-2024.1-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 278 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.280.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shaderc-2024.1-r0: task do_patch: Succeeded
NOTE: Running task 794 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 795 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_generate_toolchain_file)
NOTE: Running task 800 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_populate_lic)
NOTE: recipe shaderc-2024.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2024.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2024.1-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2024.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.280.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 283 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 284 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.3.280.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.280.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glslang-1_1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glslang-1_1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.280.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.3.280.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.3.280.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.3.280.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-2024.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_deploy_source_date_epoch unihash changed to cc3d011e1d6a6d22d6218c2393a666e2934673f0472e605774ccc988a878d8b0
NOTE: recipe shaderc-2024.1-r0: task do_populate_lic: Succeeded
NOTE: recipe spirv-headers-1_1.3.280.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.280.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_populate_lic unihash changed to ec52745596f99f67c3d1d214cbeef70c9759e479ff6299a3fef44f4f086cf4c5
NOTE: Running setscene task 292 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 297 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 300 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 310 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 323 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 324 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 329 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 956 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb:do_packagedata)
NOTE: Running task 962 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glslang-1_1.3.280.0-r0: task do_packagedata: Started
NOTE: recipe shaderc-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 968 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_configure)
NOTE: recipe glslang-1_1.3.280.0-r0: task do_packagedata: Succeeded
NOTE: Running task 970 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2024.1-r0: task do_configure: Started
NOTE: recipe shaderc-2024.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2024.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shaderc-2024.1-r0: task do_configure: Succeeded
NOTE: Running task 971 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_compile)
NOTE: recipe shaderc-2024.1-r0: task do_compile: Started
NOTE: recipe shaderc-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 972 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_install)
NOTE: recipe shaderc-2024.1-r0: task do_install: Started
NOTE: recipe shaderc-2024.1-r0: task do_install: Succeeded
NOTE: Running task 973 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_package)
NOTE: Running task 974 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_populate_sysroot)
NOTE: recipe shaderc-2024.1-r0: task do_populate_sysroot: Started
NOTE: recipe shaderc-2024.1-r0: task do_package: Started
NOTE: recipe shaderc-2024.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_populate_sysroot unihash changed to 1aea5e907b34476dd55368d175f6679e0a2b6444482d937aaf4e3e38987cee19
NOTE: recipe shaderc-2024.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_package unihash changed to 1d64a3433d5644595766d9286d3f969b068310d384f0681707a487d33e9f53fa
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_packagedata became valid
NOTE: Running setscene task 334 of 334 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_packagedata_setscene)
NOTE: recipe shaderc-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shaderc-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 976 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_create_spdx)
NOTE: Running task 977 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_package_write_ipk)
NOTE: Running task 978 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_package_write_deb)
NOTE: Running task 979 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_package_write_rpm)
NOTE: Running task 980 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_package_qa)
NOTE: recipe shaderc-2024.1-r0: task do_create_spdx: Started
NOTE: recipe shaderc-2024.1-r0: task do_package_write_ipk: Started
NOTE: recipe shaderc-2024.1-r0: task do_package_write_deb: Started
NOTE: recipe shaderc-2024.1-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2024.1-r0: task do_package_qa: Started
NOTE: recipe shaderc-2024.1-r0: task do_package_qa: Succeeded
NOTE: recipe shaderc-2024.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_package_qa unihash changed to 0cc4113da53d16ab5be595c83c33357927792d6bcce0a311582242f8ffd8e859
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_package_write_ipk unihash changed to f5cab10a870a2cc2eb5e9104bb61843868b60b81293bfe6052bd7874a6384033
NOTE: recipe shaderc-2024.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 981 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_create_runtime_spdx)
NOTE: recipe shaderc-2024.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe shaderc-2024.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe shaderc-2024.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_package_write_deb unihash changed to bf644f84b69871356bdb620b7b8b00d6be0a285b9776b29c6d17b399b22dcd53
NOTE: recipe shaderc-2024.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_package_write_rpm unihash changed to 190218c6b520928c8f372b4662a144c356ba7ad69698218799b5dc03772fd283
NOTE: Running noexec task 982 of 982 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_build)
NOTE: Tasks Summary: Attempted 982 tasks of which 961 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.283.0-r0 to 1:1.3.280.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.283.0-r0 to 1:1.3.280.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.283.0-r0 to 1:1.3.280.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.283.0-r0 to 1:1.3.280.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.283.0-r0 to 1:1.3.280.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.283.0-r0 to 1:1.3.280.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.280.0-r0 do_packagedata_setscene: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.283.0-r0 to 1:1.3.280.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.280.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3100330033705826796==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2024.0-2024.1.patch"

RnJvbSAxNmY1MWMzYTRiYTQ0MGQ1ZGNlMWJhY2VmZGM4MTE3MGYwMzU1NjBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTM6NTg6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjQuMCAtPiAyMDI0LjEKCi0tLQogLi4uLzAwMDEtY21ha2UtZGlz
YWJsZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggICAgIHwgMiArLQogLi4u
LzAwMDItbGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBh
dGNoIHwgMiArLQogLi4uL3NoYWRlcmMve3NoYWRlcmNfMjAyNC4wLmJiID0+IHNoYWRlcmNfMjAy
NC4xLmJifSAgICAgICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMv
e3NoYWRlcmNfMjAyNC4wLmJiID0+IHNoYWRlcmNfMjAyNC4xLmJifSAoOTUlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJs
ZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9maWxlcy8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmctZXh0ZXJuYWwt
ZGVwZW5kZW5jaWVzLnBhdGNoCmluZGV4IDVjNDlhYTdmZDUuLjBmNWQzNGZjMzMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDEtY21ha2UtZGlzYWJs
ZS1idWlsZGluZy1leHRlcm5hbC1kZXBlbmRlbmNpZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxkaW5nLWV4dGVy
bmFsLWRlcGVuZGVuY2llcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTQxZjVmNTgzMWU3
YTUyYzI2MTY4ZjgxZjI1ZDA0NzA4NjBjYTZmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gYzRjMGNmNWNlZjFiYTJjMTA1NGQxYzc3ZmI0ZGEwMDQxN2EwZDEzMSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29t
PgogRGF0ZTogU2F0LCAxMyBGZWIgMjAyMSAwMDo0NTo1NiArMDAwMAogU3ViamVjdDogW1BBVENI
XSBjbWFrZTogZGlzYWJsZSBidWlsZGluZyBleHRlcm5hbCBkZXBlbmRlbmNpZXMKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL2ZpbGVzLzAwMDItbGlic2hhZGVyY191
dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwtZml4LWdsc2xhbmct
aGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKaW5kZXggMzlmOTgyYjdmMy4uMjQ4MGNjOWEwOCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJz
aGFkZXJjX3V0aWwtZml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvZmlsZXMvMDAwMi1saWJzaGFkZXJjX3V0aWwt
Zml4LWdsc2xhbmctaGVhZGVyLWZpbGUtbG9jYXRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGVjMjQ0Mjk0MGUxZDUzMzg5NzE4NjFiYjgxNTM3YmFlM2E2YzE5ZTIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGY1YTNiYjBiMzdjMjZmM2JjNmFiYjE3YWRhNTk0ZDkzYWM3ZDFm
ZjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxxdWFyZXNt
YS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTMgRmViIDIwMjEgMDA6NDU6NTYgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gbGlic2hhZGVyY191dGlsOiBmaXggZ2xzbGFuZyBoZWFkZXIgZmls
ZSBsb2NhdGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hh
ZGVyY18yMDI0LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIw
MjQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI0LjEuYmIKaW5kZXggOTk3NWM2MDhhYy4uMWYwYjEy
ZWY1NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18y
MDI0LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDI0
LjEuYmIKQEAgLTYsNyArNiw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9nb29n
bGUvc2hhZGVyYyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgogCi1T
UkNSRVYgPSAiOWY1NmNhNjIwYzA3ZDZjNGQxMTljNjVjMWMxZjNmMWM1ODRjOTk4NSIKK1NSQ1JF
ViA9ICI1ZDc3MzZkYTExZTYyNmI0OWM1NDYzYWFkYjJhZmIyMjhhZDIwMjc2IgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWFpbiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRpbmct
ZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItbGli
c2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIFwKLS0g
CjIuNDQuMAoK

--===============3100330033705826796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shaderc: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dbg: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-dev: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-dev: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-doc: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-doc: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-locale: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-locale: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-src: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-src: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 3722944 to 3722960 (+0%)
packages/core2-64-poky-linux/shaderc/shaderc-staticdev: PV changed from "2024.0" to "2024.1"
packages/core2-64-poky-linux/shaderc/shaderc: PKGV changed from 2024.0 [default] to 2024.1 [default]
packages/core2-64-poky-linux/shaderc/shaderc: PV changed from "2024.0" to "2024.1"

--===============3100330033705826796==--

