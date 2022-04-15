Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093F5C49EA4
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:55 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.11561.1650052686789761630
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=laIFOaRI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101802ecded47-3563467a-8f5b-4879-8302-ab901ca8e176-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B9OlJ+Od8uYuu70su2abPQ+eHSgnawByy3WGbuhN9Z4=;
	b=laIFOaRIJKbweUxOmk7v0G2axFV3uSe6Iec8xdNfyw8QJPJxJhsRrdUuGRsIzH9W
	7xeQ06r6+ZQLw3dq7ELnAQlQlGBk7VbYQZZDKxckg09096sL5HEs26Wx/EDSQ+P8vyf
	z4TTg4gdHtQHNB7zpt4QbLO3/fDU/Sp4xeKGoQV8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B9OlJ+Od8uYuu70su2abPQ+eHSgnawByy3WGbuhN9Z4=;
	b=JuqhnrKRAdJ6l8PFBcqoinW5X+Ln5sHgVcdA4e+eu9402ApX1/DLh5qWarWxGaMn
	17iJyyvdC7x7IDqEiwiAXjtlWUu5cCoPI/8qd/X0ptKOtCRp7b/Y1r2IZbtQEVA0Ons
	dCa37teC2gzmLJEnVvey99wjhC5WrBoqPx+S2nLM=
Content-Type: multipart/mixed; boundary="===============6138926720947576453=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 209 SUCCEEDED
Message-ID: 
 <010101802ecded47-3563467a-8f5b-4879-8302-ab901ca8e176-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:09 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164510

--===============6138926720947576453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *209* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-208-209.patch
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
--===============6138926720947576453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 62 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6106bf7d5d6bc3e025b76ec56874d9bb2e75cc96"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 20 Mirrors 0 Missed 30 Current 671 (40% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 683 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/pango/1.50.4-r0/temp/log.do_packagedata_setscene.3602929
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 720 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_package_setscene)
NOTE: Running task 2124 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_fetch)
NOTE: Running task 2188 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2189 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2190 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2191 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2192 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2304 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-209-r0: task do_fetch: Started
NOTE: recipe diffoscope-209-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: Running task 2381 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_unpack)
NOTE: Running task 2382 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Started
NOTE: Running task 2399 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2400 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2401 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2402 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2403 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2404 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2405 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2406 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-209-r0: task do_unpack: Started
NOTE: Running task 2407 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe diffoscope-209-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe diffoscope-209-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2408 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2409 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_patch)
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Started
NOTE: Running task 2410 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-209-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-209-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-209-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: Running task 2412 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_deploy_source_date_epoch)
NOTE: Running task 2413 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2414 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_lic)
NOTE: Running task 2415 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-209-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-209-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Started
NOTE: recipe diffoscope-209-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_lic unihash changed to 8aab5211e160b3e05c0ec6baf27ab3b13fd97953838539a47d5787bc63aa5d07
NOTE: recipe diffoscope-209-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2416 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_configure)
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: Running task 2417 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2418 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: Running task 2419 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-209-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe diffoscope-209-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2438 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2439 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Succeeded
NOTE: Running task 2441 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2442 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2443 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: Running task 2444 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: Running task 2445 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: Running task 2446 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: recipe diffoscope-209-r0: task do_compile: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: Running task 2447 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_patch: Succeeded
NOTE: Running task 2450 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: Running task 2453 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe diffoscope-209-r0: task do_compile: Succeeded
NOTE: Running task 2454 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_configure: Started
NOTE: recipe diffoscope-209-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2457 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe diffoscope-209-r0: task do_install: Succeeded
NOTE: Running task 2458 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package)
NOTE: Running task 2459 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_sysroot)
NOTE: recipe diffoscope-209-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-209-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2460 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-209-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2461 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: Running task 2462 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2463 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2464 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: Running task 2465 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2466 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: recipe diffoscope-209-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe diffoscope-209-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-209-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2469 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: Running task 2470 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2471 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_configure: Succeeded
NOTE: Running task 2472 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2473 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_compile: Succeeded
NOTE: Running task 2474 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_install: Succeeded
NOTE: Running task 2475 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2476 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2478 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2479 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2.4681-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Succeeded
NOTE: Running task 2481 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2486 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package_write_rpm)
NOTE: Running task 2487 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-209-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-209-r0: task do_package_qa: Started
NOTE: recipe diffoscope-209-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-209-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2488 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_build)
NOTE: Tasks Summary: Attempted 2488 tasks of which 2410 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6138926720947576453==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-208-209.patch"

From 13c0310351ef5d57470d6c19f8fab812905373aa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 19:08:29 +0000
Subject: [PATCH] diffoscope: upgrade 208 -> 209

