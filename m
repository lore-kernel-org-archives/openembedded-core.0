Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58111C88C8C
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:42 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.7528.1685693431961318251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B52qmLF7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b289173-df0b7ee5-2e8a-4c92-b93d-c363018b13c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ezjCYqhfoLnhlnd99bB6cPp3KOnz4z8bQcucM/4waxE=;
	b=B52qmLF77XxQfGe8fz20mee7sEQxSFXcuMuUH4155DG/CXKUhqCY2E2DdCd+3qRD
	0hTtqk2W1ppW+rDWj+KNYrkbWZrJioxfAoaIi4y2eRRB1/AKw+wj5W0X5K4hw2/Rfm6
	tnm4id2YURFsiliRuPuqXvqg4Pmmi2iD0K2z+wXw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ezjCYqhfoLnhlnd99bB6cPp3KOnz4z8bQcucM/4waxE=;
	b=UTU4SPS9nzvlsrqoA2bnLMeWH/thAjXkCllQgVYKaxj7+qh65i93jS6hOXuw3NSN
	lXU9ewchj4asWHJwVsI5aML+EPNi72pWvYXRxuMj52KHgyTEib/n5KszRNeALbDKHid
	StqLmTyJ4gCqdhiNVssIHjHv5p/6b0JohfqB4wXw=
Content-Type: multipart/mixed; boundary="===============8976211138872530254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 242 SUCCEEDED
Message-ID: <010101887b289173-df0b7ee5-2e8a-4c92-b93d-c363018b13c8-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182261

--===============8976211138872530254==
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
--===============8976211138872530254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2be5a69b4b769bbae727400299c20f2e64b2b414"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 26 Mirrors 0 Missed 24 Current 689 (52% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 699 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/curl/8.1.1-r0/temp/log.do_packagedata_setscene.3238647
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 736 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_package_setscene)
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.3238645
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 737 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: recipe curl-8.1.1-r0: task do_package_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: Running task 2160 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 2215 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2216 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2218 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2219 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2351 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
NOTE: Running task 2450 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: Running task 2451 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 2452 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2453 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2454 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2455 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: Running task 2456 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2457 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: Running task 2458 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2459 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2460 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: Running task 2461 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2462 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2478 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: Running task 2480 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Running task 2481 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: Running task 2482 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2483 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2484 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe vim-9.0.1592-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2485 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2486 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2487 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2488 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2489 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: Running task 2490 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2491 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: Running task 2492 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2493 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe curl-8.1.1-r0: task do_package_setscene: Succeeded
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: Running task 2518 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe curl-8.1.1-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: Running task 2533 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1592-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 2548 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2549 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2550 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2551 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe vim-9.0.1592-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: Running task 2552 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2553 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: Running task 2554 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: Running task 2555 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2556 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2557 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2558 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2559 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2560 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2561 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2562 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: Running task 2563 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2564 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe vim-9.0.1592-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2564 tasks of which 2511 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 127 ERROR messages, returning a non-zero exit code.
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.3245453
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============8976211138872530254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2be5a69b4b769bbae727400299c20f2e64b2b414"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 28 Mirrors 0 Missed 24 Current 683 (53% match, 96% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 1 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 693 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/curl/8.1.1-r0/temp/log.do_packagedata_setscene.3248102
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 730 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_package_setscene)
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1464 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 1476 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 1477 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 1480 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 1481 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.3248100
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 731 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
NOTE: Running task 1584 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1585 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 1586 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1587 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: Running task 1588 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_package_setscene: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1589 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 1590 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: Running task 1591 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1592 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1593 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: Running task 1594 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: Running task 1595 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1596 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1597 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: Running task 1603 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe curl-8.1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 733 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 1608 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2297 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata)
NOTE: Running task 2402 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2426 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: Running task 2447 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 2456 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2459 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2460 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2508 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe curl-8.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2521 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2522 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2523 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2524 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 2525 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: recipe vim-9.0.1592-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2527 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2528 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2531 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.1592-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2532 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2536 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: Running task 2537 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2538 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2539 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2540 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2541 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2542 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: Running task 2543 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2544 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: Running task 2545 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2546 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe vim-9.0.1592-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2546 tasks of which 2493 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 127 ERROR messages, returning a non-zero exit code.
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.3255171
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============8976211138872530254==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-236-242.patch"

