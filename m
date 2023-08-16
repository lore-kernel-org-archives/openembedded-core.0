Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8B5C3DA65
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.174045.1692224351355682033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=c4/iVvHU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YpB+UBJQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a006e6996-b7a8d135-f57d-4852-aee2-1160b78ae99c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FFaqAuwxsKVSpsRtK2nT991GAjZd08ypTLMSAmtZw3U=;
	b=c4/iVvHUdeH9fSb0AIlnO7L72rLrigsf7TLUKRlzPT2XbK411j41J0rPo1IhMUlr
	hxrpTSyeeI/hYG5ysz/+1ftZP0PGNRCOZwGvDGi0jOHCysuYwVbyfsG/Rp2Hu0Z/fKD
	I01K7G7nD+JSeyyffyjNwADlPwQBeIXOIOc/aB4Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FFaqAuwxsKVSpsRtK2nT991GAjZd08ypTLMSAmtZw3U=;
	b=YpB+UBJQND8ti/+9WVenUMlACxuyGSln+rcDJlXPJiplpgHA9vYiHwNSprgSZEpF
	Jp0CTiANE82N8jogabWrqAPUX4PA+KcdDeLbcFs92+eqx4ADxilKDWByFvZY9/lpRoY
	yz7WoaD49vjREKCoycyowgsIVn5B3ZPW+vQlHkOE=
Content-Type: multipart/mixed; boundary="===============7837373909972261278=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2023.6 SUCCEEDED
Message-ID: <0101018a006e6996-b7a8d135-f57d-4852-aee2-1160b78ae99c-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186228

--===============7837373909972261278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2023.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2023.5-2023.6.patch
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
From 7d4cd75a297f889897c5abd68e5a876f9c6dc982 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 14:39:03 +0000
Subject: [PATCH] shaderc: upgrade 2023.5 -> 2023.6