---
 .../diffoscope/{diffoscope_208.bb => diffoscope_209.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_208.bb => diffoscope_209.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_208.bb b/meta/recipes-support/diffoscope/diffoscope_209.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_208.bb
rename to meta/recipes-support/diffoscope/diffoscope_209.bb
index 3c3b007d60..614218bee4 100644
--- a/meta/recipes-support/diffoscope/diffoscope_208.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_209.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2c5c0ac1159eefce158154849fe67f0f527dffc5295bfd3ca1aef14962ffcbcb"
+SRC_URI[sha256sum] = "e845a0b6cd56c116fee670ae8497512489504dc911201bd77b7d65b8550618f6"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.27.0


--===============6138926720947576453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 52 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6106bf7d5d6bc3e025b76ec56874d9bb2e75cc96"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 20 Mirrors 0 Missed 30 Current 671 (40% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 683 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/pango/1.50.4-r0/temp/log.do_packagedata_setscene.3519304
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 720 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_package_setscene)
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2126 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_fetch)
NOTE: Running task 2189 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2190 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2191 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2193 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2194 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2304 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-209-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: recipe diffoscope-209-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: Running task 2397 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_unpack)
NOTE: Running task 2398 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2399 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2400 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2401 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2402 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2403 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Succeeded
NOTE: Running task 2404 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2405 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2406 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2407 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-209-r0: task do_unpack: Started
NOTE: recipe diffoscope-209-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Started
NOTE: recipe diffoscope-209-r0: task do_unpack: Succeeded
NOTE: Running task 2408 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: Running task 2409 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2410 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-209-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-209-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-209-r0: task do_patch: Succeeded
NOTE: Running task 2412 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_deploy_source_date_epoch)
NOTE: Running task 2413 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: Running task 2414 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2415 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-209-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-209-r0: task do_populate_lic: Started
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: Running task 2416 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-209-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_lic unihash changed to 8aab5211e160b3e05c0ec6baf27ab3b13fd97953838539a47d5787bc63aa5d07
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-209-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2417 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_configure)
NOTE: Running task 2418 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2419 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2420 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: recipe diffoscope-209-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2439 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata)
NOTE: Running task 2441 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-209-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2442 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2443 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_compile)
NOTE: Running task 2444 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Started
NOTE: Running task 2445 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: Running task 2446 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: recipe diffoscope-209-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: Running task 2447 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Succeeded
NOTE: Running task 2450 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2451 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2452 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: Running task 2453 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-209-r0: task do_compile: Succeeded
NOTE: Running task 2454 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_configure: Started
NOTE: recipe diffoscope-209-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: Running task 2457 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe diffoscope-209-r0: task do_install: Succeeded
NOTE: Running task 2458 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package)
NOTE: Running task 2459 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_sysroot)
NOTE: recipe diffoscope-209-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-209-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2460 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-209-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: Running task 2461 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: Running task 2462 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: Running task 2463 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2464 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: Running task 2466 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: Running task 2467 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe diffoscope-209-r0: task do_package: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: Running task 2468 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_packagedata)
NOTE: recipe diffoscope-209-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-209-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: Running task 2469 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2470 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2471 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_configure: Succeeded
NOTE: Running task 2472 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2473 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_compile: Succeeded
NOTE: Running task 2474 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2475 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2.4681-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2478 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2479 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2.4681-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Succeeded
NOTE: Running task 2481 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2486 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package_write_rpm)
NOTE: Running task 2487 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-209-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-209-r0: task do_package_qa: Started
NOTE: recipe diffoscope-209-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-209-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2488 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_build)
NOTE: Tasks Summary: Attempted 2488 tasks of which 2410 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6138926720947576453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-208.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-209.dist-info

