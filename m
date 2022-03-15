Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FCEC38162
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web08.10654.1647349734810750100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=yKUHaZfI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 0101017f8db223ad-7f270238-a40b-4714-9408-3d2748ba9594-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349736;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KpcBdpN7Dp39DBWkGfFubqtx6HZJAjxeBxX+EygKC8Y=;
	b=yKUHaZfIWxiZecgwOxXghRrcW6YLixPf6H3+MymOBw2WkQ/+1aJKj8ei++doOrq2
	6bD/WV/ulaDCpONvXx91dZttzZse/HWcIOHnqOdOL4g9HmUaw5156ndR4OfI/wZz+kB
	kc78gfUbKXLNyWNXf5hdEybduEiJzDZtYczTqrI0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349736;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KpcBdpN7Dp39DBWkGfFubqtx6HZJAjxeBxX+EygKC8Y=;
	b=PVqBlJiYxQ0KeHM9+fYgwHgh9lNZd4//FuC6z8Xz/zopjuycEdq6a+gECdUlybi4
	4t17YdTa5VwkpTrSKfgGVLsoFe8oHmrnIel4CdMqvmMMnHxzbWphj2vjQyNMt95Y0wh
	rxtpvMHVTvMNZwpZLSSB/qZc96qV1FdLUnH0yeIY=
Content-Type: multipart/mixed; boundary="===============3296036968218485894=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 207 SUCCEEDED
Message-ID: 
 <0101017f8db223ad-7f270238-a40b-4714-9408-3d2748ba9594-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:56 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163285

--===============3296036968218485894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *207* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-206-207.patch
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
--===============3296036968218485894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "206" to "207"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 206 [default] to 207 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "206" to "207"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 206 [default] to 207 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "206" to "207"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 206 [default] to 207 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "206" to "207"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 206 [default] to 207 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "206" to "207"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 206 [default] to 207 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "206" to "207"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 206 [default] to 207 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "206" to "207"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1043459 to 1043705 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 206 [default] to 207 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "206" to "207"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-206.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-207.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 206 [default] to 207 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-206.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-207.dist-info

