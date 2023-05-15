Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70F3C7EE2F
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.3720.1684186750066759856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XJ+JrqCR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188215a6448-30495f3b-18be-447c-b449-029827abbdbe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2iYzdq6AwSWtWjhlCrKjJYnVI+pl+XUC8QkIDIzq36k=;
	b=XJ+JrqCR3MZGkIpYdp4Zvdy7LKjvH1CX/BURDgEhD6V+mY0IHiY8W3ttdygZMeUj
	87aOSqtChE3zGPj8XVCb4XWl6Xbx6N/bWaOJWTB3JJLM5fuKNymXi3eNoeY4NalLRgY
	/YgCQxXubx/3XYODt+RD8x4+CgujIk/4hhcCL0u0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2iYzdq6AwSWtWjhlCrKjJYnVI+pl+XUC8QkIDIzq36k=;
	b=LTpDwj4f6doYjsx71Wr6Ni7XBtF72qicThizwgjjwGvjlYollA2d5coXkrcz+Shf
	6oepqPLX0QXv/8gqnD9Lb6tggvuvZ8v/jSN5yFl3bUih0zGvVtJtUq3NEYSnfup182j
	zCbvnylQ/xUg4ZjhdtYksoo5aVpoEwh+20p5tMvo=
Content-Type: multipart/mixed; boundary="===============4944891531708438480=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 242 SUCCEEDED
Message-ID: <01010188215a6448-30495f3b-18be-447c-b449-029827abbdbe-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181385

--===============4944891531708438480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *242* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-236-242.patch
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
--===============4944891531708438480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 51 skipped, 0 masked, 0 errors.
Removing 98 recipes from the core2-32 sysroot...done.
Removing 122 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============4944891531708438480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 73 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:391c75dd72497272bb9af2afc4911743c5787d22"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 64 Local 40 Mirrors 0 Missed 24 Current 669 (62% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 687 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.1670349
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 732 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: Running task 2161 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 2216 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2217 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2218 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2220 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2355 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
NOTE: Running task 2453 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: Running task 2454 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2470 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2471 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2472 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2473 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: Running task 2480 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2481 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Succeeded
NOTE: Running task 2482 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2483 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: Running task 2484 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Started
NOTE: Running task 2485 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2486 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Running task 2487 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2488 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: Running task 2489 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2490 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2491 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2492 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2508 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: Running task 2510 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2511 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 2512 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2513 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe vim-9.0.1429-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: Running task 2514 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2515 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2516 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: Running task 2517 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Succeeded
NOTE: Running task 2518 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1429-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_patch: Succeeded
NOTE: Running task 2521 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2522 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2523 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: Running task 2524 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2525 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: recipe vim-9.0.1429-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2526 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2527 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2529 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2530 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2531 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2532 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2534 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: Running task 2536 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2537 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe vim-9.0.1429-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2537 tasks of which 2485 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There were 117 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.1677005
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============4944891531708438480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:391c75dd72497272bb9af2afc4911743c5787d22"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 64 Local 40 Mirrors 0 Missed 24 Current 669 (62% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 687 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2161 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 2216 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2217 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2219 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2220 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.1651766
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 732 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2273 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Succeeded
NOTE: Running task 2287 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2288 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2290 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2291 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2304 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2358 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 2366 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2367 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2369 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2483 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2484 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: Running task 2485 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2486 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: Running task 2487 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: Running task 2488 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2489 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2490 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2491 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2492 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2493 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2494 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: Running task 2495 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: Running task 2496 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2497 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2498 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2499 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: Running task 2515 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: Running task 2517 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: Running task 2518 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1429-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1429-r0: task do_patch: Started
NOTE: recipe vim-9.0.1429-r0: task do_patch: Succeeded
NOTE: Running task 2519 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2522 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: Running task 2523 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: Running task 2524 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe vim-9.0.1429-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2525 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: recipe vim-9.0.1429-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2526 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2527 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2529 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2530 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2531 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2532 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: Running task 2534 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: Running task 2536 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2537 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe vim-9.0.1429-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2537 tasks of which 2485 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There were 117 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.1658449
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============4944891531708438480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1406019 to 1408047 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-236.tar.gz;downloadfilename=diffoscope-236.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-242.tar.gz;downloadfilename=diffoscope-242.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 236 [default] to 242 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-236.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-242.dist-info

