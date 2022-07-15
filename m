Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC76C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.941.1657900668511507213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EJyfnpAi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101018202949964-327b5dff-0c6f-4938-a52b-25c967458763-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900669;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lz0KSdN4tR2c1BnqGd3lD9Opua46M2rW589tgzB7Y7s=;
	b=EJyfnpAiFJIKH2y1N2gdBuO7PLZQvU7aySTZADZW5nPkz6ytpsxNGn+EQLoRzmA0
	QGDuf/OIknKRTRxucYNpOmYuVLu2wAswsM3+DjdusY1zDZAI7nMIsH5yIlWH43dV91O
	eyHP85B0pe4rw5bDLSmBmU5rgn8P8qEDR1QSkP0I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900669;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lz0KSdN4tR2c1BnqGd3lD9Opua46M2rW589tgzB7Y7s=;
	b=R46W/zUY81i6se8J2XHTD3b4/02uHSE2VcJg7CYQShRkLmA4mNFc7FaXZI6Gqc6Z
	gKASMLQ9/J+AyD3nrmPmH+fEx4GZFA5BX0lT6uh5EF3wXt7pp8mUTYPNHnss1xkghFQ
	1Lye6856LnXgNVABEj8BEPctN0K2iEJ7KPNbYiNg=
Content-Type: multipart/mixed; boundary="===============6974448507061704156=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 218 SUCCEEDED
Message-ID: 
 <0101018202949964-327b5dff-0c6f-4938-a52b-25c967458763-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168119

--===============6974448507061704156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *218* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-217-218.patch
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
--===============6974448507061704156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 217 [default] to 218 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "217" to "218"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 217 [default] to 218 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "217" to "218"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 217 [default] to 218 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "217" to "218"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 217 [default] to 218 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "217" to "218"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 217 [default] to 218 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "217" to "218"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 217 [default] to 218 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "217" to "218"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1059126 to 1059299 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 217 [default] to 218 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "217" to "218"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-217.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-218.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 217 [default] to 218 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "217" to "218"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-217.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-218.dist-info