--===============3296036968218485894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1522 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (842 cached, 1 parsed). 1521 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-a4e6b17b13d8df5bde4b6c385e23b7b25a856cff"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a4e6b17b13d8df5bde4b6c385e23b7b25a856cff"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 47 Local 6 Mirrors 0 Missed 41 Current 678 (12% match, 94% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1264 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2048 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_fetch)
NOTE: Running task 2050 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2081 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_fetch)
NOTE: Running task 2126 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2127 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2128 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2129 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2131 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2166 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-207-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: recipe diffoscope-207-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe vim-8.2.4524-r0: task do_fetch: Started
NOTE: Running task 2310 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: Running task 2311 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_unpack)
NOTE: Running task 2312 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2313 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2314 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2315 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4524-r0: task do_fetch: Succeeded
NOTE: Running task 2316 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2317 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2318 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2319 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2320 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2321 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2322 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe diffoscope-207-r0: task do_unpack: Started
NOTE: recipe diffoscope-207-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4524-r0: task do_unpack: Started
NOTE: Running task 2323 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-207-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: Running task 2324 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: Running task 2325 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2326 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe diffoscope-207-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2327 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2328 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe diffoscope-207-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-207-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2329 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_deploy_source_date_epoch)
NOTE: Running task 2330 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2331 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: Running task 2332 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-207-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-207-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: Running task 2333 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe diffoscope-207-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_lic unihash changed to cb056609050ca47108939f8fa17eb019db61202f120740aa027f706870167b57
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2334 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2335 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2336 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe diffoscope-207-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2337 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_configure)
NOTE: Running task 2338 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-207-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-8.2.4524-r0: task do_unpack: Succeeded
NOTE: Running task 2339 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2341 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-207-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: Running task 2342 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_compile)
NOTE: Running task 2343 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: recipe vim-8.2.4524-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe diffoscope-207-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: Running task 2344 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2414 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: Running task 2415 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4524-r0: task do_patch: Succeeded
NOTE: Running task 2421 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe vim-8.2.4524-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2422 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-8.2.4524-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Succeeded
NOTE: Running task 2423 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d25d3c26c678c93d22c45641c2dcd551821a8aa1afdac7a764ed3ac034eb65e6
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 2453 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 2454 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2455 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe diffoscope-207-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: Running task 2456 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_install)
NOTE: recipe diffoscope-207-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Succeeded
NOTE: Running task 2457 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2458 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2459 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_configure: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: Running task 2461 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: Running task 2462 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: Running task 2463 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2464 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 2465 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe diffoscope-207-r0: task do_install: Succeeded
NOTE: Running task 2466 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_package)
NOTE: Running task 2467 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_sysroot)
NOTE: recipe diffoscope-207-r0: task do_package: Started
NOTE: recipe diffoscope-207-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2468 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe diffoscope-207-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: Running task 2469 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2470 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: Running task 2471 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2472 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: Running task 2473 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-207-r0: task do_package: Succeeded
NOTE: Running task 2475 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2476 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe diffoscope-207-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2477 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe diffoscope-207-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2478 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2479 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2480 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2481 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_configure: Succeeded
NOTE: Running task 2482 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_compile)
NOTE: recipe gtk+3-3.24.31-r0: task do_compile: Started
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2483 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2484 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2485 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2486 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_install)
NOTE: recipe gtk+3-3.24.31-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_install: Succeeded
NOTE: Running task 2488 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_package)
NOTE: Running task 2489 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.31-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2490 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4524-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4524-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2491 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2.4524-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_package: Succeeded
NOTE: Running task 2492 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.31-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4524-r0: task do_configure: Succeeded
NOTE: Running task 2493 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2.4524-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_packagedata: Failed
NOTE: recipe vim-8.2.4524-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2493 tasks of which 2399 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata
Summary: There were 139 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gtk+3/3.24.31-r0/temp/log.do_packagedata.3280447
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata) failed with exit code '1'

--===============3296036968218485894==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-206-207.patch"

From 261517b02f5fb5f329fc5dd7df458f282d030203 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 12:39:56 +0000
Subject: [PATCH] diffoscope: upgrade 206 -> 207

