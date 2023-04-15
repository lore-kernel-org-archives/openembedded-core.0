Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7371C77B79
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.13540.1681581687651346494
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mlVGlnV+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018786143ec2-37f78bc3-6a93-427c-acb6-1ff855da6a55-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KYa6qF0Ovk6Utx+pKs2F1ARLHbOYZNDgKCUvNK38pn0=;
	b=mlVGlnV+3APJBn1MDLYgMrJgWtscA/HskZyeLhnA90+mQ18iYKJaMIExde6/q9iS
	bs5NG6Kdyp8IctpMvZrmsy7SyNGrAYgmkRFhIzQvJfqOFlFFd11ZKSDh0gMt+XXT2hn
	rgTQtXJDQqMOqdEehNP/FArgz+D9U8npMC9lTTrg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KYa6qF0Ovk6Utx+pKs2F1ARLHbOYZNDgKCUvNK38pn0=;
	b=ETMJLsu68W8rDhJsaPseTHg6UEyNsqQsGkXP1r+ygeGVEvLS/bSFG0Gd9dP/wD44
	Wd2wex+HwHlrC8d09M4jvX4PKKECjnn+wkJG+46E6G2B4kOG+EHocpy+DaOk0Q6P6OQ
	p6pbH4hWl652ljKLRrBzKS1YJ9gQyQn1lopjNpcY=
Content-Type: multipart/mixed; boundary="===============5979805758945002880=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cryptodev-module: upgrading to 1.13 SUCCEEDED
Message-ID: <0101018786143ec2-37f78bc3-6a93-427c-acb6-1ff855da6a55-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180106

