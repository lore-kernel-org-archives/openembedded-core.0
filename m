Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4337AC43219
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.2289.1651434544808690926
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=r1aOkgdl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010180812b5c07-32d14f53-5f10-4363-85c2-f348b7ca8996-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sbctMvmnUIKOB37KPk04sB65XN6s8yzZLbo7usTVn1Q=;
	b=r1aOkgdla10fReyOBeeuRWJg7NC3Y0fOW/g6vSsDdmEmuZnhHdXUI8YT21I2RIR3
	yrJbRZhvtaNxk3uWF7D1fD4NIbCDM1fsnb4IVkpWTGp4B+OnV3+VXa+mrm3frOc2geh
	0263Yxjw7WweS+BqoQitSUxVX+TGnVGHqQTtFKpI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sbctMvmnUIKOB37KPk04sB65XN6s8yzZLbo7usTVn1Q=;
	b=FnpovfwEk5N89Nse+umDmBbMK8Flvdb1sz9MIY5kufGXmhavlRr5hUKF170pYLSR
	yNJkxAO7UGaw/SxD2m1w5mCZVyiH66v9VWbvGRdCwENe4GoXg3NDgaguQp7betYiJWj
	obL6LJ1KpPF4uUXD7mpmTqywiZLsILZlBxEdNH4Q=
Content-Type: multipart/mixed; boundary="===============8531864526691854765=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 211 SUCCEEDED
Message-ID: 
 <01010180812b5c07-32d14f53-5f10-4363-85c2-f348b7ca8996-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165157

--===============8531864526691854765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *211* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-208-211.patch
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
--===============8531864526691854765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1643 targets, 50 skipped, 0 masked, 0 errors.
Removing 101 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============8531864526691854765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-208.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-211.dist-info

--===============8531864526691854765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-4472791a0a1aeeac24393b20018fc6ca6719b5af"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4472791a0a1aeeac24393b20018fc6ca6719b5af"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 22 Mirrors 0 Missed 34 Current 665 (39% match, 95% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 682 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1421 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/at-spi2-core/2.44.0-r0/temp/log.do_packagedata_setscene.1950358
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 720 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_package_setscene)
NOTE: Running task 2081 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: Running task 2115 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_fetch)
NOTE: Running task 2168 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2169 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2170 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2171 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2172 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: recipe diffoscope-211-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe diffoscope-211-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: Running task 2365 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2366 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2367 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_unpack)
NOTE: Running task 2368 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: Running task 2369 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2370 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2371 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2372 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2373 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2374 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2375 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2376 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-211-r0: task do_unpack: Started
NOTE: recipe diffoscope-211-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: Running task 2377 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-211-r0: task do_unpack: Succeeded
NOTE: Running task 2378 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2379 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_patch)
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: Running task 2380 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-211-r0: task do_patch: Started
NOTE: Running task 2381 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2382 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-211-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-211-r0: task do_patch: Succeeded
NOTE: Running task 2383 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_deploy_source_date_epoch)
NOTE: Running task 2384 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2385 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2386 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package_setscene: Started
NOTE: Running task 2387 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-211-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-211-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-211-r0: task do_populate_lic: Succeeded
NOTE: Running task 2388 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe diffoscope-211-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_lic unihash changed to bb7daf3baa741bc6b083f24fe8bb24e6b91c7facc5243efc22d3163363ee5dc7
NOTE: Running task 2389 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2390 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2391 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: Running task 2392 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2393 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe diffoscope-211-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2394 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe diffoscope-211-r0: task do_configure: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2400 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2401 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_compile)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: Running task 2403 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_patch: Started
NOTE: recipe diffoscope-211-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 22db8996b954ad500e98bde8eb5d8f3f9ee45325e3d6ebc87a67531882ff9085
NOTE: Running task 2432 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Succeeded
NOTE: Running task 2437 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2438 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 221777e03b432750d81a3353ee12bea75da31230352399fa97384f965b4130c2
NOTE: Running task 2444 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: Running task 2449 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Started
NOTE: recipe diffoscope-211-r0: task do_compile: Succeeded
NOTE: Running task 2450 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe diffoscope-211-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2452 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: Running task 2453 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2454 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-211-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package)
NOTE: Running task 2460 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_sysroot)
NOTE: recipe diffoscope-211-r0: task do_package: Started
NOTE: recipe diffoscope-211-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2461 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-211-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2462 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: Running task 2463 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2464 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2466 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_packagedata)
NOTE: recipe diffoscope-211-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-211-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2468 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 2470 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 2471 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2472 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2473 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2474 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 2475 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_configure: Succeeded
NOTE: Running task 2476 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2477 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2478 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2479 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2480 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_compile: Succeeded
NOTE: Running task 2481 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_install: Succeeded
NOTE: Running task 2482 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2.4681-r0: task do_package: Started
NOTE: recipe vim-8.2.4681-r0: task do_package: Succeeded
NOTE: Running task 2483 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Succeeded
NOTE: Running task 2484 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2485 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2486 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2487 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2488 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2489 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package_write_rpm)
NOTE: Running task 2490 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package_qa: Started
NOTE: recipe diffoscope-211-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-211-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2491 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_build)
NOTE: Tasks Summary: Attempted 2491 tasks of which 2405 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 80 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8531864526691854765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 208 [default] to 211 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "208" to "211"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 208 [default] to 211 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "208" to "211"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 208 [default] to 211 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "208" to "211"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 208 [default] to 211 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "208" to "211"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 208 [default] to 211 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "208" to "211"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 208 [default] to 211 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "208" to "211"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 208 [default] to 211 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "208" to "211"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-208.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-211.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 208 [default] to 211 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "208" to "211"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-208.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-211.dist-info