---
 .../diffoscope/{diffoscope_206.bb => diffoscope_207.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_206.bb => diffoscope_207.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_206.bb b/meta/recipes-support/diffoscope/diffoscope_207.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_206.bb
rename to meta/recipes-support/diffoscope/diffoscope_207.bb
index 7eaca74b33..004d4d1ee6 100644
--- a/meta/recipes-support/diffoscope/diffoscope_206.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_207.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "93731939ede57547a3275c3c81875ab4bd222f26364a7519cf6aafe1939cd603"
+SRC_URI[sha256sum] = "e670160911c8e465ab178f23bd1a2e6a827032b7bbec5f24eebf9215f1ae5f54"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.27.0


--===============3296036968218485894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-a4e6b17b13d8df5bde4b6c385e23b7b25a856cff"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a4e6b17b13d8df5bde4b6c385e23b7b25a856cff"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 47 Local 6 Mirrors 0 Missed 41 Current 674 (12% match, 94% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1254 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2030 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2031 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_fetch)
NOTE: Running task 2061 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_fetch)
NOTE: Running task 2106 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2108 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2109 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2110 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2111 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2150 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-207-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Started
NOTE: recipe diffoscope-207-r0: task do_fetch: Succeeded
NOTE: Running task 2292 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Succeeded
NOTE: Running task 2293 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_unpack)
NOTE: Running task 2294 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4524-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2295 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2296 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2297 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2298 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2299 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4524-r0: task do_fetch: Succeeded
NOTE: Running task 2300 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2301 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2302 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2303 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2304 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe diffoscope-207-r0: task do_unpack: Started
NOTE: recipe diffoscope-207-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: Running task 2305 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-207-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2.4524-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: Running task 2306 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_patch)
NOTE: Running task 2307 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2308 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-207-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2309 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2310 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe diffoscope-207-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-207-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2311 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_deploy_source_date_epoch)
NOTE: Running task 2312 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: Running task 2313 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2314 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-207-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-207-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: Running task 2315 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-207-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_lic unihash changed to cb056609050ca47108939f8fa17eb019db61202f120740aa027f706870167b57
NOTE: Running task 2316 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2317 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-207-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2318 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: Running task 2319 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2320 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe vim-8.2.4524-r0: task do_unpack: Succeeded
NOTE: Running task 2321 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe diffoscope-207-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Running task 2322 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: recipe diffoscope-207-r0: task do_configure: Succeeded
NOTE: recipe vim-8.2.4524-r0: task do_patch: Started
NOTE: Running task 2324 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: Running task 2325 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-207-r0: task do_compile: Started
NOTE: Running task 2326 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2396 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2397 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4524-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2402 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2403 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe vim-8.2.4524-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2404 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vim-8.2.4524-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Succeeded
NOTE: Running task 2405 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3d10e13db30fbd57f74e3cdf7abcd55c19a02df807945b0d76c501e33b62027f
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2433 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2434 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 2435 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2436 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2437 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe diffoscope-207-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: Running task 2438 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_install)
NOTE: recipe diffoscope-207-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Succeeded
NOTE: Running task 2439 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2440 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2441 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_configure: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2442 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2443 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2444 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: Running task 2445 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: Running task 2446 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: Running task 2447 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: recipe diffoscope-207-r0: task do_install: Succeeded
NOTE: Running task 2448 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_package)
NOTE: Running task 2449 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_sysroot)
NOTE: recipe diffoscope-207-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-207-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe diffoscope-207-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: Running task 2451 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: Running task 2452 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: Running task 2454 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2455 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe diffoscope-207-r0: task do_package: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: Running task 2456 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe diffoscope-207-r0: task do_packagedata: Started
NOTE: Running task 2458 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe diffoscope-207-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2459 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2462 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_compile)
NOTE: recipe gtk+3-3.24.31-r0: task do_compile: Started
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2465 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2466 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2468 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_install)
NOTE: recipe gtk+3-3.24.31-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_install: Succeeded
NOTE: Running task 2470 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_package)
NOTE: Running task 2471 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.31-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2472 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4524-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4524-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2473 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2.4524-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_package: Succeeded
NOTE: Running task 2474 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.31-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4524-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2.4524-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_packagedata: Failed
NOTE: recipe vim-8.2.4524-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2475 tasks of which 2381 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata
Summary: There were 139 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gtk+3/3.24.31-r0/temp/log.do_packagedata.3629018
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata) failed with exit code '1'