RnJvbSA5M2IwMjk4ZTNkZjlmNmJjODY4MTg2MTI5YzQ0YmFlMjY2MDg1YmM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwNTo1ODo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjM2IC0+IDI0MgoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yMzYuYmIgPT4gZGlmZm9zY29wZV8yNDIuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzIzNi5iYiA9PiBkaWZmb3Njb3BlXzI0
Mi5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjM2LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI0Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjM2LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjQyLmJiCmluZGV4IDlmODlmMzVj
MTEuLjRiMGQ1MThlZGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMzYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI0Mi5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI4NGM0Njg0MGRhZmZmZTAyMjMwNTY3MThlNDI1MGNlYjUyNDg0NDUyYTk5MmI4NWUzNDVl
M2NmOGEyY2Y3ZDRiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ4NThjNTkxZDJjOGQ0MmIyYjI5
ZWI2ZDIyOTQwODYwN2IxY2Q4YTRlN2FkZTcyZDBjZDAwMmRiNmQxYzJhNmUiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJiaW51dGlscyB2aW0gc3F1YXNoZnMtdG9vbHMgcHl0aG9uMy1saWJhcmNoaXZl
LWMgcHl0aG9uMy1tYWdpYyBweXRob24zLXJwbSIKIAotLSAKMi4zOS4yCgo=

--===============8976211138872530254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-236.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-242.dist-info

--===============8976211138872530254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 99 recipes from the core2-32 sysroot...done.
Removing 123 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============8976211138872530254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2be5a69b4b769bbae727400299c20f2e64b2b414"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 28 Mirrors 0 Missed 24 Current 683 (53% match, 96% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
Removing 1 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 693 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/curl/8.1.1-r0/temp/log.do_packagedata_setscene.3257757
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 730 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_package_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1464 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 1477 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 1479 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 1480 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 1481 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.3257755
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 731 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
NOTE: Running task 1584 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 1585 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 1586 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_package_setscene: Started
NOTE: Running task 1587 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: Running task 1588 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1589 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: Running task 1590 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: Running task 1591 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 1592 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1593 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: Running task 1594 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: Running task 1595 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1596 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1597 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: Running task 1603 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe curl-8.1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 733 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 1608 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2297 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata)
NOTE: Running task 2402 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2426 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: Running task 2447 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 2458 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2459 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2460 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.1.1-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2508 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe curl-8.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2521 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2522 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2523 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2524 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 2525 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe vim-9.0.1592-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: Running task 2527 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: Running task 2528 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2531 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.1592-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2532 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2536 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: Running task 2537 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2538 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2539 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2540 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2541 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2542 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2543 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2544 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2545 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2546 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe vim-9.0.1592-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2546 tasks of which 2493 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 127 ERROR messages, returning a non-zero exit code.
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.3264893
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============8976211138872530254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2be5a69b4b769bbae727400299c20f2e64b2b414"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 28 Mirrors 0 Missed 24 Current 683 (53% match, 96% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
Removing 1 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 693 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/curl/8.1.1-r0/temp/log.do_packagedata_setscene.3267329
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 730 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_package_setscene)
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.3267327
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 731 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: Running task 1464 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 1476 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 1477 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 1478 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 1479 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: Running task 1584 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: recipe curl-8.1.1-r0: task do_package_setscene: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1585 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 1586 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1587 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: Running task 1588 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1589 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 1590 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: Running task 1591 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1592 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1593 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: Running task 1594 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: Running task 1595 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: Running task 1596 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1597 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_package_setscene: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: Running task 1603 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: Running setscene task 733 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 2296 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata)
NOTE: Running task 2401 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2421 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2424 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: Running task 2448 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 2456 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2457 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2458 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.1.1-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2508 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe curl-8.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2521 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2522 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2523 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2524 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2525 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe vim-9.0.1592-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2527 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2528 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2531 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.1592-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2532 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2536 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: Running task 2537 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2538 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2539 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2540 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2541 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2542 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2543 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2544 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: Running task 2545 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2546 of 2555 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe vim-9.0.1592-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2546 tasks of which 2493 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 127 ERROR messages, returning a non-zero exit code.
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:8.1.2-r0 to 0:8.1.1-r0) [version-going-backwards]
ERROR: curl-8.1.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.3274424
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============8976211138872530254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1406019 to 1408047 (+0%)
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-236.tar.gz;downloadfilename=diffoscope-236.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-242.tar.gz;downloadfilename=diffoscope-242.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "236" to "242"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-236.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-242.dist-info

--===============8976211138872530254==--

