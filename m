Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C96C76186
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.30363.1675272857911058861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gubMSmhO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101860e0b2597-edfaacc7-bbac-4c15-a85a-ed4e975a4c89-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nA01CB+HW7FDoCguUAeScfwRxsNdTHYMdemojc9JbDU=;
	b=gubMSmhOHxekzZzu+agS2jj6Wth/QSc4P7LsuoM18PqVGqxVEgZPw2me2tLxAzUy
	BI3DJ1TePNpFq43grEYGxr77MsD6/NRGG8bYPX1L4Vy9j8xMcHPGfWjWeGbggtRLRxT
	2vi54oCNAA4z55gZQAxCEdfOR+03QRzCrvd3dCWk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nA01CB+HW7FDoCguUAeScfwRxsNdTHYMdemojc9JbDU=;
	b=WCZSce2JyrpMcuC/LKl1y9ZlwQptLtVNdINiFerq4w2uSpIFXdD/y7iLPirnRRl6
	5+rPOQg5zHVpHkas5ng1OOf14vdeejJbIQ2L6dOYrkhOZd0VHddDG+iff9aaO+Sb+H7
	f08SHCbNrHK1me8h0EaljMwfm8c48G0C9G/k6yFQ=
Content-Type: multipart/mixed; boundary="===============8199249409084525701=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2023.2 SUCCEEDED
Message-ID: <010101860e0b2597-edfaacc7-bbac-4c15-a85a-ed4e975a4c89-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176626

--===============8199249409084525701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2023.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2022.4-2023.2.patch
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
--===============8199249409084525701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 75 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3f93933313228e1407b1d9f3142cd1eaf337e02e"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 3 Mirrors 0 Missed 19 Current 150 (13% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 616 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_fetch)
NOTE: Running task 648 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_fetch)
NOTE: Running task 649 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_fetch)
NOTE: Running task 654 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.2-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_fetch: Succeeded
NOTE: Running task 655 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_unpack)
NOTE: Running task 656 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 657 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_unpack)
NOTE: Running task 658 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_unpack)
NOTE: Running task 659 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_unpack)
NOTE: Running task 660 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.2-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 661 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_patch)
NOTE: recipe shaderc-2023.2-r0: task do_unpack: Succeeded
NOTE: Running task 662 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_patch)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.2-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 663 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 664 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 665 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 666 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 667 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 668 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.2-r0: task do_patch: Succeeded
NOTE: Running task 669 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 670 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_generate_toolchain_file)
NOTE: Running task 671 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 672 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.2-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 673 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 674 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_populate_lic unihash changed to a105c2d8ff4c67a5c892072b053f14a3f0d842cf53b3a3945b4d804b0121a5b7
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 675 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 676 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 677 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_install)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 678 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 679 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 680 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 681 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 682 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 683 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_packagedata: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 684 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 685 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_install)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 686 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 687 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_package)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 688 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 689 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 690 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_package)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 691 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 691 tasks of which 650 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glslang/1_1.3.236.0-r0/temp/log.do_packagedata.106959
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata) failed with exit code '1'

--===============8199249409084525701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1698 targets, 52 skipped, 0 masked, 0 errors.
Removing 8 recipes from the core2-32 sysroot...done.
Removing 8 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3f93933313228e1407b1d9f3142cd1eaf337e02e"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 34 Mirrors 0 Missed 19 Current 124 (64% match, 89% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 141 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 144 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 550 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_fetch)
NOTE: Running task 569 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_fetch)
NOTE: Running task 570 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_fetch)
NOTE: Running task 571 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 572 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_unpack)
NOTE: recipe shaderc-2023.2-r0: task do_fetch: Succeeded
NOTE: Running task 573 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_unpack)
NOTE: Running task 574 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_unpack)
NOTE: Running task 575 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 150 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 152 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 154 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 577 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_patch)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 155 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe shaderc-2023.2-r0: task do_unpack: Succeeded
NOTE: Running task 579 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-2023.2-r0: task do_patch: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 158 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 159 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 160 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 580 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_patch)
NOTE: Running task 581 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 582 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 583 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 161 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 162 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 589 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: recipe shaderc-2023.2-r0: task do_patch: Succeeded
NOTE: Running task 590 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 591 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 592 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_generate_toolchain_file)
NOTE: Running task 593 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.2-r0: task do_populate_lic: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 594 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 595 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 170 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_populate_lic unihash changed to a105c2d8ff4c67a5c892072b053f14a3f0d842cf53b3a3945b4d804b0121a5b7
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 174 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 175 of 177 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 680 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 685 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 686 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 687 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 688 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 689 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 690 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 691 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 692 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 693 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 694 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 695 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 696 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_packagedata: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 697 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_install)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 698 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 699 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_package)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 700 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 701 of 714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 701 tasks of which 662 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glslang/1_1.3.236.0-r0/temp/log.do_packagedata.114251
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata) failed with exit code '1'