---
 .../shaderc/{shaderc_2023.5.bb => shaderc_2023.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.5.bb => shaderc_2023.6.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.5.bb b/meta/recipes-graphics/shaderc/shaderc_2023.6.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2023.5.bb
rename to meta/recipes-graphics/shaderc/shaderc_2023.6.bb
index 8d2f4551ab..5afdec5ce9 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.5.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "7428c8d5f6b200910fbd32fa0ca0b0244ace6482"
+SRCREV = "9547789ecfa1be140327057e766ba80666b66e21"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.39.2


--===============7837373909972261278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 76 recipes from the core2-32 sysroot...done.
Removing 100 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:39a986c7303c7b62bf9e5a3b1156c53d4da6aad5"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 103 Local 75 Mirrors 0 Missed 28 Current 214 (72% match, 91% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 233 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 240 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 662 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 673 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 674 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 675 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_recipe_qa)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-2023.6-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 265 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Started
NOTE: Running task 714 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 715 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_fetch)
NOTE: Running task 716 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 717 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.6-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 271 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 718 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 719 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 720 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 721 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 274 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 275 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.6-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 283 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 288 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 291 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 750 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 751 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 752 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_patch: Started
NOTE: Running task 758 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 759 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 760 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: Running setscene task 304 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 305 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 761 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 762 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 781 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 782 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_patch: Succeeded
NOTE: Running task 783 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 784 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_generate_toolchain_file)
NOTE: Running task 785 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_populate_lic unihash changed to 6290b1237c2b6f227a47367fffa7f97513510e764855803b963b40f0a921c0fb
NOTE: recipe shaderc-2023.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 310 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 317 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 880 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 887 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 892 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: Running task 893 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 894 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 895 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 896 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 897 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 898 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 899 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 900 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 901 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 902 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 903 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 904 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 905 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 906 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 907 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 908 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 909 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 910 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 911 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 912 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 913 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 914 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_configure)
NOTE: recipe shaderc-2023.6-r0: task do_configure: Started
NOTE: recipe shaderc-2023.6-r0: task do_configure: Succeeded
NOTE: Running task 915 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_compile)
NOTE: recipe shaderc-2023.6-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 916 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe shaderc-2023.6-r0: task do_compile: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 916 tasks of which 864 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glslang/1.3.250.0/temp/log.do_packagedata.2818125
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============7837373909972261278==
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
meta-yocto-bsp       = "tmp-auh-upgrades:39a986c7303c7b62bf9e5a3b1156c53d4da6aad5"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 66 Local 38 Mirrors 0 Missed 28 Current 245 (57% match, 90% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 763 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 797 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 798 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 805 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_recipe_qa)
NOTE: recipe shaderc-2023.6-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 856 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 857 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe shaderc-2023.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 858 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 859 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.6-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 861 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 862 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_fetch: Succeeded
NOTE: Running task 863 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 864 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 865 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.6-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 866 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 867 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 868 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: recipe shaderc-2023.6-r0: task do_unpack: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: Running task 869 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: Running task 870 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 871 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.6-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 872 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 873 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 874 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 875 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 876 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe shaderc-2023.6-r0: task do_patch: Succeeded
NOTE: Running task 877 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 878 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_generate_toolchain_file)
NOTE: Running task 879 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 880 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 881 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.6-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.6-r0: task do_populate_lic: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_populate_lic unihash changed to 6290b1237c2b6f227a47367fffa7f97513510e764855803b963b40f0a921c0fb
NOTE: recipe shaderc-2023.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 882 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 884 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 885 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 886 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 887 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 890 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 891 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 892 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 893 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 895 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 896 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 897 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 898 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 899 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 900 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 901 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_configure)
NOTE: recipe shaderc-2023.6-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 902 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe shaderc-2023.6-r0: task do_configure: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 902 tasks of which 851 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glslang/1.3.250.0/temp/log.do_packagedata.2779545
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============7837373909972261278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/shaderc: PV changed from "2023.5" to "2023.6"
packages/core2-32-poky-linux/shaderc: PKGV changed from 2023.5 [default] to 2023.6 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PV changed from "2023.5" to "2023.6"
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2023.5 [default] to 2023.6 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dev: PV changed from "2023.5" to "2023.6"
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGV changed from 2023.5 [default] to 2023.6 [default]
packages/core2-32-poky-linux/shaderc/shaderc-doc: PV changed from "2023.5" to "2023.6"
packages/core2-32-poky-linux/shaderc/shaderc-doc: PKGV changed from 2023.5 [default] to 2023.6 [default]
packages/core2-32-poky-linux/shaderc/shaderc-locale: PV changed from "2023.5" to "2023.6"
packages/core2-32-poky-linux/shaderc/shaderc-locale: PKGV changed from 2023.5 [default] to 2023.6 [default]
packages/core2-32-poky-linux/shaderc/shaderc-src: PV changed from "2023.5" to "2023.6"
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGV changed from 2023.5 [default] to 2023.6 [default]
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PV changed from "2023.5" to "2023.6"
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 2476672 to 2476660 (-0%)
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2023.5 [default] to 2023.6 [default]
packages/core2-32-poky-linux/shaderc/shaderc: PV changed from "2023.5" to "2023.6"
packages/core2-32-poky-linux/shaderc/shaderc: PKGV changed from 2023.5 [default] to 2023.6 [default]