--===============6138926720947576453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1641 targets, 50 skipped, 0 masked, 0 errors.
Removing 112 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============6138926720947576453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1641 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6106bf7d5d6bc3e025b76ec56874d9bb2e75cc96"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 20 Mirrors 0 Missed 30 Current 675 (40% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 687 of 725 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 725 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/pango/1.50.4-r0/temp/log.do_packagedata_setscene.3432664
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 724 of 725 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_package_setscene)
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2144 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_fetch)
NOTE: Running task 2207 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2208 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2209 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2211 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2212 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2322 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-209-r0: task do_fetch: Started
NOTE: recipe diffoscope-209-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: Running task 2365 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_unpack)
NOTE: Running task 2366 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: Running task 2416 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2417 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2418 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2419 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Succeeded
NOTE: Running task 2421 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2422 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2423 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2424 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2425 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-209-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-209-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Started
NOTE: recipe diffoscope-209-r0: task do_unpack: Succeeded
NOTE: Running task 2426 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2427 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2428 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe diffoscope-209-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2429 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: recipe diffoscope-209-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-209-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2430 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2431 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2432 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: Running task 2433 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Started
NOTE: recipe diffoscope-209-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-209-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: Running task 2434 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-209-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_lic unihash changed to 8aab5211e160b3e05c0ec6baf27ab3b13fd97953838539a47d5787bc63aa5d07
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-209-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2435 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2436 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2437 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: recipe diffoscope-209-r0: task do_configure: Started
NOTE: Running task 2456 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata)
NOTE: Running task 2458 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2459 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: Running task 2460 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: recipe diffoscope-209-r0: task do_configure: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Succeeded
NOTE: Running task 2461 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_compile)
NOTE: Running task 2462 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2463 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2464 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe diffoscope-209-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: Running task 2465 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Succeeded
NOTE: Running task 2468 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2470 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: Running task 2471 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe diffoscope-209-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: Running task 2472 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe diffoscope-209-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2473 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: Running task 2474 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: Running task 2475 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe diffoscope-209-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package)
NOTE: Running task 2477 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_sysroot)
NOTE: recipe diffoscope-209-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-209-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-209-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2478 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2479 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: Running task 2481 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2482 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2484 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-209-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_packagedata)
NOTE: recipe diffoscope-209-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-209-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: Running task 2487 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2488 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2489 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_configure: Succeeded
NOTE: Running task 2490 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_compile: Succeeded
NOTE: Running task 2491 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2492 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_install: Succeeded
NOTE: Running task 2493 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2.4681-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2494 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2495 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe vim-8.2.4681-r0: task do_package: Succeeded
NOTE: Running task 2496 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Succeeded
NOTE: Running task 2497 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2498 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2499 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2503 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2504 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package_write_rpm)
NOTE: Running task 2505 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-209-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-209-r0: task do_package_qa: Started
NOTE: recipe diffoscope-209-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-209-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2506 of 2506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_build)
NOTE: Tasks Summary: Attempted 2506 tasks of which 2428 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6138926720947576453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 69 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6106bf7d5d6bc3e025b76ec56874d9bb2e75cc96"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 20 Mirrors 0 Missed 30 Current 671 (40% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 683 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/pango/1.50.4-r0/temp/log.do_packagedata_setscene.3687056
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 720 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_package_setscene)
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2126 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_fetch)
NOTE: Running task 2190 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2191 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2192 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2193 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2194 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2304 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-209-r0: task do_fetch: Started
NOTE: recipe diffoscope-209-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: Running task 2369 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_unpack)
NOTE: Running task 2370 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2384 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2385 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2386 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2387 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2388 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2389 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4681-r0: task do_fetch: Succeeded
NOTE: Running task 2390 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2391 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2392 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-209-r0: task do_unpack: Started
NOTE: recipe diffoscope-209-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: Running task 2408 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Started
NOTE: Running task 2409 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe diffoscope-209-r0: task do_unpack: Succeeded
NOTE: Running task 2410 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-209-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2411 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: recipe diffoscope-209-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-209-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2412 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_deploy_source_date_epoch)
NOTE: Running task 2413 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_lic)
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2414 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: Running task 2415 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Started
NOTE: recipe diffoscope-209-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-209-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: Running task 2416 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-209-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_lic unihash changed to 8aab5211e160b3e05c0ec6baf27ab3b13fd97953838539a47d5787bc63aa5d07
NOTE: recipe diffoscope-209-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2417 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2418 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2419 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: recipe pango-1.50.4-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2438 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata)
NOTE: recipe diffoscope-209-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Running task 2440 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-209-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2441 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: Running task 2442 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4681-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: Running task 2443 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2444 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: Running task 2445 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: Running task 2446 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-209-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: recipe vim-8.2.4681-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: Running task 2449 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: Running task 2450 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_patch: Succeeded
NOTE: Running task 2451 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-209-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: Running task 2452 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 2453 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-209-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2454 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe vim-8.2.4681-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2457 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe diffoscope-209-r0: task do_install: Succeeded
NOTE: Running task 2458 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package)
NOTE: Running task 2459 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_populate_sysroot)
NOTE: recipe diffoscope-209-r0: task do_package: Started
NOTE: recipe diffoscope-209-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-209-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2460 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: Running task 2461 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2462 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2464 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2466 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: Running task 2467 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: recipe diffoscope-209-r0: task do_package: Succeeded
NOTE: Running task 2468 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_packagedata)
NOTE: recipe diffoscope-209-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-209-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: Running task 2469 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2470 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2471 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_configure: Succeeded
NOTE: Running task 2472 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2.4681-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2473 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe vim-8.2.4681-r0: task do_compile: Succeeded
NOTE: Running task 2474 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2475 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe vim-8.2.4681-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe vim-8.2.4681-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2478 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4681-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2479 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: Running task 2480 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4681-r0: task do_packagedata: Succeeded
NOTE: Running task 2481 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2.4681-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2486 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package_write_rpm)
NOTE: Running task 2487 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-209-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-209-r0: task do_package_qa: Started
NOTE: recipe diffoscope-209-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-209-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2488 of 2488 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_209.bb:do_build)
NOTE: Tasks Summary: Attempted 2488 tasks of which 2410 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.50.7-r0 to 0:1.50.4-r0) [version-going-backwards]
ERROR: pango-1.50.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6138926720947576453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "208" to "209"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 208 [default] to 209 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "208" to "209"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 208 [default] to 209 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "208" to "209"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 208 [default] to 209 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "208" to "209"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 208 [default] to 209 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "208" to "209"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 208 [default] to 209 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "208" to "209"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 208 [default] to 209 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "208" to "209"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 208 [default] to 209 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-208.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-209.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "208" to "209"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 208 [default] to 209 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-208.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-209.dist-info

--===============6138926720947576453==--

