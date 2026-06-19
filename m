Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0ECFCDB46C
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 06:18:30 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36829.1781849908891518327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 23:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WbBta6q1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Cqbs7h4S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ede87e3d3-f28d4728-5864-439b-8811-e4995b748ed8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781849908;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=64izEx3xIQOA5YXarf7s/4h8lmkauzw5t5bIm0mqXQY=;
	b=WbBta6q1QSSZxO3pnQRAedAgDV0GdNiG0QNueNjA8mq40zyzlavyE6C+stAo9pa3
	i9p3biPgjsXpNJyeGzFAEpKmg00St/uYECKLSIYfzCVdJSVzJeUIcvD5Q6k5SZ4EGcj
	OiP8m6GeSgi6Ot+sw1G7NQKtWDzMWt69pPQ29uKw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781849908;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=64izEx3xIQOA5YXarf7s/4h8lmkauzw5t5bIm0mqXQY=;
	b=Cqbs7h4SG/M+Vr4wMmq+WBKy8+CoiiV5ZQBjKwuNmcI1y2AgE6S0s/jKGe9B2VWg
	Yrxvj0BLLkKLV2U+zLLTQQe20zy/ghbHLAMOOyAxL2HG8+fLVsIHnqUK7LXM3NgI2Vo
	T1zNBaJSx+xN9e91yQSDzEfETezf7HTQRfsX/Sww=
Content-Type: multipart/mixed; boundary="===============2641053256207975547=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-tools: upgrading to 1.4.350.1 SUCCEEDED
Message-ID: <0101019ede87e3d3-f28d4728-5864-439b-8811-e4995b748ed8-000000@us-west-2.amazonses.com>
Date: Fri, 19 Jun 2026 06:18:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.19-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 06:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239123

--===============2641053256207975547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-tools* to *1.4.350.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.4.350.0-1.4.350.1.patch
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
From dc1a57442579bd459daf776abf902d4da8e05e93 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 19 Jun 2026 06:03:09 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.4.350.0 -> 1.4.350.1

---
 .../{vulkan-tools_1.4.350.0.bb => vulkan-tools_1.4.350.1.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.350.0.bb => vulkan-tools_1.4.350.1.bb} (100%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb
-- 
2.47.1


--===============2641053256207975547==
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
DISTRO_VERSION       = "6.0.99+snapshot-527e04c0eb0ba02a4eadbf7d18b0d7e5a04f6ceb"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:527e04c0eb0ba02a4eadbf7d18b0d7e5a04f6ceb"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 348 Local 330 Mirrors 0 Missed 18 Current 231 (94% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 283 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 340 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 388 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 930 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 931 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_recipe_qa)
NOTE: Running setscene task 390 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 392 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 394 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 395 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 397 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 400 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vulkan-loader/1.4.350.0/temp/log.do_packagedata_setscene.1756138
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 406 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 409 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 414 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 932 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 425 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_fetch: Succeeded
NOTE: Running task 933 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 433 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 435 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 441 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1012 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 452 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 459 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_fetch: Succeeded
NOTE: Running task 1013 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_unpack: Succeeded
NOTE: Running task 1021 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 478 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1022 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_create_recipe_spdx)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 492 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1039 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1040 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_generate_toolchain_file)
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 496 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 504 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1068 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1079 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1080 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_generate_toolchain_file)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 533 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 537 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 540 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_deploy_source_date_epoch unihash changed to 42b422711119e79c5d96143a545c0f3e3594a87e51b7042f12c480614ceed853
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 561 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 562 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 579 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1374 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb:do_packagedata)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.4.350.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1398 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_configure)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_configure: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_configure: Succeeded
NOTE: Running task 1399 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_compile)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_compile: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_compile: Succeeded
NOTE: Running task 1400 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_install)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_install: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_install: Succeeded
NOTE: Running task 1401 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_package)
NOTE: Running task 1402 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1403 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1404 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_configure)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_configure: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_package: Succeeded
NOTE: Running task 1405 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_packagedata)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1406 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb:do_create_spdx)
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_configure: Succeeded
NOTE: Running task 1407 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_compile)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_compile: Started
NOTE: recipe vulkan-volk-1.4.350.0-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_compile: Succeeded
NOTE: Running task 1408 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_install)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_install: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_install: Succeeded
NOTE: Running task 1409 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_package)
NOTE: Running task 1410 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_populate_sysroot)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_package: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_package: Succeeded
NOTE: Running task 1411 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_packagedata)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1412 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_create_spdx)
NOTE: Running task 1413 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_package_write_ipk)
NOTE: Running task 1414 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_package_write_deb)
NOTE: Running task 1415 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_package_write_rpm)
NOTE: Running task 1416 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_package_qa)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_create_spdx: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_package_write_ipk: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_package_write_deb: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_package_qa: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1417 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_create_package_spdx)
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_create_package_spdx: Started
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_package_qa: Succeeded
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vulkan-tools-1.4.350.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1418 of 1418 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-tools_1.4.350.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1418 tasks of which 1382 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-loader-1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-loader-src went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-loader-1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-loader-dbg went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-loader-1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-loader-staticdev went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-loader-1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-loader-dev went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-loader-1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-loader-doc went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-loader-1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-loader-locale went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-loader-1.4.350.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-loader went backwards which would break package feeds (from 0:1.4.350.1-r0 to 0:1.4.350.0-r0) [version-going-backwards]
ERROR: vulkan-loader-1.4.350.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2641053256207975547==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.4.350.0-1.4.350.1.patch"

RnJvbSBkYzFhNTc0NDI1NzliZDQ1OWRhZjc3NmFiZjkwMmQ0ZGE4ZTA1ZTkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTkgSnVuIDIwMjYgMDY6MDM6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS40LjM1MC4wIC0+IDEuNC4zNTAuMQoKLS0tCiAuLi4ve3Z1
bGthbi10b29sc18xLjQuMzUwLjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuNC4zNTAuMS5iYn0gICAg
ICB8IDAKIDEgZmlsZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXRvb2xzXzEuNC4zNTAu
MC5iYiA9PiB2dWxrYW4tdG9vbHNfMS40LjM1MC4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzUwLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzUwLjEuYmIKc2lt
aWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxr
YW4vdnVsa2FuLXRvb2xzXzEuNC4zNTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4tdG9vbHNfMS40LjM1MC4xLmJiCi0tIAoyLjQ3LjEKCg==

--===============2641053256207975547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-tools: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-tools: SRC_URI changed from "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.350.0" to "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-tools: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-dbg: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-dbg: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-dev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-dev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-doc: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-doc: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-locale: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-locale: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-src: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-src: FILELIST: directory renamed /usr/src/debug/vulkan-tools/1.4.350.0/vulkaninfo/generated -> /usr/src/debug/vulkan-tools/1.4.350.1/vulkaninfo/generated, directory renamed /usr/src/debug/vulkan-tools/1.4.350.0/vulkaninfo -> /usr/src/debug/vulkan-tools/1.4.350.1/vulkaninfo
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-src: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-staticdev: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools-staticdev: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools: PV changed from "1.4.350.0" to "1.4.350.1"
packages/x86-64-v3-poky-linux/vulkan-tools/vulkan-tools: PKGV changed from 1.4.350.0 [default] to 1.4.350.1 [default]

--===============2641053256207975547==--

