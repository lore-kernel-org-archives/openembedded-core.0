Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4493C2FC18
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:29:03 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.17724.1690907332812394231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Qq5cFIEz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NSEmnwqt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010189b1ee4e06-a7d01681-0c7c-4824-b7ed-53063d75f818-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wwAITfKs6QVLJqu0RTHkf3Y9R4AyDx38zAIRfNo1Kz4=;
	b=Qq5cFIEziKGWeCEuqmaWTXgmqQ7pfPQDAb22NbhBgVQ1OKr16ddME+/rHYzaly1D
	EMNbBvFzUHZ1Vh/PzibGAanfpZ5zH6Dm727jaDb31E+gi56iKL4z2Eiz5AOyuS5qc9J
	kuDb9MbCXMS1ZnrxvhqrQTkUnZpkcpXVSo+gVq8I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wwAITfKs6QVLJqu0RTHkf3Y9R4AyDx38zAIRfNo1Kz4=;
	b=NSEmnwqt+RaERJOmiUpLCJ6dnVw7zvTeZs34WsNy9hvNhwk7HoREah1c/GktJeX6
	WhdG3pcg/W+wxnWbRRMopTP7YgnPqrjRIZuZkGPIJU9i5wXy4qQ6Nhe6/dQ45rWtoJ3
	rhb8XPThCNxxn5FUqpd0nIjMoWlwPprTm2lPcyFw=
Content-Type: multipart/mixed; boundary="===============0855828262830398875=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <01010189b1ee4e06-a7d01681-0c7c-4824-b7ed-53063d75f818-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185334

--===============0855828262830398875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.250.0-1.3.250.1.patch
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
From 690ee3f26e9f8f04f51a42641e096af05c855a54 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 14:42:01 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.250.0 -> 1.3.250.1

---
 .../{vulkan-tools_1.3.250.0.bb => vulkan-tools_1.3.250.1.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.250.0.bb => vulkan-tools_1.3.250.1.bb} (100%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb
-- 
2.39.2


--===============0855828262830398875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1806 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:57a1383bedbbc1530cb5317301e815de91451bee"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 16 Mirrors 0 Missed 40 Current 496 (28% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1323 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa)
NOTE: Running task 1324 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa)
NOTE: Running task 1336 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 1345 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa)
NOTE: Running task 1371 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 1401 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_recipe_qa)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1464 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1465 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1466 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1467 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 1468 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1469 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1470 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1471 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 1472 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1473 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 1474 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 1475 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1476 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1477 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1478 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1480 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 1481 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: Running task 1482 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1483 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1484 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1485 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1486 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 1487 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1488 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1489 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1490 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1491 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Started
NOTE: Running task 1492 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1493 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1494 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1495 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1496 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1497 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1498 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1499 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1500 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic unihash changed to 7ac7288ba7b7af782071b92f6d92b3174a822c4e88423a59661a65546160804e
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1502 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 1504 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1505 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1505 tasks of which 1457 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vulkan-headers/1.3.250.0-r0/temp/log.do_packagedata.1910319
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============0855828262830398875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-tools: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]

--===============0855828262830398875==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSA2OTBlZTNmMjZlOWY4ZjA0ZjUxYTQyNjQxZTA5NmFmMDVjODU1YTU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAxNDo0MjowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi10b29sczogdXBncmFkZSAxLjMuMjUwLjAgLT4gMS4zLjI1MC4xCgotLS0KIC4uLi97dnVs
a2FuLXRvb2xzXzEuMy4yNTAuMC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI1MC4xLmJifSAgICAg
IHwgMAogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdG9vbHNfMS4zLjI1MC4w
LmJiID0+IHZ1bGthbi10b29sc18xLjMuMjUwLjEuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNTAuMC5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNTAuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS4zLjI1MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjUwLjEuYmIKLS0gCjIuMzkuMgoK