--===============5979805758945002880==
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
--===============5979805758945002880==
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
meta-yocto-bsp       = "tmp-auh-upgrades:5e2ddc05a5feb031049f70e4f621f4ec9bf028b7"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 6 Mirrors 0 Missed 12 Current 157 (33% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 646 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 662 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 663 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 698 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 699 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 700 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 701 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 702 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: Running task 703 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 704 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 705 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 706 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 707 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 708 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: Running task 709 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 710 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 711 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 712 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 713 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 46935cf3e6437869ab913c922c279c090dca51a83584dbffbf9f85030c2ec4e9
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 714 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 715 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 716 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 717 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 717 tasks of which 694 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cryptodev-linux/1.12-r0/temp/log.do_packagedata.1277497
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============5979805758945002880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PKGSIZE changed from 9848 to 9914 (+1%)
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dbg: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dbg: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dbg: PKGSIZE changed from 20632 to 20656 (+0%)
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
packages/qemux86-poky-linux/cryptodev-module/kernel-module-cryptodev-6.1.20-yocto-standard: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/kernel-module-cryptodev-6.1.20-yocto-standard: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/kernel-module-cryptodev-6.1.20-yocto-standard: PKGSIZE changed from 52636 to 53108 (+1%)
packages/qemux86-poky-linux/cryptodev-module: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module: PKGV changed from 1.12 [default] to 1.13 [default]

--===============5979805758945002880==
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
meta-yocto-bsp       = "tmp-auh-upgrades:5e2ddc05a5feb031049f70e4f621f4ec9bf028b7"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 7 Mirrors 0 Missed 12 Current 156 (36% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 646 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 662 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 663 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 698 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 699 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 700 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 701 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 702 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 703 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 704 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 705 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 706 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 707 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 708 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: Running task 709 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 710 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 711 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 712 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 713 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 46935cf3e6437869ab913c922c279c090dca51a83584dbffbf9f85030c2ec4e9
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 714 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 715 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 716 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 717 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 717 tasks of which 694 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/cryptodev-linux/1.12-r0/temp/log.do_packagedata.1295222
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============5979805758945002880==
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
meta-yocto-bsp       = "tmp-auh-upgrades:5e2ddc05a5feb031049f70e4f621f4ec9bf028b7"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 40 Mirrors 0 Missed 13 Current 127 (75% match, 92% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 134 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 138 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 141 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_setscene)
NOTE: Running task 568 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 569 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 570 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 580 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_deploy_setscene: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 581 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 582 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: Running task 583 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 145 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 146 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_packagedata_setscene)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 149 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 584 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 151 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_packagedata_setscene: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 154 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: Running task 595 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 155 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 158 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 159 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 160 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 597 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 598 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 161 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 162 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 604 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 605 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 46935cf3e6437869ab913c922c279c090dca51a83584dbffbf9f85030c2ec4e9
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 173 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 174 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 620 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_fetch: Succeeded
NOTE: Running task 621 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_unpack: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 177 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 178 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 681 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 693 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 698 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 699 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 700 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 701 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 702 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 703 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 704 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 705 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 705 tasks of which 680 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/cryptodev-linux/1.12-r0/temp/log.do_packagedata.1302473
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============5979805758945002880==
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
meta-yocto-bsp       = "tmp-auh-upgrades:5e2ddc05a5feb031049f70e4f621f4ec9bf028b7"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 7 Mirrors 0 Missed 12 Current 156 (36% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 646 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 662 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 663 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 698 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 699 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 700 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 701 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 702 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: Running task 703 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 704 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 705 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: Running task 706 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 707 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 708 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 709 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 710 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 711 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 712 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 713 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 46935cf3e6437869ab913c922c279c090dca51a83584dbffbf9f85030c2ec4e9
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 714 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 715 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 716 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 717 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 717 tasks of which 694 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/cryptodev-linux/1.12-r0/temp/log.do_packagedata.1283267
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============5979805758945002880==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cryptodev-module-upgrade-1.12-1.13.patch"

RnJvbSAwNTFmYzY3ZWQ3OTVkYjM3M2Q0N2QyMTgwZmQyOTQ3Y2Y3Y2UxNTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTU6MzM6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cnlwdG9kZXYtbW9kdWxlOiB1cGdyYWRlIDEuMTIgLT4gMS4xMwoKLS0tCiAuLi5wdG9kZXYtbW9k
dWxlXzEuMTIuYmIgPT4gY3J5cHRvZGV2LW1vZHVsZV8xLjEzLmJifSB8ICAwCiBtZXRhL3JlY2lw
ZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYuaW5jICAgICAgICAgICB8ICAyICstCiAuLi5p
bnN0YWxsaW5nLWhlYWRlci1maWxlLXByb3ZpZGVkLWJ5LWFub3RoZXItcC5wYXRjaCB8IDExICsr
KysrKy0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi97Y3J5cHRvZGV2LW1vZHVs
ZV8xLjEyLmJiID0+IGNyeXB0b2Rldi1tb2R1bGVfMS4xMy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LW1vZHVsZV8xLjEyLmJi
IGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LW1vZHVsZV8xLjEzLmJi
CnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2Ny
eXB0b2Rldi9jcnlwdG9kZXYtbW9kdWxlXzEuMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1r
ZXJuZWwvY3J5cHRvZGV2L2NyeXB0b2Rldi1tb2R1bGVfMS4xMy5iYgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LmluYyBiL21ldGEvcmVjaXBlcy1r
ZXJuZWwvY3J5cHRvZGV2L2NyeXB0b2Rldi5pbmMKaW5kZXggZWYzNDJhMTU3Yy4uNjFjNjg4ZjFk
MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2Lmlu
YworKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYuaW5jCkBAIC0x
MCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRl
ZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vY3J5cHRvZGV2LWxpbnV4L2NyeXB0b2Rldi1saW51eDticmFuY2g9bWFzdGVyO3Byb3RvY29s
PWh0dHBzIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImUwYzI1ZTI4OWQ2YmFmMWQ4M2MyYjlj
YjUyM2QzYmMyMzdkMGMwYzkiCitTUkNSRVYgPSAiNzk1ZjVmZGExNDg1ZDQ0N2NkYmFkMzQyZTgz
MDRiZTMxN2Q0ZjdlOCIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvZmlsZXMvMDAwMS1EaXNhYmxlLWluc3RhbGxpbmct
aGVhZGVyLWZpbGUtcHJvdmlkZWQtYnktYW5vdGhlci1wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtl
cm5lbC9jcnlwdG9kZXYvZmlsZXMvMDAwMS1EaXNhYmxlLWluc3RhbGxpbmctaGVhZGVyLWZpbGUt
cHJvdmlkZWQtYnktYW5vdGhlci1wLnBhdGNoCmluZGV4IDg4NWI1ODIzZTQuLjM5ZWI2ODlkZDEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L2ZpbGVzLzAwMDEtRGlz
YWJsZS1pbnN0YWxsaW5nLWhlYWRlci1maWxlLXByb3ZpZGVkLWJ5LWFub3RoZXItcC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9maWxlcy8wMDAxLURpc2FibGUtaW5z
dGFsbGluZy1oZWFkZXItZmlsZS1wcm92aWRlZC1ieS1hbm90aGVyLXAucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDhhODg0ZjU1YmQxNTI3YmFhODJmYWI2OGMxODZiYTU0NjI3Mzg2MGMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDIzNDNiOWI5OGNiMDI1NTFkMjc0YzIzNThiMzIw
YzI1YjY0ZThkMTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBEZW55cyBEbXl0cml5
ZW5rbyA8ZGVueXNAdGkuY29tPgogRGF0ZTogU3VuLCA2IEFwciAyMDE0IDE5OjUxOjM5IC0wNDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgaW5zdGFsbGluZyBoZWFkZXIgZmlsZSBwcm92aWRl
ZCBieSBhbm90aGVyIHBhY2thZ2UKQEAgLTYsMTkgKzYsMjAgQEAgU3ViamVjdDogW1BBVENIXSBE
aXNhYmxlIGluc3RhbGxpbmcgaGVhZGVyIGZpbGUgcHJvdmlkZWQgYnkgYW5vdGhlciBwYWNrYWdl
CiBTaWduZWQtb2ZmLWJ5OiBEZW55cyBEbXl0cml5ZW5rbyA8ZGVueXNAdGkuY29tPgogCiBVcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgWyBPRSBzcGVjaWZpYyBdCisKIC0tLQogIE1ha2Vm
aWxlIHwgMSAtCiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L01ha2VmaWxlIGIvTWFrZWZpbGUKLWluZGV4IDVhMDgwZTAuLmJmMDIzOTYgMTAwNjQ0CitpbmRl
eCBkODNhZWU2Li5jOGQ4YWU1IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUKICsrKyBiL01ha2VmaWxl
Ci1AQCAtMzMsNyArMzMsNiBAQCBpbnN0YWxsOiBtb2R1bGVzX2luc3RhbGwKK0BAIC0zNiw3ICsz
Niw2IEBAIGluc3RhbGw6IG1vZHVsZXNfaW5zdGFsbAogIAogIG1vZHVsZXNfaW5zdGFsbDoKICAJ
JChNQUtFKSAkKEtFUk5FTF9NQUtFX09QVFMpIG1vZHVsZXNfaW5zdGFsbAogLQlpbnN0YWxsIC1t
IDY0NCAtRCBjcnlwdG8vY3J5cHRvZGV2LmggJChERVNURElSKS8kKGluY2x1ZGVkaXIpL2NyeXB0
by9jcnlwdG9kZXYuaAogIAotIGNsZWFuOgotIAkkKE1BS0UpICQoS0VSTkVMX01BS0VfT1BUUykg
Y2xlYW4KKyBpbnN0YWxsX3Rlc3RzOiB0ZXN0cworIAkkKE1BS0UpIC1DIHRlc3RzIGluc3RhbGwg
REVTVERJUj0kKFBSRUZJWCkKLS0gCjIuMzkuMgoK

--===============5979805758945002880==
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
meta-yocto-bsp       = "tmp-auh-upgrades:5e2ddc05a5feb031049f70e4f621f4ec9bf028b7"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 7 Mirrors 0 Missed 12 Current 156 (36% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 646 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 662 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 663 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 698 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 699 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 700 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 701 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 702 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 703 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 704 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 705 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 706 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 707 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 708 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 709 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 710 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 711 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 712 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 713 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 46935cf3e6437869ab913c922c279c090dca51a83584dbffbf9f85030c2ec4e9
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 714 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 715 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 716 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 717 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe make-mod-scripts-1.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 717 tasks of which 694 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/cryptodev-linux/1.12-r0/temp/log.do_packagedata.1288843
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============5979805758945002880==--

