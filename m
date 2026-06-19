Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A5ACD98F6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 06:18:41 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36832.1781849911843972510
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 23:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JH5lxv3l;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iI7J/Ab+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ede87ee95-97483992-5a65-4a51-8638-4327380a5791-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781849911;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4SptAi+pSVqr6m29FwNsy/Wga1lGxVgJjWWUDhKFUP0=;
	b=JH5lxv3lzrBvWnKalIi/GBV2LAC/cA1JVuqFhN0gGRaTnsFM1SUwDcjFRc9XpEbZ
	rxvAhF0IH4t8WUMzmIyLD9ZTnXzRmRKEd+tr3CTgM4RA5mZcBAWosRdOgfHRbIMNF1c
	Muhd6exCYQEKKn1Pb+METtV8uyoLFtYzz4iOwix0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781849911;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4SptAi+pSVqr6m29FwNsy/Wga1lGxVgJjWWUDhKFUP0=;
	b=iI7J/Ab+6pRFr1rXFLdQ9mFZ24JEB0t7Z+AND9RB/1Hg6+BdXJwoygBGH3+0PDx/
	vLa/xGMNOFrYE33A7vtnmRZaiZHq+1Zplaso6gTH6hQnx216CDzTDyy72DKm7CXCcH6
	3LIAiopBLZjJriMgXmpl4DiOSkL8WMH+vFejRVmw=
Content-Type: multipart/mixed; boundary="===============5558377461749971847=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.4.350.1 SUCCEEDED
Message-ID: <0101019ede87ee95-97483992-5a65-4a51-8638-4327380a5791-000000@us-west-2.amazonses.com>
Date: Fri, 19 Jun 2026 06:18:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.19-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 06:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239129

--===============5558377461749971847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-validation-layers* to *1.4.350.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-validation-layers-upgrade-1.4.350.0-1.4.350.1.patch
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
From 7515d1f1f50921abc98e68c43e75fc5ec60444db Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 19 Jun 2026 06:13:10 +0000
Subject: [PATCH] vulkan-validation-layers: upgrade 1.4.350.0 -> 1.4.350.1

---
 ...-layers_1.4.350.0.bb => vulkan-validation-layers_1.4.350.1.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.350.0.bb => vulkan-validation-layers_1.4.350.1.bb} (100%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb
-- 
2.47.1


--===============5558377461749971847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-21044a77494815cad35709db3b85fe1f77dad258"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:21044a77494815cad35709db3b85fe1f77dad258"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 369 Local 344 Mirrors 0 Missed 25 Current 231 (93% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 306 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 372 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 376 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: Running task 899 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_recipe_qa)
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe glslang-1_1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 931 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_fetch)
NOTE: Running task 932 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb:do_recipe_qa)
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 398 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 399 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 400 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 404 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 406 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_packagedata_setscene)
NOTE: recipe glslang-1_1.4.350.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 933 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_fetch)
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 408 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 411 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 414 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 415 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_recipe_qa: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/spirv-tools/1.4.350.0/temp/log.do_packagedata_setscene.1780055
NOTE: Running setscene task 420 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_packagedata_setscene)
NOTE: Running task 934 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb:do_fetch)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 423 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.4.350.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 436 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 443 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: Running task 935 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_unpack)
NOTE: Running task 936 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_unpack)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 937 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.4.350.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 447 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 455 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 467 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 481 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 483 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 485 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 491 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 493 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 505 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 510 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 517 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_unpack: Succeeded
NOTE: Running task 987 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1068 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_create_recipe_spdx)
NOTE: Running task 1069 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_create_recipe_spdx)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe glslang-1_1.4.350.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1080 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1081 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_generate_toolchain_file)
NOTE: recipe glslang-1_1.4.350.0-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1082 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_patch)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.4.350.0-r0: task do_patch: Started
NOTE: Running task 1088 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glslang-1_1.4.350.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1094 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb:do_create_recipe_spdx)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 547 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 549 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_patch: Started
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe glslang-1_1.4.350.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1095 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1096 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_patch: Succeeded
NOTE: Running task 1097 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1098 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.1.bb:do_generate_toolchain_file)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glslang-1_1.4.350.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.4.350.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 556 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.4.350.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_package_setscene: Succeeded
NOTE: recipe glslang-1_1.4.350.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 561 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 564 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_deploy_source_date_epoch unihash changed to 065666cff0f62ce6b2fc2f2b64753cdcd29ba438d1318e21deb41e51bd017d1e
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-validation-layers-1.4.350.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 598 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 600 of 600 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1406 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_packagedata)
NOTE: Running task 1409 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1410 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.4.350.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1436 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_configure)
NOTE: recipe glslang-1_1.4.350.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1437 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_configure)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.4.350.0-r0: task do_configure: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_configure: Succeeded
NOTE: Running task 1438 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_compile)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.4.350.0-r0: task do_configure: Succeeded
NOTE: Running task 1439 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb:do_compile)
NOTE: recipe glslang-1_1.4.350.0-r0: task do_compile: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_compile: Succeeded
NOTE: Running task 1440 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_install)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_install: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_install: Succeeded
NOTE: Running task 1441 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_package)
NOTE: Running task 1442 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_package: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_package: Succeeded
NOTE: Running task 1443 of 1463 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_packagedata)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_packagedata: Failed
NOTE: recipe glslang-1_1.4.350.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1443 tasks of which 1412 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260619061207.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260619061207.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vulkan-utility-libraries/1.4.350.0/temp/log.do_packagedata.1784526
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: spirv-tools-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-tools-src went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-tools-dbg went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-tools-staticdev went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-tools-dev went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-tools-doc went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-tools-locale went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-tools-bin went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package spirv-tools went backwards which would break package feeds (from 1:1.4.350.1-r0 to 1:1.4.350.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.4.350.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vulkan-utility-libraries-1.4.350.0-r0 do_packagedata: QA Issue: Package version for package vulkan-utility-libraries-src went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-utility-libraries-1.4.350.0-r0 do_packagedata: QA Issue: Package version for package vulkan-utility-libraries-dbg went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-utility-libraries-1.4.350.0-r0 do_packagedata: QA Issue: Package version for package vulkan-utility-libraries-staticdev went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-utility-libraries-1.4.350.0-r0 do_packagedata: QA Issue: Package version for package vulkan-utility-libraries-dev went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-utility-libraries-1.4.350.0-r0 do_packagedata: QA Issue: Package version for package vulkan-utility-libraries-doc went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-utility-libraries-1.4.350.0-r0 do_packagedata: QA Issue: Package version for package vulkan-utility-libraries-locale went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-utility-libraries-1.4.350.0-r0 do_packagedata: QA Issue: Package version for package vulkan-utility-libraries went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-utility-libraries-1.4.350.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vulkan-utility-libraries/1.4.350.0/temp/log.do_packagedata.1784526
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_packagedata) failed with exit code '1'