--===============6974448507061704156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1660 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-c5d7e5de2c42186536a39731ace38b9246e1cf22"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c5d7e5de2c42186536a39731ace38b9246e1cf22"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 79 Local 10 Mirrors 0 Missed 69 Current 640 (12% match, 90% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 691 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1443 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libidn2/2.3.2-r0/temp/log.do_packagedata_setscene.1604382
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 718 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_package_setscene)
NOTE: Running task 1586 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_fetch)
NOTE: Running task 1622 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_fetch)
NOTE: Running task 1636 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1663 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: Running task 1818 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1819 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1836 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: recipe file-5.42-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: Running task 1936 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_unpack)
NOTE: Running task 1937 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: recipe file-5.42-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: Running task 1973 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_unpack)
NOTE: Running task 1974 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2007 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: Running task 2024 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: Running task 2060 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2101 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: Running task 2102 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2103 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2104 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2105 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe file-5.42-r0: task do_unpack: Started
NOTE: Running task 2106 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2107 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2108 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2109 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2110 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2111 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2140 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe file-5.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: recipe diffoscope-218-r0: task do_fetch: Started
NOTE: recipe diffoscope-218-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 2238 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_unpack)
NOTE: Running task 2239 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2275 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2276 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2277 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe vim-9.0.0021-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2284 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2285 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2286 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.0021-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_unpack: Started
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2288 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 2289 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2290 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 2291 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 2292 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2293 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe file-5.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_unpack: Started
NOTE: recipe diffoscope-218-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 2294 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: Running task 2295 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: Running task 2296 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2297 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.42-r0: task do_unpack: Succeeded
NOTE: Running task 2298 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe diffoscope-218-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.42-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2299 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2300 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.42-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-218-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Succeeded
NOTE: Running task 2301 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_deploy_source_date_epoch)
NOTE: Running task 2302 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_deploy_source_date_epoch)
NOTE: Running task 2303 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libidn2-2.3.2-r0: task do_package_setscene: Started
NOTE: Running task 2304 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2305 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2306 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-218-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2307 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Started
NOTE: recipe diffoscope-218-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2308 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_populate_lic: Succeeded
NOTE: Running task 2309 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 2310 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_lic unihash changed to 3817c5fd80496be4dd856d6c03808d237771c1b39d5c8474d97c3332cb80e14d
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-218-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 2311 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2329 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2331 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata)
NOTE: Running task 2332 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2333 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: Running task 2334 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2335 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Succeeded
NOTE: Running task 2336 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2337 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2338 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: Running task 2339 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe gnutls-3.7.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe diffoscope-218-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe file-5.42-r0: task do_configure: Started
NOTE: Running task 2340 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2341 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Running task 2342 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2343 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe diffoscope-218-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2344 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: Running task 2345 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_compile)
NOTE: Running task 2346 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe vim-9.0.0021-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2347 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: Running task 2348 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe vim-9.0.0021-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2349 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_configure)
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2350 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d8f557ae6b90ae4b7cb968e7a42cc30e5077fbb83cf42ce3fa1363e1834895c2
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: Running task 2381 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0021-r0: task do_patch: Succeeded
NOTE: Running task 2382 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0021-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2384 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2385 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 462b0e92b3b755a9d71db7cc2bf43dcef3a94b969e5256558d0a743d52c7a4c1
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2397 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2398 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: Running task 2399 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2400 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2401 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2402 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe vim-9.0.0021-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 2403 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 2404 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: Running task 2406 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2407 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2408 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2409 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 2410 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe vim-9.0.0021-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2411 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2412 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 2413 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe diffoscope-218-r0: task do_compile: Succeeded
NOTE: Running task 2414 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_install)
NOTE: recipe diffoscope-218-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe diffoscope-218-r0: task do_install: Succeeded
NOTE: Running task 2415 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package)
NOTE: Running task 2416 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_sysroot)
NOTE: Running task 2417 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe diffoscope-218-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-218-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2419 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-218-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 2420 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2421 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2422 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-218-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-218-r0: task do_packagedata: Started
NOTE: recipe diffoscope-218-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2424 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2425 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2427 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2429 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 2430 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe file-5.42-r0: task do_configure: Succeeded
NOTE: Running task 2431 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_compile)
NOTE: recipe file-5.42-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.42-r0: task do_compile: Succeeded
NOTE: Running task 2432 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_install)
NOTE: recipe file-5.42-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: recipe file-5.42-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_populate_sysroot)
NOTE: Running task 2434 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_package)
NOTE: Running task 2435 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe file-5.42-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.42-r0: task do_package: Started
NOTE: recipe file-5.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.0021-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 2439 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2440 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.42-r0: task do_package: Succeeded
NOTE: Running task 2441 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.42-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2442 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2443 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe file-5.42-r0: task do_packagedata: Succeeded
NOTE: Running task 2444 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 2445 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2446 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2447 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2448 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2449 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_compile: Succeeded
NOTE: Running task 2450 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0021-r0: task do_install: Started
NOTE: recipe vim-9.0.0021-r0: task do_install: Succeeded
NOTE: Running task 2451 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.0021-r0: task do_package: Started
NOTE: recipe vim-9.0.0021-r0: task do_package: Succeeded
NOTE: Running task 2452 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.0021-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0021-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0021-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0021-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_compile)
NOTE: recipe gnutls-3.7.6-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.6-r0: task do_compile: Succeeded
NOTE: Running task 2455 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_install)
NOTE: recipe gnutls-3.7.6-r0: task do_install: Started
NOTE: recipe gnutls-3.7.6-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_populate_sysroot)
NOTE: Running task 2457 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_package)
NOTE: recipe gnutls-3.7.6-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.6-r0: task do_package: Started
NOTE: recipe gnutls-3.7.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2458 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2459 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_package: Succeeded
NOTE: Running task 2460 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_packagedata)
NOTE: recipe gnutls-3.7.6-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.6-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2464 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2465 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2466 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_configure: Succeeded
NOTE: Running task 2468 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2469 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_compile: Succeeded
NOTE: Running task 2470 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2471 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install)
NOTE: recipe elfutils-0.187-r0: task do_install: Started
NOTE: recipe elfutils-0.187-r0: task do_install: Succeeded
NOTE: Running task 2472 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2473 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_package)
NOTE: Running task 2474 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_package: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2475 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2476 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2477 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2478 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2479 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_packagedata)
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2486 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2487 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2488 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2489 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2490 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package_write_rpm)
NOTE: Running task 2491 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-218-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-218-r0: task do_package_qa: Started
NOTE: recipe diffoscope-218-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-218-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2492 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_build)
NOTE: Tasks Summary: Attempted 2492 tasks of which 2309 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-src went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dbg went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-staticdev went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dev went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-doc went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-bin went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2 went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-cs went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-da went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-de went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-eo went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-es went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fi went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fur went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hu went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-id went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-it went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ja went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-nl went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pl went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pt-br went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ro went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ru went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sv went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-uk went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-vi went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-zh-cn went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6974448507061704156==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-217-218.patch"