--===============7837373909972261278==
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
meta-yocto-bsp       = "tmp-auh-upgrades:39a986c7303c7b62bf9e5a3b1156c53d4da6aad5"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 66 Local 38 Mirrors 0 Missed 28 Current 245 (57% match, 90% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 763 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 797 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 798 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 805 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_recipe_qa)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe shaderc-2023.6-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 856 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 857 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 858 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 859 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.6-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_fetch: Succeeded
NOTE: Running task 861 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 862 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 863 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 865 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.6-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 866 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 867 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 868 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: recipe shaderc-2023.6-r0: task do_unpack: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: Running task 869 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 870 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 871 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: Running task 872 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 873 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.6-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 874 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 875 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 876 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 877 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 878 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_patch: Succeeded
NOTE: Running task 879 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 880 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_generate_toolchain_file)
NOTE: Running task 881 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_populate_lic)
NOTE: recipe shaderc-2023.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.6-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 882 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe shaderc-2023.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_populate_lic unihash changed to 6290b1237c2b6f227a47367fffa7f97513510e764855803b963b40f0a921c0fb
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe shaderc-2023.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 884 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 885 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 886 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 887 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 890 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 891 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 892 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 893 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 895 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 896 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 897 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 898 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 899 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 900 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 901 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_configure)
NOTE: recipe shaderc-2023.6-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 902 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe shaderc-2023.6-r0: task do_configure: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 902 tasks of which 851 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glslang/1.3.250.0/temp/log.do_packagedata.2754115
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============7837373909972261278==
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
meta-yocto-bsp       = "tmp-auh-upgrades:39a986c7303c7b62bf9e5a3b1156c53d4da6aad5"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 66 Local 38 Mirrors 0 Missed 28 Current 245 (57% match, 90% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 763 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 797 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 798 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 805 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_recipe_qa)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe shaderc-2023.6-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 856 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 857 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: recipe shaderc-2023.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 858 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_fetch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 859 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 861 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.6-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: Running task 862 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 863 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.6-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_unpack)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 865 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.6-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 866 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 867 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2023.6-r0: task do_unpack: Succeeded
NOTE: Running task 868 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_patch)
NOTE: recipe shaderc-2023.6-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 869 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 870 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 872 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 873 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.6-r0: task do_patch: Succeeded
NOTE: Running task 874 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 875 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_generate_toolchain_file)
NOTE: Running task 876 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 877 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 878 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_generate_toolchain_file: Started
NOTE: Running task 879 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 880 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.6-r0: task do_populate_lic: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 881 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_populate_lic: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_populate_lic unihash changed to 6290b1237c2b6f227a47367fffa7f97513510e764855803b963b40f0a921c0fb
NOTE: recipe shaderc-2023.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 882 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 884 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 885 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 886 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 887 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 890 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 891 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 892 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 893 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 895 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 896 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 897 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 898 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 898 tasks of which 851 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glslang/1.3.250.0/temp/log.do_packagedata.2693096
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============7837373909972261278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1807 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:39a986c7303c7b62bf9e5a3b1156c53d4da6aad5"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 66 Local 38 Mirrors 0 Missed 28 Current 245 (57% match, 90% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 763 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 797 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 798 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 805 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_recipe_qa)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe shaderc-2023.6-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 856 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 857 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 858 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 859 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.6-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 861 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 862 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 863 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.6-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 865 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_unpack)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.6-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 866 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 867 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2023.6-r0: task do_unpack: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: Running task 868 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 869 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 870 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 872 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 873 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 874 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 875 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 876 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 877 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 878 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.6-r0: task do_patch: Succeeded
NOTE: Running task 879 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 880 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_generate_toolchain_file)
NOTE: Running task 881 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.6-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 882 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe shaderc-2023.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.6.bb:do_populate_lic unihash changed to 6290b1237c2b6f227a47367fffa7f97513510e764855803b963b40f0a921c0fb
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe shaderc-2023.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 884 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 885 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 886 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 887 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 890 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 891 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 892 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 893 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 895 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 896 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 897 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 897 tasks of which 851 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.250.0/temp/log.do_packagedata.2619488
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============7837373909972261278==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2023.5-2023.6.patch"

RnJvbSA3ZDRjZDc1YTI5N2Y4ODk4OTdjNWFiZDY4ZTVhODc2ZjljNmRjOTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMTQ6Mzk6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjMuNSAtPiAyMDIzLjYKCi0tLQogLi4uL3NoYWRlcmMve3NoYWRl
cmNfMjAyMy41LmJiID0+IHNoYWRlcmNfMjAyMy42LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMve3NoYWRlcmNfMjAyMy41LmJiID0+IHNoYWRlcmNfMjAy
My42LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJj
L3NoYWRlcmNfMjAyMy41LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVy
Y18yMDIzLjYuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDIzLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyMy42LmJiCmluZGV4IDhkMmY0NTUxYWIuLjVh
ZmRlYzVjZTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRl
cmNfMjAyMy41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNf
MjAyMy42LmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20v
Z29vZ2xlL3NoYWRlcmMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIK
IAotU1JDUkVWID0gIjc0MjhjOGQ1ZjZiMjAwOTEwZmJkMzJmYTBjYTBiMDI0NGFjZTY0ODIiCitT
UkNSRVYgPSAiOTU0Nzc4OWVjZmExYmUxNDAzMjcwNTdlNzY2YmE4MDY2NmI2NmUyMSIKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYy5naXQ7cHJvdG9jb2w9aHR0cHM7
YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxk
aW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAy
LWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCBc
Ci0tIAoyLjM5LjIKCg==

--===============7837373909972261278==--

