Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B42CC7EE33
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:02 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.32114.1680384533725372173
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=flH8u3Ga;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101873eb92d64-925aa157-bc25-46ad-9b35-7760504020fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=32fSAO9aNlBJAcPfLTn9N8SmodbWAZiLAc//+kirCdQ=;
	b=flH8u3Ga88xAD2Rr1GypB371Hm0rXmkq7Yzreee3j7WvFvcSR6MXmLKZJsuINkFf
	7wS63hI0g86Ck+KRJZs4VHkkX0zTvB8bSXh8sGb67le0DKg1aVajPeOkW9cN9dypYjm
	joHuIwIR2KJCKSCV4nw8TVw70q6cozq9jBBzd9H8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=32fSAO9aNlBJAcPfLTn9N8SmodbWAZiLAc//+kirCdQ=;
	b=GIJIbI7Am3hNEoq0cVplByjA3AfXUwTie6pNrA9famAfxLhe8PnhYbRLr9zvQ58l
	Uvl/8b3S/ngIH+vG2N6KsdeB5Dh1fsqDU3g0EvDbFSRTEYnHLRKkB3obik84G/p+du+
	w7Z6311Fd7wONzE9RgCciRY8nnry6BcGhJ0ZxA9A=
Content-Type: multipart/mixed; boundary="===============7008374178584927456=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cryptodev-module: upgrading to 1.13 SUCCEEDED
Message-ID: <010101873eb92d64-925aa157-bc25-46ad-9b35-7760504020fd-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179539