From 9860a2bf7c090413c08dbf0f98717ad551c867a9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 15:20:07 +0000
Subject: [PATCH] diffoscope: upgrade 217 -> 218

---
 .../diffoscope/{diffoscope_217.bb => diffoscope_218.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_217.bb => diffoscope_218.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_217.bb b/meta/recipes-support/diffoscope/diffoscope_218.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_217.bb
rename to meta/recipes-support/diffoscope/diffoscope_218.bb
index d5ab38f8ad..eceba47186 100644
--- a/meta/recipes-support/diffoscope/diffoscope_217.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_218.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1e9791e3f718ca809d98fb319b150ce6222a682b4009ea00838b9d8705003950"
+SRC_URI[sha256sum] = "68056e6d5382bfe16662c60d47bf710aa7b0ef43bfde1172fad694bc487279e3"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.31.1


--===============6974448507061704156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1661 targets, 49 skipped, 0 masked, 0 errors.
Removing 112 recipes from the core2-32 sysroot...done.
Removing 120 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============6974448507061704156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (888 cached, 1 parsed). 1660 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-c5d7e5de2c42186536a39731ace38b9246e1cf22"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c5d7e5de2c42186536a39731ace38b9246e1cf22"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 79 Local 10 Mirrors 0 Missed 69 Current 644 (12% match, 90% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 695 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1442 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libidn2/2.3.2-r0/temp/log.do_packagedata_setscene.1428371
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 722 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_package_setscene)
NOTE: Running task 1586 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_fetch)
NOTE: Running task 1622 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_fetch)
NOTE: Running task 1636 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1663 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: Running task 1824 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1825 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1842 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: recipe file-5.42-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Succeeded
NOTE: Running task 1909 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1935 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_unpack)
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: recipe file-5.42-r0: task do_fetch: Succeeded
NOTE: Running task 1994 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: Running task 2031 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_unpack)
NOTE: Running task 2032 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 2042 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2078 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 2119 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 2120 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2121 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2122 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2123 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Started
NOTE: Running task 2124 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2125 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2126 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2127 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2128 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2129 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2158 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe file-5.42-r0: task do_unpack: Started
NOTE: recipe file-5.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: recipe diffoscope-218-r0: task do_fetch: Started
NOTE: recipe diffoscope-218-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 2257 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_unpack)
NOTE: Running task 2258 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: Running task 2259 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: Running task 2300 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2301 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: Running task 2302 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2303 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: Running task 2304 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2305 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_unpack: Started
NOTE: Running task 2306 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: recipe diffoscope-218-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.0021-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: Running task 2307 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2308 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2309 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2310 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-218-r0: task do_unpack: Succeeded
NOTE: Running task 2311 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 2312 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 2313 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe file-5.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2314 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2315 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0021-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-218-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.42-r0: task do_unpack: Succeeded
NOTE: Running task 2316 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_patch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe file-5.42-r0: task do_patch: Started
NOTE: Running task 2317 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2318 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.42-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-218-r0: task do_patch: Succeeded
NOTE: Running task 2319 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_patch)
NOTE: Running task 2320 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.2-r0: task do_package_setscene: Started
NOTE: recipe diffoscope-218-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2321 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2322 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_deploy_source_date_epoch)
NOTE: Running task 2323 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2324 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2325 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2326 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Started
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe diffoscope-218-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-218-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2327 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_populate_lic: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: Running task 2328 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_lic unihash changed to 3817c5fd80496be4dd856d6c03808d237771c1b39d5c8474d97c3332cb80e14d
NOTE: recipe libidn2-2.3.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 2329 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2347 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_configure)
NOTE: Running task 2348 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2350 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2351 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2352 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: Running task 2353 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_configure)
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 2354 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2355 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: Running task 2356 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2357 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Started
NOTE: recipe file-5.42-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe diffoscope-218-r0: task do_configure: Started
NOTE: Running task 2358 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2359 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2360 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe diffoscope-218-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2362 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2363 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_compile: Started
NOTE: Running task 2364 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: Running task 2365 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: Running task 2366 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2369 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe vim-9.0.0021-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to af9e4317f92f9aec7daa8db2de888a422ab15babc9e9f6ee7280ddf3a723c909
NOTE: Running task 2398 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_configure)
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: Running task 2399 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.6-r0: task do_configure: Started
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0021-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2400 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0021-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 2402 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2403 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-9.0.0021-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 250b52555fa08fd77497226f2c08fc3fe6a0eba0cf634835d5c948be08b9c8ab
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2414 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: Running task 2415 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2416 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2417 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2419 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2422 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe vim-9.0.0021-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2423 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2424 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2425 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2426 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2428 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe vim-9.0.0021-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2429 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: Running task 2430 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe vim-9.0.0021-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-218-r0: task do_compile: Succeeded
NOTE: Running task 2431 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe diffoscope-218-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe diffoscope-218-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package)
NOTE: Running task 2434 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2435 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: recipe diffoscope-218-r0: task do_package: Started
NOTE: recipe diffoscope-218-r0: task do_populate_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2436 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: Running task 2437 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2438 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-218-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2439 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: Running task 2440 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-218-r0: task do_package: Succeeded
NOTE: Running task 2441 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_packagedata)
NOTE: recipe diffoscope-218-r0: task do_packagedata: Started
NOTE: recipe diffoscope-218-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2442 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2443 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2444 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2445 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2446 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2447 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 2448 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: Running task 2449 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2450 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 2451 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2452 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.42-r0: task do_configure: Succeeded
NOTE: Running task 2453 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.42-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2454 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2455 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 2456 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe file-5.42-r0: task do_compile: Succeeded
NOTE: Running task 2457 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_install)
NOTE: recipe file-5.42-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.42-r0: task do_install: Succeeded
NOTE: Running task 2458 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_populate_sysroot)
NOTE: Running task 2459 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_package)
NOTE: recipe file-5.42-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.42-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2460 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.0021-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe file-5.42-r0: task do_package: Succeeded
NOTE: Running task 2464 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_packagedata)
NOTE: recipe file-5.42-r0: task do_packagedata: Started
NOTE: recipe file-5.42-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2466 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2467 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_compile: Succeeded
NOTE: Running task 2468 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0021-r0: task do_install: Started
NOTE: recipe vim-9.0.0021-r0: task do_install: Succeeded
NOTE: Running task 2469 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.0021-r0: task do_package: Started
NOTE: recipe vim-9.0.0021-r0: task do_package: Succeeded
NOTE: Running task 2470 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.0021-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0021-r0: task do_packagedata: Succeeded
NOTE: Running task 2471 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0021-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0021-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_configure: Succeeded
NOTE: Running task 2472 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_compile)
NOTE: recipe gnutls-3.7.6-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.6-r0: task do_compile: Succeeded
NOTE: Running task 2473 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_install)
NOTE: recipe gnutls-3.7.6-r0: task do_install: Started
NOTE: recipe gnutls-3.7.6-r0: task do_install: Succeeded
NOTE: Running task 2474 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_populate_sysroot)
NOTE: Running task 2475 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_package)
NOTE: recipe gnutls-3.7.6-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.6-r0: task do_package: Started
NOTE: recipe gnutls-3.7.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2476 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2477 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_package: Succeeded
NOTE: Running task 2478 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_packagedata)
NOTE: recipe gnutls-3.7.6-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.6-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2479 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2480 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2481 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2482 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2483 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2484 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2485 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2487 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_compile: Succeeded
NOTE: Running task 2488 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2489 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install)
NOTE: recipe elfutils-0.187-r0: task do_install: Started
NOTE: recipe elfutils-0.187-r0: task do_install: Succeeded
NOTE: Running task 2490 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2491 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_package)
NOTE: Running task 2492 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_package: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2493 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2494 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2495 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2496 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2497 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_package: Succeeded
NOTE: Running task 2498 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_packagedata)
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2499 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2503 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2504 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2505 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2506 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2507 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2508 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package_write_rpm)
NOTE: Running task 2509 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-218-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-218-r0: task do_package_qa: Started
NOTE: recipe diffoscope-218-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-218-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2510 of 2510 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_build)
NOTE: Tasks Summary: Attempted 2510 tasks of which 2327 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-src went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dbg went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-staticdev went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dev went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-doc went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-bin went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2 went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-cs went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-da went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-de went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-eo went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-es went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fi went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fur went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hu went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-id went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-it went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ja went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-nl went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pl went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pt-br went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ro went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ru went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sv went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-uk went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-vi went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-zh-cn went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6974448507061704156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-217.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-218.dist-info