--===============8531864526691854765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-4472791a0a1aeeac24393b20018fc6ca6719b5af"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4472791a0a1aeeac24393b20018fc6ca6719b5af"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 22 Mirrors 0 Missed 34 Current 665 (39% match, 95% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 682 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1417 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/at-spi2-core/2.44.0-r0/temp/log.do_packagedata_setscene.2013736
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 720 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_package_setscene)
NOTE: Running task 2078 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: Running task 2113 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_fetch)
NOTE: Running task 2166 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2167 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2168 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2169 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2171 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: recipe diffoscope-211-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-211-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2365 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2366 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_unpack)
NOTE: Running task 2367 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: Running task 2368 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Started
NOTE: Running task 2369 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2370 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2371 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2372 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2373 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Succeeded
NOTE: Running task 2374 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2375 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2376 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe diffoscope-211-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe diffoscope-211-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-211-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Started
NOTE: Running task 2377 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2378 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2379 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_patch)
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-211-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2381 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2382 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-211-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-211-r0: task do_patch: Succeeded
NOTE: Running task 2383 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_deploy_source_date_epoch)
NOTE: Running task 2384 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2385 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: Running task 2386 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package_setscene: Started
NOTE: recipe diffoscope-211-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-211-r0: task do_populate_lic: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2388 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe diffoscope-211-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_lic unihash changed to bb7daf3baa741bc6b083f24fe8bb24e6b91c7facc5243efc22d3163363ee5dc7
NOTE: recipe diffoscope-211-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2389 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_configure)
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2390 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2391 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2392 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2393 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-211-r0: task do_configure: Started
NOTE: Running task 2394 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe diffoscope-211-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_compile)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package_setscene: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2401 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: Running task 2402 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-211-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to adc99ef3803769c431eb1fe143d0d4d2272069a430faf47bb88e42d021c57eca
NOTE: Running task 2433 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Succeeded
NOTE: Running task 2437 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2438 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4f672850dad29842ce5ccb8318ecf7cb5c099e33eefd97dfd516e6119a48cb96
NOTE: Running task 2444 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2449 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Started
NOTE: recipe diffoscope-211-r0: task do_compile: Succeeded
NOTE: Running task 2450 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-211-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_configure: Started
NOTE: Running task 2452 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2454 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe diffoscope-211-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package)
NOTE: Running task 2456 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-211-r0: task do_package: Started
NOTE: recipe diffoscope-211-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2461 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-211-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: Running task 2462 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2464 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: Running task 2465 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2466 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_packagedata)
NOTE: recipe diffoscope-211-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-211-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2468 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 2470 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 2471 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2472 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2473 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2474 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: Running task 2475 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_configure: Succeeded
NOTE: Running task 2476 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2477 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2478 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2479 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2480 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_compile: Succeeded
NOTE: Running task 2481 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_install: Succeeded
NOTE: Running task 2482 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2.4681-r0: task do_package: Started
NOTE: recipe vim-8.2.4681-r0: task do_package: Succeeded
NOTE: Running task 2483 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Succeeded
NOTE: Running task 2484 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2485 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2486 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2487 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2488 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2489 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package_write_rpm)
NOTE: Running task 2490 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package_qa: Started
NOTE: recipe diffoscope-211-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-211-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2491 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_build)
NOTE: Tasks Summary: Attempted 2491 tasks of which 2405 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 80 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8531864526691854765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-4472791a0a1aeeac24393b20018fc6ca6719b5af"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4472791a0a1aeeac24393b20018fc6ca6719b5af"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 22 Mirrors 0 Missed 34 Current 665 (39% match, 95% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 682 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1421 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/at-spi2-core/2.44.0-r0/temp/log.do_packagedata_setscene.2077515
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 720 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_package_setscene)
NOTE: Running task 2078 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: Running task 2115 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_fetch)
NOTE: Running task 2169 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2170 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2171 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2172 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2173 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: recipe diffoscope-211-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-211-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2365 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_unpack)
NOTE: Running task 2366 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2367 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Started
NOTE: Running task 2368 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: Running task 2369 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2370 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2371 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2372 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2373 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2374 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2375 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2376 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-211-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-211-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: Running task 2377 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: recipe diffoscope-211-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2378 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_patch)
NOTE: Running task 2379 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-211-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 2381 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2382 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2383 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-211-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-211-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2384 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_deploy_source_date_epoch)
NOTE: Running task 2385 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2386 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-211-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-211-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package_setscene: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2388 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-211-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_lic unihash changed to bb7daf3baa741bc6b083f24fe8bb24e6b91c7facc5243efc22d3163363ee5dc7
NOTE: recipe diffoscope-211-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: Running task 2389 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_configure)
NOTE: Running task 2390 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: Running task 2391 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2392 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe diffoscope-211-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2393 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2394 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe diffoscope-211-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_compile)
NOTE: Running task 2396 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2397 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2398 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe diffoscope-211-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cb21232c5a28826a835c7b82a0929a680de568bfa22b4e8f2902c7990c647f3e
NOTE: Running task 2433 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Succeeded
NOTE: Running task 2437 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2438 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 383898a484d5745ad8dfc12903788320e353f730bca51d01c97a5e5c0c4bdc03
NOTE: Running task 2444 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2445 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: Running task 2449 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe diffoscope-211-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Started
NOTE: Running task 2450 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-211-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2.4681-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2452 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: Running task 2453 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2458 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe diffoscope-211-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package)
NOTE: Running task 2460 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_sysroot)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe diffoscope-211-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-211-r0: task do_package: Started
NOTE: recipe diffoscope-211-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2461 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2462 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2463 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2464 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: Running task 2466 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_packagedata)
NOTE: recipe diffoscope-211-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-211-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2468 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_configure: Succeeded
NOTE: Running task 2470 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 2471 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 2472 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2473 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2474 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 2476 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2477 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2478 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2479 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2480 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_compile: Succeeded
NOTE: Running task 2481 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_install: Succeeded
NOTE: Running task 2482 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2.4681-r0: task do_package: Started
NOTE: recipe vim-8.2.4681-r0: task do_package: Succeeded
NOTE: Running task 2483 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Succeeded
NOTE: Running task 2484 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2485 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2486 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2487 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2488 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2489 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package_write_rpm)
NOTE: Running task 2490 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package_qa: Started
NOTE: recipe diffoscope-211-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-211-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2491 of 2491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_build)
NOTE: Tasks Summary: Attempted 2491 tasks of which 2405 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 80 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8531864526691854765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1643 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-4472791a0a1aeeac24393b20018fc6ca6719b5af"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4472791a0a1aeeac24393b20018fc6ca6719b5af"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 22 Mirrors 0 Missed 34 Current 669 (39% match, 95% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 686 of 725 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 725 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1421 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at-spi2-core/2.44.0-r0/temp/log.do_packagedata_setscene.1884058
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 724 of 725 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_package_setscene)
NOTE: Running task 2096 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: Running task 2133 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_fetch)
NOTE: Running task 2186 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2187 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2188 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2190 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2191 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: recipe diffoscope-211-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-211-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2383 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2384 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_unpack)
NOTE: Running task 2385 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: Running task 2386 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: Running task 2387 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2388 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2389 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2390 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2391 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Succeeded
NOTE: Running task 2392 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2393 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2394 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe diffoscope-211-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-211-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: Running task 2395 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe diffoscope-211-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Started
NOTE: Running task 2396 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: Running task 2397 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_patch)
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: Running task 2398 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: Running task 2399 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe diffoscope-211-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2400 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2401 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-211-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2402 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_deploy_source_date_epoch)
NOTE: Running task 2403 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_lic)
NOTE: recipe diffoscope-211-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2404 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe diffoscope-211-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2405 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-211-r0: task do_populate_lic: Started
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package_setscene: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2406 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-211-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_lic unihash changed to bb7daf3baa741bc6b083f24fe8bb24e6b91c7facc5243efc22d3163363ee5dc7
NOTE: recipe diffoscope-211-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: Running task 2407 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2408 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: recipe diffoscope-211-r0: task do_configure: Started
NOTE: Running task 2410 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Running task 2411 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe diffoscope-211-r0: task do_configure: Succeeded
NOTE: Running task 2413 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2414 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-211-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Succeeded
NOTE: Running task 2420 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: Running task 2421 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ea93135e6bc8e63cc54852e198d3eabbf225aea3faf287903bdd2c4fb2e8da5b
NOTE: Running task 2451 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Succeeded
NOTE: Running task 2455 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2456 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e12ef1466cb841b8170ebe21bf855a1d72ab36d5c6b2197eb65f7498b9c23a64
NOTE: Running task 2462 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: Running task 2466 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 2467 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Started
NOTE: recipe diffoscope-211-r0: task do_compile: Succeeded
NOTE: Running task 2468 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe diffoscope-211-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2469 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_configure: Started
NOTE: Running task 2470 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: Running task 2471 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2472 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe at-spi2-core-2.44.0-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-211-r0: task do_install: Succeeded
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: Running task 2477 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package)
NOTE: Running task 2478 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_populate_sysroot)
NOTE: recipe diffoscope-211-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-211-r0: task do_package: Started
NOTE: recipe diffoscope-211-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2479 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: Running task 2481 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2482 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: Running task 2483 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: Running task 2484 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package: Succeeded
NOTE: Running task 2485 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_packagedata)
NOTE: recipe diffoscope-211-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-211-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 2488 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 2489 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2490 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2491 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2492 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 2493 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_configure: Succeeded
NOTE: Running task 2494 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2495 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2496 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2497 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2498 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_compile: Succeeded
NOTE: Running task 2499 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_install: Succeeded
NOTE: Running task 2500 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2.4681-r0: task do_package: Started
NOTE: recipe vim-8.2.4681-r0: task do_package: Succeeded
NOTE: Running task 2501 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Succeeded
NOTE: Running task 2502 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2503 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2504 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2505 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2506 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2507 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package_write_rpm)
NOTE: Running task 2508 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-211-r0: task do_package_qa: Started
NOTE: recipe diffoscope-211-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-211-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2509 of 2509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_211.bb:do_build)
NOTE: Tasks Summary: Attempted 2509 tasks of which 2423 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 80 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.44.1-r0 to 0:2.44.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.44.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8531864526691854765==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-208-211.patch"

From 4e626b75f85d165374555e074e13cb41a2d3f0e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 19:00:00 +0000
Subject: [PATCH] diffoscope: upgrade 208 -> 211

---
 .../diffoscope/{diffoscope_208.bb => diffoscope_211.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_208.bb => diffoscope_211.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_208.bb b/meta/recipes-support/diffoscope/diffoscope_211.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_208.bb
rename to meta/recipes-support/diffoscope/diffoscope_211.bb
index 3c3b007d60..c634ab44cb 100644
--- a/meta/recipes-support/diffoscope/diffoscope_208.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_211.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2c5c0ac1159eefce158154849fe67f0f527dffc5295bfd3ca1aef14962ffcbcb"
+SRC_URI[sha256sum] = "8e75f3acb181096632e43935ba7a85304703ac54739810b4523919188367ec03"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.27.0


--===============8531864526691854765==--

