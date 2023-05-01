Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED92CCA9EAF
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.107420.1682976349540063757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Fx2ZCwc0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010187d9352bdd-548d9a5e-77c1-4d7b-91bd-ee58f3393c82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RzUCyt6r91spu8lOcJn7PJOprtMuvEFxTVnantyINAQ=;
	b=Fx2ZCwc0DFVuW6UxmepJ0dqWg3MUVyNZoAqvE6gVx6Xf30kqTARZWFHiysuk75nm
	ZTVF42B232aWXnRTSzrCZyvIhfLt6iiA2iUkkDURmtE97zxgVo2jRyJsikYtRgkk2mi
	CRgzvLUvjpBCIAaQV4Mr9VtaV/ngU/tn5L/nrFCk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RzUCyt6r91spu8lOcJn7PJOprtMuvEFxTVnantyINAQ=;
	b=Hwx/ei9THzcziRZTjitHRZ7DGTv/pBB4vht6QPPGeKRxlIHnh0jfgelMUA3OzsZo
	ZjzjOqToA7y0hIQ/irLlj5W5tiZ3Wuc92hbhtTUU3f3V9/isrA+8+LMWc131qhJaBMl
	lCmODFm37EmAhigZXk2lEphUexLL77mH8mI0dCEs=
Content-Type: multipart/mixed; boundary="===============4529796012521098184=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cryptodev-module: upgrading to 1.13 SUCCEEDED
Message-ID: <01010187d9352bdd-548d9a5e-77c1-4d7b-91bd-ee58f3393c82-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180686

--===============4529796012521098184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cryptodev-module* to *1.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cryptodev-module-upgrade-1.12-1.13.patch
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
--===============4529796012521098184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:feabbd78d759f3b6746b41b2886464f47a7f9676"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 9 Mirrors 0 Missed 18 Current 148 (33% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 471 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_validate_branches)
NOTE: Running task 641 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 654 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 655 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 678 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 679 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_validate_branches: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 680 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 681 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 682 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 683 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 684 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 685 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_validate_branches: Succeeded
NOTE: Running task 686 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_metadata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 687 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_kernel_metadata: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 688 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 689 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: Running task 690 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 691 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 692 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 693 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 5e775ec1831f7481a97446374daeb312ee602e56938c3a8ff10636e7d0550a9f
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 694 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 695 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 696 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 697 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: Running task 698 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_patch)
NOTE: Running task 699 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_version_sanity_check)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_patch: Succeeded
NOTE: Running task 700 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configme)
NOTE: Running task 701 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_kernel_configme: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_0b80e90b38-r0: task do_kernel_configme: Succeeded
NOTE: Tasks Summary: Attempted 701 tasks of which 673 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-src went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-dbg went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-staticdev went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-dev went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-doc went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-locale went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/cryptodev-linux/1.12-r0/temp/log.do_packagedata.2916945
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============4529796012521098184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:feabbd78d759f3b6746b41b2886464f47a7f9676"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 9 Mirrors 0 Missed 18 Current 148 (33% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 471 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_validate_branches)
NOTE: Running task 641 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 654 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 655 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 678 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 679 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_validate_branches: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 680 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 681 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 682 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: Running task 683 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 684 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 685 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_validate_branches: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: Running task 686 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_metadata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 687 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_kernel_metadata: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 688 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 689 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 690 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 691 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 692 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 693 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 5e775ec1831f7481a97446374daeb312ee602e56938c3a8ff10636e7d0550a9f
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 694 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 695 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 696 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 697 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 698 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_patch)
NOTE: Running task 699 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_version_sanity_check)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_db61d7fe35-r0: task do_patch: Succeeded
NOTE: Tasks Summary: Attempted 699 tasks of which 673 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-src went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-dbg went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-staticdev went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-dev went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-doc went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-locale went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/cryptodev-linux/1.12-r0/temp/log.do_packagedata.2931375
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============4529796012521098184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PKGSIZE changed from 9848 to 9914 (+1%)
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dbg: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dbg: PKGSIZE changed from 20632 to 20656 (+0%)
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dbg: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dev: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-doc: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-doc: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-locale: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-locale: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-src: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-src: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-staticdev: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-staticdev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/kernel-module-cryptodev-6.1.25-yocto-standard: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/kernel-module-cryptodev-6.1.25-yocto-standard: PKGSIZE changed from 52636 to 53108 (+1%)
packages/qemux86-poky-linux/cryptodev-module/kernel-module-cryptodev-6.1.25-yocto-standard: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module: PKGV changed from 1.12 [default] to 1.13 [default]