--===============3296036968218485894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-a4e6b17b13d8df5bde4b6c385e23b7b25a856cff"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a4e6b17b13d8df5bde4b6c385e23b7b25a856cff"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 47 Local 6 Mirrors 0 Missed 41 Current 674 (12% match, 94% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1264 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2032 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_fetch)
NOTE: Running task 2033 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2063 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_fetch)
NOTE: Running task 2109 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2110 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2111 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2112 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2113 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2149 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-207-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe diffoscope-207-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: Running task 2292 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: Running task 2293 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_unpack)
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Succeeded
NOTE: Running task 2294 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe vim-8.2.4524-r0: task do_fetch: Started
NOTE: Running task 2295 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_unpack)
NOTE: Running task 2296 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2297 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2298 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2299 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2300 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2301 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2.4524-r0: task do_fetch: Succeeded
NOTE: Running task 2302 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2303 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2304 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe diffoscope-207-r0: task do_unpack: Started
NOTE: recipe diffoscope-207-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2305 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: Running task 2306 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe vim-8.2.4524-r0: task do_unpack: Started
NOTE: recipe diffoscope-207-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2307 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_patch)
NOTE: Running task 2308 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-207-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2309 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2310 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe diffoscope-207-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-207-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2311 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_deploy_source_date_epoch)
NOTE: Running task 2312 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: Running task 2313 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2314 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-207-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-207-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: Running task 2315 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-207-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_lic unihash changed to cb056609050ca47108939f8fa17eb019db61202f120740aa027f706870167b57
NOTE: recipe diffoscope-207-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2316 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_configure)
NOTE: Running task 2317 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2318 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: Running task 2319 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2320 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe diffoscope-207-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-207-r0: task do_configure: Succeeded
NOTE: Running task 2321 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_compile)
NOTE: Running task 2322 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe vim-8.2.4524-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: Running task 2324 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2325 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: recipe diffoscope-207-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe vim-8.2.4524-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: Running task 2326 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: Running task 2396 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2397 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4524-r0: task do_patch: Succeeded
NOTE: Running task 2402 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: recipe vim-8.2.4524-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2403 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2404 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe vim-8.2.4524-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Succeeded
NOTE: Running task 2405 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ef4803d6d46aaa652317dde5016660c3c9bfb4f26fb5b82a00119f969712810f
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2433 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: Running task 2434 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: Running task 2435 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe diffoscope-207-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 2436 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: recipe diffoscope-207-r0: task do_install: Started
NOTE: Running task 2438 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Succeeded
NOTE: Running task 2439 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2440 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2441 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_configure: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2442 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2443 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2444 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2445 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: Running task 2446 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: Running task 2447 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: recipe diffoscope-207-r0: task do_install: Succeeded
NOTE: Running task 2448 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_package)
NOTE: Running task 2449 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_sysroot)
NOTE: recipe diffoscope-207-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-207-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe diffoscope-207-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: Running task 2451 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2452 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2454 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: Running task 2455 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe diffoscope-207-r0: task do_package: Succeeded
NOTE: Running task 2456 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-207-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2457 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2458 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-207-r0: task do_packagedata: Succeeded
NOTE: Running task 2459 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2462 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_compile)
NOTE: recipe gtk+3-3.24.31-r0: task do_compile: Started
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2465 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2466 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2468 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_install)
NOTE: recipe gtk+3-3.24.31-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_install: Succeeded
NOTE: Running task 2470 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_package)
NOTE: Running task 2471 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.31-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2472 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4524-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4524-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2473 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2.4524-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_package: Succeeded
NOTE: Running task 2474 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.31-r0: task do_packagedata: Started
NOTE: recipe vim-8.2.4524-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2.4524-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_packagedata: Failed
NOTE: recipe vim-8.2.4524-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2475 tasks of which 2381 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata
Summary: There were 139 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gtk+3/3.24.31-r0/temp/log.do_packagedata.3809049
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata) failed with exit code '1'

--===============3296036968218485894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-206.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-207.dist-info