--===============8199249409084525701==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2022.4-2023.2.patch"

RnJvbSBmNWZlOWZhZGE5ZTYzYzJjNjA3NGUwMzk2OTcwZWRkYzE2NjNmMDEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNTo0MTo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyMi40IC0+IDIwMjMuMgoKLS0tCiAuLi4vc2hhZGVyYy97c2hhZGVy
Y18yMDIyLjQuYmIgPT4gc2hhZGVyY18yMDIzLjIuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy97c2hhZGVyY18yMDIyLjQuYmIgPT4gc2hhZGVyY18yMDIz
LjIuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMv
c2hhZGVyY18yMDIyLjQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJj
XzIwMjMuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjIuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDIzLjIuYmIKaW5kZXggMGZlNjg4N2NiYy4uMDdm
YWUwYmI3ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVy
Y18yMDIyLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18y
MDIzLjIuYmIKQEAgLTYsNyArNiw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9n
b29nbGUvc2hhZGVyYyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3Igog
Ci1TUkNSRVYgPSAiMDY3ZTAwOGM4MGMzMjNiMWNkMWFiMWU1NDdiMzhmOWE1ZjUyMjY5ZSIKK1NS
Q1JFViA9ICI1NWY0YmJkOTkzZGUzYTNjYWQzNGNiNDFjZDA3YjgyZmExYzc3ZGQ2IgogU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjLmdpdDtwcm90b2NvbD1odHRwczti
cmFuY2g9bWFpbiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRp
bmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDIt
bGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIFwK
LS0gCjIuMzcuMwoK

--===============8199249409084525701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3f93933313228e1407b1d9f3142cd1eaf337e02e"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 3 Mirrors 0 Missed 19 Current 150 (13% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 616 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_fetch)
NOTE: Running task 648 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_fetch)
NOTE: Running task 649 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_fetch)
NOTE: Running task 654 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.2-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 655 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_unpack)
NOTE: Running task 656 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_unpack)
NOTE: Running task 657 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_fetch: Succeeded
NOTE: Running task 658 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_unpack)
NOTE: Running task 659 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 660 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.2-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 661 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_patch)
NOTE: recipe shaderc-2023.2-r0: task do_unpack: Succeeded
NOTE: Running task 662 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_patch)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.2-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 663 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 664 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 665 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 666 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 667 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: recipe shaderc-2023.2-r0: task do_patch: Succeeded
NOTE: Running task 668 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 669 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 670 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_generate_toolchain_file)
NOTE: Running task 671 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 672 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.2-r0: task do_populate_lic: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 673 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 674 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe shaderc-2023.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_populate_lic unihash changed to a105c2d8ff4c67a5c892072b053f14a3f0d842cf53b3a3945b4d804b0121a5b7
NOTE: recipe glslang-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 675 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 676 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 677 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_install)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 678 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 679 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 680 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 681 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 682 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 683 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 684 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_packagedata: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 685 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_install)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 686 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 687 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_package)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 688 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 688 tasks of which 650 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glslang/1_1.3.236.0-r0/temp/log.do_packagedata.95268
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata) failed with exit code '1'