--===============7008374178584927456==
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
--===============7008374178584927456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 73 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-044f295158ac8ab7127e0d8f56e05f1cf2f07aa4"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:044f295158ac8ab7127e0d8f56e05f1cf2f07aa4"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 24 Mirrors 0 Missed 20 Current 131 (54% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 317 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 636 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 649 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 650 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 655 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: Running task 665 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 666 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 667 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 668 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_fetch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 669 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 670 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 671 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 672 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: Running task 673 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_fetch: Succeeded
NOTE: Running task 674 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 675 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 676 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 677 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 678 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 679 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 680 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 681 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 682 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 683 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 684 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: Running task 685 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 686 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 687 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 688 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 454cabb04593cca20fab9654355ce85e930a3e8b29f50b838f2e34ba8f6a6b4c
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 689 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 690 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 691 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 692 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 693 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 693 tasks of which 659 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/cryptodev-linux/1.12-r0/temp/log.do_packagedata.1629243
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============7008374178584927456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PKGSIZE changed from 9848 to 9914 (+1%)
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dbg: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dbg: PKGSIZE changed from 20632 to 20656 (+0%)
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dbg: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-dev: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-doc: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-doc: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-locale: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-locale: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-src: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-src: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-staticdev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module-staticdev: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/cryptodev-module: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module/kernel-module-cryptodev-6.1.20-yocto-standard: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module/kernel-module-cryptodev-6.1.20-yocto-standard: PKGSIZE changed from 52636 to 53108 (+1%)
packages/qemux86-poky-linux/cryptodev-module/kernel-module-cryptodev-6.1.20-yocto-standard: PV changed from "1.12" to "1.13"
packages/qemux86-poky-linux/cryptodev-module: PKGV changed from 1.12 [default] to 1.13 [default]
packages/qemux86-poky-linux/cryptodev-module: PV changed from "1.12" to "1.13"

--===============7008374178584927456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1797 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (895 cached, 3 parsed). 1797 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-044f295158ac8ab7127e0d8f56e05f1cf2f07aa4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:044f295158ac8ab7127e0d8f56e05f1cf2f07aa4"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 24 Mirrors 0 Missed 20 Current 131 (54% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 320 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 636 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 649 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 650 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 655 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: Running task 665 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 666 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 667 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 668 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_fetch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 669 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 670 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 671 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 672 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 673 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_fetch: Succeeded
NOTE: Running task 674 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 675 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 676 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 677 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 678 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 679 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 680 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 681 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 682 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 683 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 684 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: Running task 685 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 686 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 687 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 688 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 454cabb04593cca20fab9654355ce85e930a3e8b29f50b838f2e34ba8f6a6b4c
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 689 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 690 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 691 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 692 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 693 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 693 tasks of which 659 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cryptodev-linux/1.12-r0/temp/log.do_packagedata.1621279
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============7008374178584927456==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cryptodev-module-upgrade-1.12-1.13.patch"

RnJvbSAwODg1OGQwNzAxOWY4N2Q5ZDgyN2JjMzE0Y2E3MWE4ZGRjNWRiYzE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxODoxNzo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
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
cm92aWRlZC1ieS1hbm90aGVyLXAucGF0Y2gKaW5kZXggODg1YjU4MjNlNC4uZjI2MGI4ZjRlZiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvZmlsZXMvMDAwMS1EaXNh
YmxlLWluc3RhbGxpbmctaGVhZGVyLWZpbGUtcHJvdmlkZWQtYnktYW5vdGhlci1wLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L2ZpbGVzLzAwMDEtRGlzYWJsZS1pbnN0
YWxsaW5nLWhlYWRlci1maWxlLXByb3ZpZGVkLWJ5LWFub3RoZXItcC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gOGE4ODRmNTViZDE1MjdiYWE4MmZhYjY4YzE4NmJhNTQ2MjczODYwYyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzZhMmY5NDcyM2Q1Yjk5MWEwZThhZjI0MjgxYjZi
YTg2YTZkOTI4MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERlbnlzIERteXRyaXll
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

--===============7008374178584927456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 50 skipped, 0 masked, 0 errors.
Removing 5 recipes from the core2-32 sysroot...done.
Removing 9 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-044f295158ac8ab7127e0d8f56e05f1cf2f07aa4"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:044f295158ac8ab7127e0d8f56e05f1cf2f07aa4"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 47 Mirrors 0 Missed 20 Current 113 (70% match, 88% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 120 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 124 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 337 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 560 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 561 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 562 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 563 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: Running task 573 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 574 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 575 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_fetch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 576 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 577 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 578 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: Running task 579 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_fetch: Succeeded
NOTE: Running task 580 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: Running setscene task 150 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 581 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 152 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_unpack: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 583 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 154 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 584 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 155 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 586 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 158 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 159 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 160 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 587 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 588 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Running task 589 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 161 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 164 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 595 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 170 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 610 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 611 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 454cabb04593cca20fab9654355ce85e930a3e8b29f50b838f2e34ba8f6a6b4c
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 612 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 175 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 176 of 180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
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
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_prepare_recipe_sysroot: Succeeded
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
NOTE: Tasks Summary: Attempted 705 tasks of which 671 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/cryptodev-linux/1.12-r0/temp/log.do_packagedata.1633011
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============7008374178584927456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-044f295158ac8ab7127e0d8f56e05f1cf2f07aa4"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:044f295158ac8ab7127e0d8f56e05f1cf2f07aa4"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 24 Mirrors 0 Missed 20 Current 131 (54% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 317 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 636 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 649 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 650 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 655 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: Running task 665 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 666 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 667 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 668 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_dd663b72ef-r0: task do_fetch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 669 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 670 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 671 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 672 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: Running task 673 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_dd663b72ef-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: Running task 674 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 675 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_dd663b72ef-r0: task do_unpack: Started
NOTE: Running task 676 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_dd663b72ef-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 677 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 678 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 679 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_dd663b72ef-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 680 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 681 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 682 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 683 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 684 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: Running task 685 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 686 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 687 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 688 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 454cabb04593cca20fab9654355ce85e930a3e8b29f50b838f2e34ba8f6a6b4c
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 689 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 690 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 691 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 692 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 693 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_dd663b72ef-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 693 tasks of which 659 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/cryptodev-linux/1.12-r0/temp/log.do_packagedata.1626634
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============7008374178584927456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 56 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-044f295158ac8ab7127e0d8f56e05f1cf2f07aa4"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:044f295158ac8ab7127e0d8f56e05f1cf2f07aa4"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 44 Local 24 Mirrors 0 Missed 20 Current 131 (54% match, 88% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 317 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: Running task 636 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_fetch)
NOTE: Running task 649 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 650 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 655 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Started
NOTE: Running task 665 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 666 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 667 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 668 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_fad8850ff1-r0: task do_fetch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 669 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_unpack)
NOTE: Running task 670 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 671 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 672 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: Running task 673 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_fad8850ff1-r0: task do_fetch: Succeeded
NOTE: Running task 674 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: Running task 675 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 676 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_fad8850ff1-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_fad8850ff1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 677 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cryptodev-linux-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 678 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 679 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_fad8850ff1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_patch: Succeeded
NOTE: Running task 680 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 681 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe cryptodev-module-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 682 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 683 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_patch: Succeeded
NOTE: Running task 684 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_configure)
NOTE: Running task 685 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 686 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_configure: Succeeded
NOTE: Running noexec task 687 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_compile)
NOTE: Running task 688 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_install)
NOTE: recipe cryptodev-module-1.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_populate_lic unihash changed to 454cabb04593cca20fab9654355ce85e930a3e8b29f50b838f2e34ba8f6a6b4c
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 689 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_install: Succeeded
NOTE: Running task 690 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_populate_sysroot)
NOTE: Running task 691 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_package)
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 692 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.12-r0: task do_package: Succeeded
NOTE: Running task 693 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata)
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Started
NOTE: recipe cryptodev-linux-1.12-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_fad8850ff1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 693 tasks of which 659 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/cryptodev-linux/1.12-r0/temp/log.do_packagedata.1623985
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/cryptodev/cryptodev-linux_1.12.bb:do_packagedata) failed with exit code '1'

--===============7008374178584927456==--