--===============3296036968218485894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-a4e6b17b13d8df5bde4b6c385e23b7b25a856cff"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a4e6b17b13d8df5bde4b6c385e23b7b25a856cff"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 47 Local 6 Mirrors 0 Missed 41 Current 674 (12% match, 94% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1265 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2031 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_fetch)
NOTE: Running task 2032 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2063 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_fetch)
NOTE: Running task 2108 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2109 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2111 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2112 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_fetch)
NOTE: Running task 2113 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2148 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-207-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe diffoscope-207-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Started
NOTE: recipe vim-8.2.4524-r0: task do_fetch: Started
NOTE: Running task 2292 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2293 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_unpack)
NOTE: Running task 2294 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2295 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2296 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2297 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2298 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_unpack)
NOTE: Running task 2299 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2300 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2301 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4524-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2302 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2303 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2304 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe diffoscope-207-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-207-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_unpack: Succeeded
NOTE: Running task 2305 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe diffoscope-207-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2.4524-r0: task do_unpack: Started
NOTE: Running task 2306 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2307 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_patch)
NOTE: Running task 2308 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Started
NOTE: recipe diffoscope-207-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 2309 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe squashfs-tools-4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2310 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-207-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_patch: Succeeded
NOTE: Running task 2311 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2312 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-207-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2313 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_lic)
NOTE: Running task 2314 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-207-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-207-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_patch: Succeeded
NOTE: Running task 2315 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2316 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe diffoscope-207-r0: task do_populate_lic: Succeeded
NOTE: Running task 2317 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_lic unihash changed to cb056609050ca47108939f8fa17eb019db61202f120740aa027f706870167b57
NOTE: recipe diffoscope-207-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2318 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2319 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_configure)
NOTE: Running task 2320 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe vim-8.2.4524-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-207-r0: task do_configure: Started
NOTE: Running task 2321 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2322 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe diffoscope-207-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_compile)
NOTE: recipe vim-8.2.4524-r0: task do_patch: Started
NOTE: Running task 2324 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: Running task 2325 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_compile)
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Started
NOTE: recipe diffoscope-207-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Started
NOTE: Running task 2326 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2396 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2397 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2402 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe gtk+3-3.24.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4524-r0: task do_patch: Succeeded
NOTE: Running task 2403 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe vim-8.2.4524-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2404 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vim-8.2.4524-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Succeeded
NOTE: Running task 2405 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_patch)
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9b074ab49bf314dbb0b484132f7ef5d7b9a473bb3d8de5b302c51a07269ab907
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2433 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_compile: Succeeded
NOTE: Running task 2434 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2435 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2436 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Started
NOTE: recipe diffoscope-207-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: Running task 2438 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_install)
NOTE: recipe diffoscope-207-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Succeeded
NOTE: Running task 2439 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2440 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2441 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_configure: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2442 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2443 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_compile: Succeeded
NOTE: Running task 2444 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-magic-0.4.25-r0: task do_install: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Started
NOTE: Running task 2445 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2446 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: Running task 2447 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Started
NOTE: recipe diffoscope-207-r0: task do_install: Succeeded
NOTE: Running task 2448 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_package)
NOTE: Running task 2449 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe diffoscope-207-r0: task do_package: Started
NOTE: recipe diffoscope-207-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-207-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.25-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2451 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_packagedata)
NOTE: Running task 2452 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.25.bb:do_package_write_rpm)
NOTE: Running task 2454 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package: Succeeded
NOTE: Running task 2455 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2456 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe diffoscope-207-r0: task do_package: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Started
NOTE: Running task 2457 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_207.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2458 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe diffoscope-207-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.25-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2459 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe diffoscope-207-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2462 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_compile)
NOTE: recipe gtk+3-3.24.31-r0: task do_compile: Started
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2465 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2466 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2468 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_compile: Succeeded
NOTE: Running task 2469 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_install)
NOTE: recipe gtk+3-3.24.31-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_install: Succeeded
NOTE: Running task 2470 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_package)
NOTE: Running task 2471 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.31-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2472 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.4524-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.4524-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2473 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2.4524-r0: task do_configure: Started
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_package: Succeeded
NOTE: Running task 2474 of 2482 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.31-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_packagedata: Failed
NOTE: recipe vim-8.2.4524-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2474 tasks of which 2381 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata
Summary: There were 139 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.33-r0 to 0:3.24.31-r0) [version-going-backwards]
ERROR: gtk+3-3.24.31-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gtk+3/3.24.31-r0/temp/log.do_packagedata.3473888
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_packagedata) failed with exit code '1'

--===============3296036968218485894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1522 targets, 50 skipped, 0 masked, 0 errors.
Removing 113 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============3296036968218485894==--