--===============8199249409084525701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/shaderc: PV changed from "2022.4" to "2023.2"
packages/core2-32-poky-linux/shaderc: PKGV changed from 2022.4 [default] to 2023.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PV changed from "2022.4" to "2023.2"
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2022.4 [default] to 2023.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dev: PV changed from "2022.4" to "2023.2"
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGV changed from 2022.4 [default] to 2023.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-doc: PV changed from "2022.4" to "2023.2"
packages/core2-32-poky-linux/shaderc/shaderc-doc: PKGV changed from 2022.4 [default] to 2023.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-locale: PV changed from "2022.4" to "2023.2"
packages/core2-32-poky-linux/shaderc/shaderc-locale: PKGV changed from 2022.4 [default] to 2023.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 319411 to 319425 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-src: PV changed from "2022.4" to "2023.2"
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGV changed from 2022.4 [default] to 2023.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 2498946 to 2498950 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PV changed from "2022.4" to "2023.2"
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2022.4 [default] to 2023.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc: PV changed from "2022.4" to "2023.2"
packages/core2-32-poky-linux/shaderc/shaderc: PKGV changed from 2022.4 [default] to 2023.2 [default]

--===============8199249409084525701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1699 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3f93933313228e1407b1d9f3142cd1eaf337e02e"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 3 Mirrors 0 Missed 19 Current 150 (13% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 616 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_fetch)
NOTE: Running task 648 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_fetch)
NOTE: Running task 649 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_fetch)
NOTE: Running task 654 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.2-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_fetch: Succeeded
NOTE: Running task 655 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_unpack)
NOTE: Running task 656 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_unpack)
NOTE: Running task 657 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 658 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_unpack)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 659 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_unpack)
NOTE: Running task 660 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.2-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 661 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_patch)
NOTE: recipe shaderc-2023.2-r0: task do_unpack: Succeeded
NOTE: Running task 662 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_patch)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.2-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 663 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 664 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 665 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_patch: Succeeded
NOTE: Running task 666 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 667 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 668 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 669 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_generate_toolchain_file)
NOTE: Running task 670 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 671 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 672 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.2-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_populate_lic unihash changed to a105c2d8ff4c67a5c892072b053f14a3f0d842cf53b3a3945b4d804b0121a5b7
NOTE: recipe shaderc-2023.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 673 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 674 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 675 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 676 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 677 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_install)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 678 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 679 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 680 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 681 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 682 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 683 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_packagedata: Started
NOTE: Running task 684 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_packagedata: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 685 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_install)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 686 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 687 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_package)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 688 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 689 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 689 tasks of which 650 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1_1.3.236.0-r0/temp/log.do_packagedata.90077
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata) failed with exit code '1'

--===============8199249409084525701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3f93933313228e1407b1d9f3142cd1eaf337e02e"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 3 Mirrors 0 Missed 19 Current 150 (13% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 616 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_fetch)
NOTE: Running task 648 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_fetch)
NOTE: Running task 649 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_fetch)
NOTE: Running task 654 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.2-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 655 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_unpack)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 656 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.2-r0: task do_fetch: Succeeded
NOTE: Running task 657 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_unpack)
NOTE: Running task 658 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_unpack)
NOTE: Running task 659 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 660 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.2-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 661 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_patch)
NOTE: recipe shaderc-2023.2-r0: task do_unpack: Succeeded
NOTE: Running task 662 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_patch)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe shaderc-2023.2-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 663 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 664 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 665 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 666 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_patch: Succeeded
NOTE: Running task 667 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 668 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 669 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 670 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_generate_toolchain_file)
NOTE: Running task 671 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 672 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.2-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 673 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 674 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2023.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_populate_lic unihash changed to a105c2d8ff4c67a5c892072b053f14a3f0d842cf53b3a3945b4d804b0121a5b7
NOTE: recipe glslang-1_1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 675 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 676 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 677 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_install)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 678 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 679 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 680 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 681 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 682 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 683 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 684 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.236.0-r0: task do_packagedata: Succeeded
NOTE: recipe glslang-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 685 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_install)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 686 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 687 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_package)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 688 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 689 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 690 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb:do_package)
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 691 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.236.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.236.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 691 tasks of which 650 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.239.0-r0 to 1:1.3.236.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.236.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glslang/1_1.3.236.0-r0/temp/log.do_packagedata.100568
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb:do_packagedata) failed with exit code '1'

--===============8199249409084525701==--