--===============4529796012521098184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 5 recipes from the core2-32 sysroot...done.
Removing 9 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:feabbd78d759f3b6746b41b2886464f47a7f9676"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 55 Local 37 Mirrors 0 Missed 18 Current 125 (67% match, 90% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 132 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 136 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 140 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 480 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_validate_branches)
NOTE: Running task 573 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 574 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 575 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 585 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_validate_branches: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 586 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 587 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: Running task 588 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 153 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 598 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 155 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 157 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 600 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 158 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_validate_branches: Succeeded
NOTE: Running task 602 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_metadata)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 161 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 162 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 163 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 603 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_metadata: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 604 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 164 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 165 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 610 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 611 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 173 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 5e775ec1831f7481a97446374daeb312ee602e56938c3a8ff10636e7d0550a9f
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 177 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 178 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 685 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 697 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 702 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 703 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 704 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 705 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 706 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_patch)
NOTE: Running task 707 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_version_sanity_check)
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 708 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 709 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_patch: Succeeded
NOTE: Running task 710 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configme)
NOTE: Running task 711 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_configme: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 712 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 713 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_configme: Succeeded
NOTE: Tasks Summary: Attempted 713 tasks of which 684 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-src went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-dbg went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-staticdev went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-dev went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-doc went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-locale went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/cryptodev-linux/1.12-r0/temp/log.do_packagedata.2944117
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============4529796012521098184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:feabbd78d759f3b6746b41b2886464f47a7f9676"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 9 Mirrors 0 Missed 18 Current 148 (33% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 471 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_validate_branches)
NOTE: Running task 641 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 654 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 655 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 678 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 679 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_validate_branches: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 680 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 681 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 682 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 683 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 684 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 685 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_validate_branches: Succeeded
NOTE: Running task 686 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_metadata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 687 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_metadata: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 688 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 689 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 690 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 691 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 692 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 693 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 5e775ec1831f7481a97446374daeb312ee602e56938c3a8ff10636e7d0550a9f
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 694 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 695 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 696 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 697 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 698 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_patch)
NOTE: Running task 699 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_version_sanity_check)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_patch: Succeeded
NOTE: Tasks Summary: Attempted 699 tasks of which 673 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-src went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-dbg went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-staticdev went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-dev went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-doc went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-locale went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/cryptodev-linux/1.12-r0/temp/log.do_packagedata.2936368
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============4529796012521098184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (896 cached, 3 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:feabbd78d759f3b6746b41b2886464f47a7f9676"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 8 Mirrors 0 Missed 18 Current 149 (30% match, 89% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 497 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_validate_branches)
NOTE: Running task 641 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 654 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 655 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 678 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 679 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_validate_branches: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 680 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 681 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 682 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: Running task 683 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 684 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 685 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_validate_branches: Succeeded
NOTE: Running task 686 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_metadata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 687 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_metadata: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 688 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 689 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 690 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 691 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 692 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 693 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 5e775ec1831f7481a97446374daeb312ee602e56938c3a8ff10636e7d0550a9f
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 694 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 695 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 696 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 697 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 698 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_patch)
NOTE: Running task 699 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_version_sanity_check)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-6.1.25+gitAUTOINC+36901b5b29_581dc1aa2f-r0: task do_patch: Succeeded
NOTE: Tasks Summary: Attempted 699 tasks of which 673 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-src went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-dbg went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-staticdev went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-dev went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-doc went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux-locale went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: QA Issue: Package version for package cryptodev-linux went backwards which would break package feeds (from 0:1.13-r0 to 0:1.12-r0) [version-going-backwards]
ERROR: cryptodev-linux-1.12-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cryptodev-linux/1.12-r0/temp/log.do_packagedata.2911780
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============4529796012521098184==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cryptodev-module-upgrade-1.12-1.13.patch"