--===============4944891531708438480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:391c75dd72497272bb9af2afc4911743c5787d22"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 64 Local 40 Mirrors 0 Missed 24 Current 669 (62% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 687 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2159 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 2213 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2215 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2216 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2217 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.1661098
NOTE: Running task 2355 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 732 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 2356 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Succeeded
NOTE: Running task 2357 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2358 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2359 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2360 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2361 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2365 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2367 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2368 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2483 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2484 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: Running task 2485 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2486 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2487 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2488 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: Running task 2489 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2490 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2491 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2492 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2493 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: Running task 2494 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2495 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: Running task 2496 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2497 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: Running task 2498 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: Running task 2499 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: Running task 2515 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: Running task 2517 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Succeeded
NOTE: Running task 2518 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1429-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.1429-r0: task do_patch: Started
NOTE: recipe vim-9.0.1429-r0: task do_patch: Succeeded
NOTE: Running task 2519 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2520 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2521 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe vim-9.0.1429-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2522 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_configure: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: Running task 2525 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2526 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2527 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2529 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2530 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: Running task 2531 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2532 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2533 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2536 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2537 of 2546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe vim-9.0.1429-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2537 tasks of which 2485 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There were 117 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.1667721
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============4944891531708438480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-236.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-242.dist-info

--===============4944891531708438480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1804 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:391c75dd72497272bb9af2afc4911743c5787d22"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 64 Local 40 Mirrors 0 Missed 24 Current 673 (62% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 691 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.1642572
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 736 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: Running task 2179 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 2233 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2234 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2235 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2238 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2368 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: Running task 2489 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: Running task 2490 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2494 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2495 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2496 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2497 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Succeeded
NOTE: Running task 2498 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2499 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2500 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2501 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2502 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Started
NOTE: Running task 2503 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2504 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: Running task 2505 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: Running task 2506 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2507 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2508 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2509 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2510 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2511 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2512 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2528 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: Running task 2530 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: Running task 2531 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2532 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: Running task 2533 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2534 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2535 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Succeeded
NOTE: Running task 2536 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1429-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2539 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2540 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2541 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: Running task 2542 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2543 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: recipe vim-9.0.1429-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2544 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2545 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: Running task 2546 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2547 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2548 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2549 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2550 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2551 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2552 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: Running task 2553 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: Running task 2554 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2555 of 2564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe vim-9.0.1429-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2555 tasks of which 2503 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There were 117 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.2-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.1649070
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============4944891531708438480==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-236-242.patch"

RnJvbSBkODllOTg1ODUxZjViMTQyMmFiMWZmNDZlNmE3NTI1ZTAxNTc3OGVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMjA6Mzg6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDIzNiAtPiAyNDIKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjM2LmJiID0+IGRpZmZvc2NvcGVfMjQyLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yMzYuYmIgPT4gZGlmZm9zY29wZV8y
NDIuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIzNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNDIuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIzNi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI0Mi5iYgppbmRleCA5Zjg5ZjM1
YzExLi40YjBkNTE4ZWRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjM2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNDIuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiODRjNDY4NDBkYWZmZmUwMjIzMDU2NzE4ZTQyNTBjZWI1MjQ4NDQ1MmE5OTJiODVlMzQ1
ZTNjZjhhMmNmN2Q0YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkODU4YzU5MWQyYzhkNDJiMmIy
OWViNmQyMjk0MDg2MDdiMWNkOGE0ZTdhZGU3MmQwY2QwMDJkYjZkMWMyYTZlIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiYmludXRpbHMgdmltIHNxdWFzaGZzLXRvb2xzIHB5dGhvbjMtbGliYXJjaGl2
ZS1jIHB5dGhvbjMtbWFnaWMgcHl0aG9uMy1ycG0iCiAKLS0gCjIuMzkuMgoK

--===============4944891531708438480==--