--===============6974448507061704156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1660 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-c5d7e5de2c42186536a39731ace38b9246e1cf22"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c5d7e5de2c42186536a39731ace38b9246e1cf22"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 79 Local 10 Mirrors 0 Missed 69 Current 640 (12% match, 90% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 691 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1442 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libidn2/2.3.2-r0/temp/log.do_packagedata_setscene.1961876
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 718 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_package_setscene)
NOTE: Running task 1586 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_fetch)
NOTE: Running task 1622 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_fetch)
NOTE: Running task 1636 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1663 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: recipe file-5.42-r0: task do_fetch: Started
NOTE: Running task 1818 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1819 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1836 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: Running task 1886 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1898 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_unpack)
NOTE: recipe file-5.42-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: Running task 1946 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_unpack)
NOTE: Running task 1947 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1948 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 2024 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 2060 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_fetch)
NOTE: Running task 2080 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2081 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 2082 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2083 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Started
NOTE: Running task 2105 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe file-5.42-r0: task do_unpack: Started
NOTE: recipe file-5.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2106 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2107 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2108 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2109 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2110 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2111 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2141 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: recipe diffoscope-218-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-218-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: Running task 2196 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_unpack)
NOTE: Running task 2197 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2198 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 2246 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: Running task 2247 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.0021-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: Running task 2284 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2285 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2286 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2287 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.0021-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-218-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2288 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 2289 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2290 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2291 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2292 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2293 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe diffoscope-218-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2294 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe file-5.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2295 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: Running task 2296 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-218-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.42-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: Running task 2298 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2299 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.42-r0: task do_patch: Started
NOTE: recipe file-5.42-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2300 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Succeeded
NOTE: Running task 2301 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-218-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2302 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_package_setscene: Started
NOTE: Running task 2303 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_patch)
NOTE: Running task 2304 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_deploy_source_date_epoch)
NOTE: Running task 2305 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2306 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-218-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-218-r0: task do_populate_lic: Started
NOTE: Running task 2307 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2308 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2309 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe diffoscope-218-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_lic unihash changed to 3817c5fd80496be4dd856d6c03808d237771c1b39d5c8474d97c3332cb80e14d
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2310 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_package_setscene: Succeeded
NOTE: recipe diffoscope-218-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2311 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: Setscene tasks completed
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: Running task 2329 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2331 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata)
NOTE: Running task 2332 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2333 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2334 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_configure)
NOTE: Running task 2335 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: Running task 2336 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2337 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 2338 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2339 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe diffoscope-218-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: recipe file-5.42-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Running task 2340 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe diffoscope-218-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2342 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2343 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_compile)
NOTE: recipe vim-9.0.0021-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2344 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2345 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-218-r0: task do_compile: Started
NOTE: Running task 2346 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2347 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2348 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe vim-9.0.0021-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2349 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_configure)
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2350 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 30d681a7898866610529e06c1c10616880c5e9a72925dc44cdcc1d2742be64ac
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_patch: Succeeded
NOTE: Running task 2381 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: Running task 2382 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0021-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 2383 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2384 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2385 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9fda95dd6f12a3b51c5681e9d1b5973db1d6c33406397ccc74c1acb3ca3d9e73
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2397 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2398 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: Running task 2399 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: Running task 2400 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2401 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2402 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 2403 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: Running task 2404 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe vim-9.0.0021-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2406 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: Running task 2407 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2408 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2409 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2410 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2411 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe diffoscope-218-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_install)
NOTE: recipe vim-9.0.0021-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2413 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 2414 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe diffoscope-218-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe vim-9.0.0021-r0: task do_configure: Started
NOTE: recipe diffoscope-218-r0: task do_install: Succeeded
NOTE: Running task 2415 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package)
NOTE: Running task 2416 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_sysroot)
NOTE: recipe diffoscope-218-r0: task do_package: Started
NOTE: recipe diffoscope-218-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2419 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe diffoscope-218-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 2420 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2421 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2422 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-218-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-218-r0: task do_packagedata: Started
NOTE: recipe diffoscope-218-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2424 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2425 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2427 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2429 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 2430 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe file-5.42-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: Running task 2431 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_compile)
NOTE: recipe file-5.42-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.42-r0: task do_compile: Succeeded
NOTE: Running task 2432 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_install)
NOTE: recipe file-5.42-r0: task do_install: Started
NOTE: recipe file-5.42-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_populate_sysroot)
NOTE: Running task 2434 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_package)
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2435 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe file-5.42-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.42-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: Running task 2436 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 2438 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe file-5.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_configure: Succeeded
NOTE: Running task 2439 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2440 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.0021-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2441 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2442 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe file-5.42-r0: task do_package: Succeeded
NOTE: Running task 2443 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_packagedata)
NOTE: recipe file-5.42-r0: task do_packagedata: Started
NOTE: recipe file-5.42-r0: task do_packagedata: Succeeded
NOTE: Running task 2444 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 2445 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2446 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2447 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2448 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2449 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_compile: Succeeded
NOTE: Running task 2450 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0021-r0: task do_install: Started
NOTE: recipe vim-9.0.0021-r0: task do_install: Succeeded
NOTE: Running task 2451 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.0021-r0: task do_package: Started
NOTE: recipe vim-9.0.0021-r0: task do_package: Succeeded
NOTE: Running task 2452 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.0021-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0021-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0021-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0021-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_compile)
NOTE: recipe gnutls-3.7.6-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.6-r0: task do_compile: Succeeded
NOTE: Running task 2455 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_install)
NOTE: recipe gnutls-3.7.6-r0: task do_install: Started
NOTE: recipe gnutls-3.7.6-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_populate_sysroot)
NOTE: Running task 2457 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_package)
NOTE: recipe gnutls-3.7.6-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.6-r0: task do_package: Started
NOTE: recipe gnutls-3.7.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2458 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2459 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_package: Succeeded
NOTE: Running task 2460 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_packagedata)
NOTE: recipe gnutls-3.7.6-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.6-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2464 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2465 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2466 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_configure: Succeeded
NOTE: Running task 2468 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2469 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_compile: Succeeded
NOTE: Running task 2470 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2471 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install)
NOTE: recipe elfutils-0.187-r0: task do_install: Started
NOTE: recipe elfutils-0.187-r0: task do_install: Succeeded
NOTE: Running task 2472 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2473 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_package)
NOTE: Running task 2474 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_package: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2475 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2476 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2477 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2478 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2479 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_packagedata)
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2486 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2487 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2488 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2489 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2490 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package_write_rpm)
NOTE: Running task 2491 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-218-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-218-r0: task do_package_qa: Started
NOTE: recipe diffoscope-218-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-218-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2492 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_build)
NOTE: Tasks Summary: Attempted 2492 tasks of which 2309 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-src went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dbg went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-staticdev went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dev went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-doc went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-bin went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2 went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-cs went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-da went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-de went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-eo went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-es went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fi went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fur went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hu went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-id went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-it went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ja went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-nl went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pl went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pt-br went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ro went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ru went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sv went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-uk went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-vi went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-zh-cn went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6974448507061704156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1660 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-c5d7e5de2c42186536a39731ace38b9246e1cf22"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c5d7e5de2c42186536a39731ace38b9246e1cf22"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 83 Local 10 Mirrors 0 Missed 73 Current 636 (12% match, 89% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 687 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1201 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1433 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1434 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libidn2/2.3.2-r0/temp/log.do_packagedata_setscene.1776715
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 718 of 719 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_package_setscene)
NOTE: Running task 1435 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1577 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_fetch)
NOTE: Running task 1613 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_fetch)
NOTE: Running task 1627 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: Running task 1654 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1809 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe file-5.42-r0: task do_fetch: Started
NOTE: Running task 1810 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1827 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Succeeded
NOTE: Running task 1917 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1936 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_unpack)
NOTE: recipe file-5.42-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: Running task 1980 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_unpack)
NOTE: Running task 1981 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1997 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 2015 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 2049 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 2090 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: Running task 2091 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2092 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2093 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2094 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2095 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2096 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2097 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2098 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2099 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2100 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2129 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Started
NOTE: recipe file-5.42-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
NOTE: recipe diffoscope-218-r0: task do_fetch: Started
NOTE: recipe diffoscope-218-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 2192 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_unpack)
NOTE: Running task 2193 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 2194 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 2241 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2242 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 2273 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2274 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2275 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2276 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2277 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2278 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 2279 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2280 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: Running task 2281 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2282 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 2283 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe diffoscope-218-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2284 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: Running task 2285 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2286 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: Running task 2287 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe vim-9.0.0021-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-218-r0: task do_patch: Started
NOTE: Running task 2288 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.42-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2289 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.42-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.42-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-218-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2292 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Succeeded
NOTE: Running task 2293 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_package_setscene: Started
NOTE: recipe diffoscope-218-r0: task do_patch: Succeeded
NOTE: Running task 2294 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_patch)
NOTE: Running task 2295 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_deploy_source_date_epoch)
NOTE: Running task 2296 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_lic)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2297 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-218-r0: task do_populate_lic: Started
NOTE: Running task 2298 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-218-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: Running task 2300 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe diffoscope-218-r0: task do_populate_lic: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_lic unihash changed to 3817c5fd80496be4dd856d6c03808d237771c1b39d5c8474d97c3332cb80e14d
NOTE: Running task 2301 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2302 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe libidn2-2.3.2-r0: task do_package_setscene: Succeeded
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2320 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 2321 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_configure)
NOTE: Running task 2323 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata)
NOTE: Running task 2324 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2325 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe diffoscope-218-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2326 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 2327 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: Running task 2328 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: Running task 2329 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 2330 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.42-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Started
NOTE: recipe diffoscope-218-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2331 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-218-r0: task do_configure: Succeeded
NOTE: Running task 2332 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2333 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2334 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: Running task 2336 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe diffoscope-218-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2337 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2338 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe vim-9.0.0021-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2339 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe vim-9.0.0021-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2340 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: Running task 2343 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d0296acc6b732820a032bda061838f1d6ab1682042cef2156b1285de62717773
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0021-r0: task do_patch: Succeeded
NOTE: Running task 2372 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2374 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0021-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2375 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2e428de46361edb92c601b3851f60a39cb2d85a3d3601d44e46ca5d0c0acdb58
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2387 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2388 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: Running task 2389 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2390 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: Running task 2391 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2392 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe vim-9.0.0021-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 2395 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2396 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2397 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2398 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2399 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: Running task 2400 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe vim-9.0.0021-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2401 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_configure: Started
NOTE: Running task 2403 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe diffoscope-218-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: Running task 2404 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-218-r0: task do_install: Started
NOTE: recipe diffoscope-218-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package)
NOTE: Running task 2406 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: recipe diffoscope-218-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-218-r0: task do_package: Started
NOTE: Running task 2407 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2409 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe diffoscope-218-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2410 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 2411 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2412 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-218-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_packagedata)
NOTE: recipe diffoscope-218-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-218-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2414 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2415 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2416 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2417 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2419 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: Running task 2422 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 2423 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: Running task 2424 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: Running task 2425 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe file-5.42-r0: task do_configure: Succeeded
NOTE: Running task 2426 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_compile)
NOTE: recipe file-5.42-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2427 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2428 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: Running task 2430 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2431 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: Running task 2432 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe file-5.42-r0: task do_compile: Succeeded
NOTE: Running task 2433 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe file-5.42-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 2434 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe file-5.42-r0: task do_install: Succeeded
NOTE: Running task 2435 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_populate_sysroot)
NOTE: Running task 2436 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.42-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.42-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2437 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_configure: Succeeded
NOTE: Running task 2438 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.0021-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2439 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 2440 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2441 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2442 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2443 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe gnutls-3.7.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe gnutls-3.7.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2444 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_configure)
NOTE: recipe file-5.42-r0: task do_package: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_configure: Started
NOTE: Running task 2445 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_packagedata)
NOTE: recipe file-5.42-r0: task do_packagedata: Started
NOTE: recipe file-5.42-r0: task do_packagedata: Succeeded
NOTE: Running task 2446 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2447 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2448 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 2449 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0021-r0: task do_compile: Succeeded
NOTE: Running task 2450 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0021-r0: task do_install: Started
NOTE: recipe vim-9.0.0021-r0: task do_install: Succeeded
NOTE: Running task 2451 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.0021-r0: task do_package: Started
NOTE: recipe vim-9.0.0021-r0: task do_package: Succeeded
NOTE: Running task 2452 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.0021-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0021-r0: task do_packagedata: Succeeded
NOTE: Running task 2453 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0021-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0021-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_compile)
NOTE: recipe gnutls-3.7.6-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.6-r0: task do_compile: Succeeded
NOTE: Running task 2455 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_install)
NOTE: recipe gnutls-3.7.6-r0: task do_install: Started
NOTE: recipe gnutls-3.7.6-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_populate_sysroot)
NOTE: Running task 2457 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_package)
NOTE: recipe gnutls-3.7.6-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.6-r0: task do_package: Started
NOTE: recipe gnutls-3.7.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2458 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2459 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_package: Succeeded
NOTE: Running task 2460 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_packagedata)
NOTE: recipe gnutls-3.7.6-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.6-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2464 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2465 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2466 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_configure: Succeeded
NOTE: Running task 2468 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2469 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_compile: Succeeded
NOTE: Running task 2470 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2471 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install)
NOTE: recipe elfutils-0.187-r0: task do_install: Started
NOTE: recipe elfutils-0.187-r0: task do_install: Succeeded
NOTE: Running task 2472 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2473 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_package)
NOTE: Running task 2474 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_package: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2475 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2476 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2477 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_configure)
NOTE: recipe binutils-2.38-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2478 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Started
NOTE: recipe binutils-2.38-r0: task do_configure: Succeeded
NOTE: Running task 2479 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_packagedata)
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_install)
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package)
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_compile: Succeeded
NOTE: Running task 2486 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_install: Succeeded
NOTE: Running task 2487 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package)
NOTE: recipe binutils-2.38-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_package: Succeeded
NOTE: Running task 2488 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_packagedata)
NOTE: recipe binutils-2.38-r0: task do_packagedata: Started
NOTE: recipe binutils-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2489 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_package_write_rpm)
NOTE: Running task 2490 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package_write_rpm)
NOTE: Running task 2491 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_package_qa)
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-218-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-218-r0: task do_package_qa: Started
NOTE: recipe diffoscope-218-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-218-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2492 of 2492 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_218.bb:do_build)
NOTE: Tasks Summary: Attempted 2492 tasks of which 2295 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-src went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dbg went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-staticdev went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dev went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-doc went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-bin went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2 went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-cs went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-da went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-de went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-eo went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-es went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fi went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fur went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hu went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-id went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-it went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ja went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-nl went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pl went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pt-br went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ro went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ru went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sr went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sv went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-uk went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-vi went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-zh-cn went backwards which would break package feeds (from 0:2.3.3-r0 to 0:2.3.2-r0) [version-going-backwards]
ERROR: libidn2-2.3.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6974448507061704156==--