RnJvbSA3NGVjMTU3ZGNmMDljZmQwOTg0ZmM5OTQwYTAyOGUwZGJhM2U3YmNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxOToxNToyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
eXB0b2Rldi1tb2R1bGU6IHVwZ3JhZGUgMS4xMiAtPiAxLjEzCgotLS0KIC4uLnB0b2Rldi1tb2R1
bGVfMS4xMi5iYiA9PiBjcnlwdG9kZXYtbW9kdWxlXzEuMTMuYmJ9IHwgIDAKIG1ldGEvcmVjaXBl
cy1rZXJuZWwvY3J5cHRvZGV2L2NyeXB0b2Rldi5pbmMgICAgICAgICAgIHwgIDIgKy0KIC4uLmlu
c3RhbGxpbmctaGVhZGVyLWZpbGUtcHJvdmlkZWQtYnktYW5vdGhlci1wLnBhdGNoIHwgMTEgKysr
KysrLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L3tjcnlwdG9kZXYtbW9kdWxl
XzEuMTIuYmIgPT4gY3J5cHRvZGV2LW1vZHVsZV8xLjEzLmJifSAoMTAwJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYtbW9kdWxlXzEuMTIuYmIg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYtbW9kdWxlXzEuMTMuYmIK
c2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvY3J5
cHRvZGV2L2NyeXB0b2Rldi1tb2R1bGVfMS4xMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtl
cm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LW1vZHVsZV8xLjEzLmJiCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYuaW5jIGIvbWV0YS9yZWNpcGVzLWtl
cm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LmluYwppbmRleCBlZjM0MmExNTdjLi42MWM2ODhmMWQw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L2NyeXB0b2Rldi5pbmMKQEAgLTEw
LDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVl
NGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNv
bS9jcnlwdG9kZXYtbGludXgvY3J5cHRvZGV2LWxpbnV4O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9
aHR0cHMgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiZTBjMjVlMjg5ZDZiYWYxZDgzYzJiOWNi
NTIzZDNiYzIzN2QwYzBjOSIKK1NSQ1JFViA9ICI3OTVmNWZkYTE0ODVkNDQ3Y2RiYWQzNDJlODMw
NGJlMzE3ZDRmN2U4IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9maWxlcy8wMDAxLURpc2FibGUtaW5zdGFsbGluZy1o
ZWFkZXItZmlsZS1wcm92aWRlZC1ieS1hbm90aGVyLXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2Vy
bmVsL2NyeXB0b2Rldi9maWxlcy8wMDAxLURpc2FibGUtaW5zdGFsbGluZy1oZWFkZXItZmlsZS1w
cm92aWRlZC1ieS1hbm90aGVyLXAucGF0Y2gKaW5kZXggODg1YjU4MjNlNC4uNTMyNzdjMzJiMSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvZmlsZXMvMDAwMS1EaXNh
YmxlLWluc3RhbGxpbmctaGVhZGVyLWZpbGUtcHJvdmlkZWQtYnktYW5vdGhlci1wLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L2ZpbGVzLzAwMDEtRGlzYWJsZS1pbnN0
YWxsaW5nLWhlYWRlci1maWxlLXByb3ZpZGVkLWJ5LWFub3RoZXItcC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gOGE4ODRmNTViZDE1MjdiYWE4MmZhYjY4YzE4NmJhNTQ2MjczODYwYyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjY5ZThkNDI2MzhhODJmMTAyN2VhMjI1ZjdhNjM4
MjhlODBhZTE4YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERlbnlzIERteXRyaXll
bmtvIDxkZW55c0B0aS5jb20+CiBEYXRlOiBTdW4sIDYgQXByIDIwMTQgMTk6NTE6MzkgLTA0MDAK
IFN1YmplY3Q6IFtQQVRDSF0gRGlzYWJsZSBpbnN0YWxsaW5nIGhlYWRlciBmaWxlIHByb3ZpZGVk
IGJ5IGFub3RoZXIgcGFja2FnZQpAQCAtNiwxOSArNiwyMCBAQCBTdWJqZWN0OiBbUEFUQ0hdIERp
c2FibGUgaW5zdGFsbGluZyBoZWFkZXIgZmlsZSBwcm92aWRlZCBieSBhbm90aGVyIHBhY2thZ2UK
IFNpZ25lZC1vZmYtYnk6IERlbnlzIERteXRyaXllbmtvIDxkZW55c0B0aS5jb20+CiAKIFVwc3Ry
ZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbIE9FIHNwZWNpZmljIF0KKwogLS0tCiAgTWFrZWZp
bGUgfCAxIC0KICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
TWFrZWZpbGUgYi9NYWtlZmlsZQotaW5kZXggNWEwODBlMC4uYmYwMjM5NiAxMDA2NDQKK2luZGV4
IGQ4M2FlZTYuLmM4ZDhhZTUgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZQogKysrIGIvTWFrZWZpbGUK
LUBAIC0zMyw3ICszMyw2IEBAIGluc3RhbGw6IG1vZHVsZXNfaW5zdGFsbAorQEAgLTM2LDcgKzM2
LDYgQEAgaW5zdGFsbDogbW9kdWxlc19pbnN0YWxsCiAgCiAgbW9kdWxlc19pbnN0YWxsOgogIAkk
KE1BS0UpICQoS0VSTkVMX01BS0VfT1BUUykgbW9kdWxlc19pbnN0YWxsCiAtCWluc3RhbGwgLW0g
NjQ0IC1EIGNyeXB0by9jcnlwdG9kZXYuaCAkKERFU1RESVIpLyQoaW5jbHVkZWRpcikvY3J5cHRv
L2NyeXB0b2Rldi5oCiAgCi0gY2xlYW46Ci0gCSQoTUFLRSkgJChLRVJORUxfTUFLRV9PUFRTKSBj
bGVhbgorIGluc3RhbGxfdGVzdHM6IHRlc3RzCisgCSQoTUFLRSkgLUMgdGVzdHMgaW5zdGFsbCBE
RVNURElSPSQoUFJFRklYKQotLSAKMi4zOS4yCgo=

--===============4529796012521098184==--