--===============0855828262830398875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1806 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:57a1383bedbbc1530cb5317301e815de91451bee"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 16 Mirrors 0 Missed 40 Current 496 (28% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1323 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa)
NOTE: Running task 1324 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa)
NOTE: Running task 1336 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 1345 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa)
NOTE: Running task 1371 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 1401 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_recipe_qa)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1464 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1465 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 1466 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_fetch)
NOTE: Running task 1467 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1468 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1469 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1470 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 1471 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 1472 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Started
NOTE: Running task 1473 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1474 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1475 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_unpack)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1476 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1477 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 1478 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1480 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 1482 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: Running task 1483 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1484 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1485 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1486 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1487 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_patch)
NOTE: Running task 1488 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Started
NOTE: Running task 1489 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 1490 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Started
NOTE: Running task 1491 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1492 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1493 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_patch: Started
NOTE: Running task 1494 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1495 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1496 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1497 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1498 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1499 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic unihash changed to 7ac7288ba7b7af782071b92f6d92b3174a822c4e88423a59661a65546160804e
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1500 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1502 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 1504 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1505 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1505 tasks of which 1457 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vulkan-headers/1.3.250.0-r0/temp/log.do_packagedata.1889495
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============0855828262830398875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1806 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:57a1383bedbbc1530cb5317301e815de91451bee"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 16 Mirrors 0 Missed 40 Current 496 (28% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1323 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa)
NOTE: Running task 1324 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa)
NOTE: Running task 1336 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 1345 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa)
NOTE: Running task 1371 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 1401 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_recipe_qa)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1464 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1465 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1466 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 1467 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1468 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1469 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1470 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 1471 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1472 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1473 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 1474 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1475 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 1476 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1477 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: Running task 1478 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 1480 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 1481 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1482 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1483 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1484 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: Running task 1485 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1486 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1487 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1488 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1489 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 1490 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1491 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1492 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1493 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1494 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1495 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1496 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1497 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1498 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1499 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic unihash changed to 7ac7288ba7b7af782071b92f6d92b3174a822c4e88423a59661a65546160804e
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1500 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1502 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 1504 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1505 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1505 tasks of which 1457 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vulkan-headers/1.3.250.0-r0/temp/log.do_packagedata.1871933
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============0855828262830398875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:57a1383bedbbc1530cb5317301e815de91451bee"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 11 Mirrors 0 Missed 40 Current 501 (21% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1323 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa)
NOTE: Running task 1324 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa)
NOTE: Running task 1336 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 1345 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa)
NOTE: Running task 1371 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 1401 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_recipe_qa)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1464 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1465 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1466 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 1467 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_fetch)
NOTE: Running task 1468 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1469 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1470 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 1471 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1472 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 1473 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1474 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: Running task 1475 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 1476 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1477 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1478 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Started
NOTE: Running task 1480 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: Running task 1482 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1483 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1484 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1485 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: Running task 1486 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1487 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1488 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1489 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 1490 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Started
NOTE: Running task 1491 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Started
NOTE: Running task 1492 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1493 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1494 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1495 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1496 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1497 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1498 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1499 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1500 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic unihash changed to 7ac7288ba7b7af782071b92f6d92b3174a822c4e88423a59661a65546160804e
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1502 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 1504 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1505 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1505 tasks of which 1457 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-headers/1.3.250.0-r0/temp/log.do_packagedata.1843213
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============0855828262830398875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1806 targets, 48 skipped, 0 masked, 0 errors.
Removing 39 recipes from the core2-32 sysroot...done.
Removing 46 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:57a1383bedbbc1530cb5317301e815de91451bee"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 260 Local 160 Mirrors 0 Missed 100 Current 292 (61% match, 81% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 316 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 320 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 390 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa)
NOTE: Running task 391 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa)
NOTE: Running task 395 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: Running task 396 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa)
NOTE: Running task 397 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa)
NOTE: Running task 398 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa)
NOTE: Running task 399 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa)
NOTE: Running task 400 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa)
NOTE: Running task 401 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa)
NOTE: Running task 406 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa)
NOTE: Running task 409 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa)
NOTE: Running task 411 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 413 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa)
NOTE: Running task 414 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa)
NOTE: Running task 415 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 416 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa)
NOTE: Running task 417 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 418 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_recipe_qa)
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa: Started
NOTE: Running setscene task 405 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 419 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 419 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 420 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 421 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running task 422 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 423 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 424 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_fetch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 425 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa: Succeeded
NOTE: Running task 426 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 427 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 428 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 429 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 430 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: Running task 431 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 432 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_fetch)
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 433 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 434 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 435 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 436 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: Running setscene task 421 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: Running setscene task 424 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 425 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 437 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 438 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 439 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_unpack)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 427 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 433 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 446 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 453 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 901 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: Running task 904 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_patch)
NOTE: Running task 924 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 925 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: Running task 926 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 927 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: Running task 928 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: Running task 929 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_unpack)
NOTE: Running task 936 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: Running task 940 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 966 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 967 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 972 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 973 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 984 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 473 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_recipe_qa_setscene)
NOTE: Running task 985 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_patch)
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 478 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 483 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 484 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: Running setscene task 489 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 491 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Started
NOTE: Running setscene task 493 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: Running setscene task 496 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_unpack: Started
NOTE: Running setscene task 498 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_patch: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 997 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 998 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 999 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1000 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1016 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1022 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1023 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_patch)
NOTE: Running task 1024 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1031 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1042 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1048 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 1049 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 1050 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1051 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1052 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1053 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: Running task 1059 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: Running task 1060 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1061 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1067 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1068 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: Running setscene task 505 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: Running task 1074 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1075 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: Running task 1076 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1077 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1079 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: Running task 1080 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1081 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1082 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 509 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic unihash changed to 7ac7288ba7b7af782071b92f6d92b3174a822c4e88423a59661a65546160804e
NOTE: recipe xtrans-1_1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 511 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Succeeded
NOTE: Running task 1093 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 520 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 533 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 542 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 543 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 547 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1312 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1313 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1328 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1329 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1336 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1349 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_collect_spdx_deps)
NOTE: Running task 1350 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_collect_spdx_deps)
NOTE: Running task 1353 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1376 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_collect_spdx_deps)
NOTE: Running task 1377 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_collect_spdx_deps)
NOTE: recipe util-macros-1_1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1408 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1409 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1410 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1411 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe util-macros-1_1.20.0-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1412 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_configure)
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1413 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_configure)
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1414 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_configure)
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_configure: Started
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1415 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_configure)
NOTE: recipe wayland-1.22.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1416 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1417 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_install: Started
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Succeeded
NOTE: Running task 1418 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_compile)
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1419 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 1420 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package: Started
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Succeeded
NOTE: Running task 1421 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_install)
NOTE: recipe xorgproto-2023.2-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1422 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_compile)
NOTE: recipe util-macros-1_1.20.0-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_compile: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 1423 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_install)
NOTE: Running task 1424 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe xorgproto-2023.2-r0: task do_install: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1425 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_compile)
NOTE: Running task 1426 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot)
NOTE: Running task 1427 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package)
NOTE: recipe wayland-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_install: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Started
NOTE: recipe wayland-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1428 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_compile)
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1429 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_install)
NOTE: recipe wayland-1.22.0-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_install: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Started
NOTE: Running task 1430 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1431 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_package)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1432 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1433 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1434 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1435 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1436 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1437 of 1548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe xtrans-1_1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_package: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1437 tasks of which 1311 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vulkan-headers/1.3.250.0-r0/temp/log.do_packagedata.1928812
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============0855828262830398875==--