--===============5558377461749971847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-validation-layers: SRC_URI changed from "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.350;protocol=https;tag=vulkan-sdk-1.4.350.0" to "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.350;protocol=https;tag=vulkan-sdk-1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: FILELIST: directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/drawdispatch -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/drawdispatch, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/vulkan/generated -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/vulkan/generated, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/external -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/external, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/object_tracker -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/object_tracker, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/thread_tracker -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/thread_tracker, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpuav/reso
 urces -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/gpuav/resources, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpu_dump -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/gpu_dump, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/chassis -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/chassis, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpuav/core -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/gpuav/core, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/error_message -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/error_message, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpuav/debug_printf -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/gpuav/debug_printf, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpuav/debug_descriptor -> /usr/src/de
 bug/vulkan-validation-layers/1.4.350.1/layers/gpuav/debug_descriptor, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/best_practices -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/best_practices, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpuav/spirv -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/gpuav/spirv, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/utils -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/utils, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/external/vma -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/external/vma, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpuav/shaders/setup -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/gpuav/shaders/setup, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/containers -> /usr/src/debug/vulkan-vali
 dation-layers/1.4.350.1/layers/containers, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpuav/validation_cmd -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/gpuav/validation_cmd, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpuav/instrumentation -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/gpuav/instrumentation, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/sync -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/sync, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/legacy -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/legacy, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpuav/descriptor_validation -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/gpuav/descriptor_validation, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers -> /usr/src/debug/vulkan-validati
 on-layers/1.4.350.1/layers, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/stateless -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/stateless, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/state_tracker -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/state_tracker, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/core_checks -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/core_checks, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpuav/shaders/validation_cmd -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/gpuav/shaders/validation_cmd, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.350.0/layers/gpuav/shaders -> /usr/src/debug/vulkan-validation-layers/1.4.350.1/layers/gpuav/shaders
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]

--===============5558377461749971847==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-validation-layers-upgrade-1.4.350.0-1.4.350.1.patch"

RnJvbSA3NTE1ZDFmMWY1MDkyMWFiYzk4ZTY4YzQzZTc1ZmM1ZWM2MDQ0NGRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTkgSnVuIDIwMjYgMDY6MTM6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdmFsaWRhdGlvbi1sYXllcnM6IHVwZ3JhZGUgMS40LjM1MC4wIC0+IDEuNC4zNTAuMQoK
LS0tCiAuLi4tbGF5ZXJzXzEuNC4zNTAuMC5iYiA9PiB2dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNf
MS40LjM1MC4xLmJifSB8IDAKIDEgZmlsZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXZh
bGlkYXRpb24tbGF5ZXJzXzEuNC4zNTAuMC5iYiA9PiB2dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNf
MS40LjM1MC4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
dnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjQuMzUwLjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjQuMzUwLjEuYmIK
c2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92
dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuNC4zNTAuMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS40LjM1
MC4xLmJiCi0tIAoyLjQ3LjEKCg==

--===============5558377461749971847==--

