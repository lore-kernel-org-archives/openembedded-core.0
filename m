Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76799C77B70
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.32113.1680384533094011503
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H1i498DP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101873eb93098-461c3a13-bc29-45dd-9f94-a0609dc2677c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/G8m32viyYqualVFJeB/aZUJ/sRrGHfR9NiMvU8Zn2Y=;
	b=H1i498DPboaf/dL9cCaGwqFiC05ZzwMBFuc6hoNvQ1pr5JBvTfj5ugipyOR9+8rz
	y/6v89SpS0HDrK7fUpwqrq/5lCsQaLbCrTYaTC1obDVvnjG9afa5kwV0pe5rLmXohVm
	I31DbbmH4KzYxZUmtjouLG+oyLTCrCPyZmmvndRM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/G8m32viyYqualVFJeB/aZUJ/sRrGHfR9NiMvU8Zn2Y=;
	b=O62RQopT/nc4udHEWUanCvWAFTpauLiu3KevyK2LD/iBY3xWT0VZ/pbmTpHH3YQp
	imyGLXy7txw05yCBzv3g4pmJ4hCZQsrGC9SiVEMrir8yPH9ccanqBXFbAFwVQ/u9vph
	5jRZKybJ5S2hfHIFw2le7X6aF4ubqM2hGCkoNBTQ=
Content-Type: multipart/mixed; boundary="===============1739639610226576968=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 240 SUCCEEDED
Message-ID: <010101873eb93098-461c3a13-bc29-45dd-9f94-a0609dc2677c-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179570

--===============1739639610226576968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *240* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-236-240.patch
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
--===============1739639610226576968==
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
DISTRO_VERSION       = "4.1+snapshot-7a785f252542ade02d97ef3324b79c92b7068565"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a785f252542ade02d97ef3324b79c92b7068565"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 117 Local 35 Mirrors 0 Missed 82 Current 610 (29% match, 88% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1017 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: Running task 1023 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 1209 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1210 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: Running task 1371 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1372 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1373 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1374 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1494 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1538 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1543 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1544 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_fetch)
NOTE: Running task 1553 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: Running task 1559 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: Running task 1561 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: Running task 1562 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: Running task 1579 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: Running task 1630 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 1649 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1652 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1819 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1820 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1821 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1831 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 1972 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 1994 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2046 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: Running task 2089 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2090 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 2091 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2092 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2093 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2094 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2172 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2173 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2174 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2175 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Succeeded
NOTE: Running task 2189 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_patch)
NOTE: Running task 2192 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: Running task 2199 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe diffoscope-240-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: Running task 2288 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2289 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe diffoscope-240-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Started
NOTE: Running task 2290 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: Running task 2291 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_unpack)
NOTE: Running task 2292 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2293 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2294 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: Running task 2295 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 2296 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2297 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2298 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2299 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2300 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2301 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2302 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 2303 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2304 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2305 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-240-r0: task do_unpack: Started
NOTE: recipe diffoscope-240-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2306 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2307 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2308 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Started
NOTE: Running task 2309 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: Running task 2310 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-240-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2311 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: Running task 2312 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2313 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: Running task 2314 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2315 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe diffoscope-240-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2316 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2317 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: Running task 2318 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: Running task 2319 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: Running task 2320 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2321 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: Running task 2322 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2323 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2324 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2325 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-240-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2326 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2327 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_deploy_source_date_epoch)
NOTE: Running task 2328 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_lic)
NOTE: Running task 2329 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-240-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2330 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2331 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: Running task 2332 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2333 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2334 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2335 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2336 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-240-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-240-r0: task do_populate_lic: Started
NOTE: Running task 2337 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2338 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe diffoscope-240-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_lic unihash changed to 3de4977b872e4e6e34048de81e21ec15437531477e3f956cdb68c41b39689e14
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2339 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-240-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2340 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2341 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_configure)
NOTE: Running task 2342 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 2343 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: Running task 2344 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-240-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2345 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: Running task 2346 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-240-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2347 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to efb4de3e5edb71ef4b5f21815c105f9ad6fd71806381ecd2a1e5cf14fe4aafc3
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: Running task 2371 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: Running task 2372 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe diffoscope-240-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: Running task 2377 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Succeeded
NOTE: Running task 2378 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1429-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2379 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2380 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 2381 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1429-r0: task do_patch: Succeeded
NOTE: Running task 2382 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7994dc0197a3d7f2ae99e629c620e5b799d87ecde32071472b49df20689399c2
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2395 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-240-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2397 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 2398 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe diffoscope-240-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2399 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe diffoscope-240-r0: task do_install: Succeeded
NOTE: Running task 2400 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: Running task 2401 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_package)
NOTE: Running task 2402 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe diffoscope-240-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-240-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2403 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2404 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: Running task 2405 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: Running task 2406 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe diffoscope-240-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2407 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2408 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2409 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2410 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2411 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2412 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: Running task 2413 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-240-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_packagedata)
NOTE: recipe diffoscope-240-r0: task do_packagedata: Started
NOTE: recipe diffoscope-240-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2415 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: Running task 2416 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2416 tasks of which 2285 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.48762
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============1739639610226576968==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-236-240.patch"

RnJvbSA5Njk4YmUwYmFjNTM2MTY1ODkzOTE1NTdhMzVhZDAxOTE2MDE5ZmJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAyMDoyNTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjM2IC0+IDI0MAoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yMzYuYmIgPT4gZGlmZm9zY29wZV8yNDAuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzIzNi5iYiA9PiBkaWZmb3Njb3BlXzI0
MC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjM2LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI0MC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjM2LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjQwLmJiCmluZGV4IDlmODlmMzVj
MTEuLmUzNzBkNTliM2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMzYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI0MC5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI4NGM0Njg0MGRhZmZmZTAyMjMwNTY3MThlNDI1MGNlYjUyNDg0NDUyYTk5MmI4NWUzNDVl
M2NmOGEyY2Y3ZDRiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc5ZTMwNTM0ZTM0OGE5NWNhZjJm
NGQ3MTM4NDAzYmE0YTQ0ZTY0YTA3NzdhOThiNzFiN2Q4ODczNjM1Y2UzMDIiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJiaW51dGlscyB2aW0gc3F1YXNoZnMtdG9vbHMgcHl0aG9uMy1saWJhcmNoaXZl
LWMgcHl0aG9uMy1tYWdpYyBweXRob24zLXJwbSIKIAotLSAKMi4zOS4yCgo=

--===============1739639610226576968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 236 [default] to 240 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "236" to "240"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 236 [default] to 240 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "236" to "240"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 236 [default] to 240 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "236" to "240"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 236 [default] to 240 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "236" to "240"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 236 [default] to 240 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "236" to "240"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 236 [default] to 240 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "236" to "240"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 236 [default] to 240 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1406019 to 1407444 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "236" to "240"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-236.tar.gz;downloadfilename=diffoscope-236.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-240.tar.gz;downloadfilename=diffoscope-240.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 236 [default] to 240 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "236" to "240"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-236.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-240.dist-info

--===============1739639610226576968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1797 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7a785f252542ade02d97ef3324b79c92b7068565"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a785f252542ade02d97ef3324b79c92b7068565"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 118 Local 36 Mirrors 0 Missed 82 Current 613 (30% match, 88% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 716 of 731 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1017 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: Running task 1023 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 1209 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1210 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1397 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1398 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1399 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1494 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1542 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1543 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_fetch)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1555 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1559 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: Running task 1560 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: Running task 1561 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: Running task 1579 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: Running task 1632 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 1651 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1654 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1825 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1826 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1827 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: Running task 1837 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 1953 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 2013 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2064 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_fetch)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2106 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2107 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2108 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_patch)
NOTE: Running task 2109 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2110 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2112 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2113 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2114 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2115 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2116 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 2117 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: Running task 2210 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: Running task 2217 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe diffoscope-240-r0: task do_fetch: Started
NOTE: Running task 2218 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2234 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2235 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-240-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 2258 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: Running task 2259 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_unpack)
NOTE: Running task 2260 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: Running task 2261 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2303 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2304 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2315 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 2316 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: Running task 2317 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2318 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2319 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: Running task 2320 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-240-r0: task do_unpack: Started
NOTE: Running task 2321 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2322 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2323 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2324 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-240-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2325 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: Running task 2326 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: Running task 2327 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2328 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe diffoscope-240-r0: task do_unpack: Succeeded
NOTE: Running task 2329 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_patch)
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2330 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: Running task 2331 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-240-r0: task do_patch: Started
NOTE: Running task 2332 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 2333 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2334 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 2335 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2336 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2337 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: Running task 2338 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: Running task 2339 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2340 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2341 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-240-r0: task do_patch: Succeeded
NOTE: Running task 2342 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_deploy_source_date_epoch)
NOTE: Running task 2343 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_lic)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2344 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe diffoscope-240-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2345 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 2346 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2347 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2348 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: Running task 2349 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 2350 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2351 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2352 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-240-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-240-r0: task do_populate_lic: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Running task 2353 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2354 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe diffoscope-240-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_lic unihash changed to 3de4977b872e4e6e34048de81e21ec15437531477e3f956cdb68c41b39689e14
NOTE: Running task 2355 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: Running task 2356 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-240-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2357 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: Running task 2358 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2359 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: Running task 2360 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2361 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-240-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2362 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2363 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-240-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3f9758a130d251c4880c63445a0160f24cd01b584f5b00ca41aa64418c0cb3f5
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2386 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_compile)
NOTE: Running task 2388 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: Running task 2394 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe diffoscope-240-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: Running task 2395 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Succeeded
NOTE: Running task 2396 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1429-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2397 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 2398 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1429-r0: task do_patch: Succeeded
NOTE: Running task 2399 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2400 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 36deaa96c352f3b0c6063b0341b3a10810745556a80ce4a4680e35c33ecc2227
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2413 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-240-r0: task do_compile: Succeeded
NOTE: Running task 2414 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_install)
NOTE: recipe diffoscope-240-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2415 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: Running task 2416 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2417 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2418 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe diffoscope-240-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_package)
NOTE: Running task 2420 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_sysroot)
NOTE: recipe diffoscope-240-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-240-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2423 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2424 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe diffoscope-240-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2425 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2426 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: Running task 2427 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2429 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2430 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2431 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe diffoscope-240-r0: task do_package: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: Running task 2432 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_packagedata)
NOTE: recipe diffoscope-240-r0: task do_packagedata: Started
NOTE: recipe diffoscope-240-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2433 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2434 tasks of which 2303 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.4137145
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============1739639610226576968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-236.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-240.dist-info

--===============1739639610226576968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 50 skipped, 0 masked, 0 errors.
Removing 98 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============1739639610226576968==
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
DISTRO_VERSION       = "4.1+snapshot-7a785f252542ade02d97ef3324b79c92b7068565"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a785f252542ade02d97ef3324b79c92b7068565"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 121 Local 35 Mirrors 0 Missed 86 Current 606 (28% match, 88% complete)
Removing 2 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1016 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: Running task 1022 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 1023 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 1202 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1203 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: Running task 1441 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1442 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1443 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1444 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1483 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1531 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1532 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_fetch)
NOTE: Running task 1546 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1547 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1548 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1549 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: Running task 1550 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1551 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: Running task 1569 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: Running task 1602 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: Running task 1621 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 1640 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1643 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1810 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1811 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1812 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1822 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: Running task 1985 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 2034 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_fetch)
NOTE: Running task 2045 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 2078 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2079 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2080 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2081 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2082 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2083 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2176 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: Running task 2183 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Succeeded
NOTE: Running task 2184 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2185 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2186 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2187 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2188 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: Running task 2277 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2278 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-240-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2279 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: Running task 2280 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2281 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe diffoscope-240-r0: task do_fetch: Succeeded
NOTE: Running task 2282 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2283 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2284 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_unpack)
NOTE: Running task 2285 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2286 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: Running task 2287 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2288 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2289 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Succeeded
NOTE: Running task 2290 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Started
NOTE: Running task 2291 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 2292 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2293 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2294 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2295 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-240-r0: task do_unpack: Started
NOTE: Running task 2296 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe diffoscope-240-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2297 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: Running task 2298 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: Running task 2299 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Started
NOTE: Running task 2300 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-240-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: Running task 2301 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2302 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2303 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2304 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: Running task 2305 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-240-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 2306 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2307 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: Running task 2308 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: Running task 2309 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2310 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: Running task 2311 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: Running task 2312 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2313 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2314 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2315 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe diffoscope-240-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-240-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_deploy_source_date_epoch)
NOTE: Running task 2317 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_lic)
NOTE: Running task 2318 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2319 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2320 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2321 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2322 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2323 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: Running task 2324 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2325 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: Running task 2326 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-240-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-240-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2327 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2328 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-240-r0: task do_populate_lic: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_lic unihash changed to 3de4977b872e4e6e34048de81e21ec15437531477e3f956cdb68c41b39689e14
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2329 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2330 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe diffoscope-240-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: Running task 2332 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: Running task 2333 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2334 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: Running task 2335 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2336 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2337 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe diffoscope-240-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2338 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 06b3a116c47dae76b8eab0061a456db7df96bbc7985c500b5d34946249a414a8
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe diffoscope-240-r0: task do_configure: Succeeded
NOTE: Running task 2366 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: Running task 2369 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-240-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Succeeded
NOTE: Running task 2370 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1429-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2371 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-9.0.1429-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 2372 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2373 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2374 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f72d0fa918541ffac38106c61c0e1fbcf619abfac616beca13b0c759dc5962a5
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe diffoscope-240-r0: task do_compile: Succeeded
NOTE: Running task 2388 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-240-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2389 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2392 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe diffoscope-240-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_package)
NOTE: Running task 2394 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe diffoscope-240-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-240-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2395 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2396 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe diffoscope-240-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2398 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: Running task 2399 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2400 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2402 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2403 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-240-r0: task do_package: Succeeded
NOTE: Running task 2404 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2405 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe diffoscope-240-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2406 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe diffoscope-240-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2407 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2408 tasks of which 2271 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.13618
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============1739639610226576968==
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
DISTRO_VERSION       = "4.1+snapshot-7a785f252542ade02d97ef3324b79c92b7068565"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7a785f252542ade02d97ef3324b79c92b7068565"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 117 Local 35 Mirrors 0 Missed 82 Current 610 (29% match, 88% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1017 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: Running task 1023 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 1209 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1210 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: Running task 1459 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1460 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1461 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1462 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1494 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1542 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1543 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_fetch)
NOTE: Running task 1558 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1559 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: Running task 1560 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1561 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: Running task 1578 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: Running task 1620 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: Running task 1630 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 1649 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1652 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1819 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1820 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1821 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1831 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: Running task 1993 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 2045 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_fetch)
NOTE: Running task 2053 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 2089 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2090 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2091 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 2092 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2093 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2094 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2187 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: Running task 2192 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2235 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2236 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2237 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_patch)
NOTE: Running task 2238 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2239 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-240-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Started
NOTE: recipe diffoscope-240-r0: task do_fetch: Succeeded
NOTE: Running task 2288 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_unpack)
NOTE: Running task 2289 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: Running task 2290 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2291 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2292 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: Running task 2293 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: Running task 2294 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2295 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: Running task 2296 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Started
NOTE: Running task 2297 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2298 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: Running task 2299 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2300 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2301 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2302 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1429-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2303 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-240-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 2304 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: Running task 2305 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe diffoscope-240-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Succeeded
NOTE: Running task 2306 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2307 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_deploy_source_date_epoch)
NOTE: Running task 2308 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2309 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe diffoscope-240-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Started
NOTE: Running task 2310 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 2311 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: Running task 2312 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2313 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe diffoscope-240-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2314 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: Running task 2315 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: Running task 2317 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2318 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2319 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2320 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2321 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2322 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2323 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2324 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2325 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2326 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2327 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2328 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe diffoscope-240-r0: task do_patch: Succeeded
NOTE: Running task 2329 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_deploy_source_date_epoch)
NOTE: Running task 2330 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_lic)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-240-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: Running task 2331 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2332 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2333 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2334 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2335 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2336 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe diffoscope-240-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-240-r0: task do_populate_lic: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 2337 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-240-r0: task do_populate_lic: Succeeded
NOTE: Running task 2338 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_lic unihash changed to 3de4977b872e4e6e34048de81e21ec15437531477e3f956cdb68c41b39689e14
NOTE: Running task 2339 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: Running task 2340 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe diffoscope-240-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 2342 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2343 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: Running task 2344 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6ac183ca786c18657042ded50663fea0f9f2566d1d4c36d6b880e26722f9c86c
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2372 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe diffoscope-240-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2373 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: Running task 2374 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-240-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2376 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: Running task 2377 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe vim-9.0.1429-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-240-r0: task do_compile: Started
NOTE: Running task 2378 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe vim-9.0.1429-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2379 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-9.0.1429-r0: task do_patch: Succeeded
NOTE: Running task 2380 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2381 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 2382 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ee640553c9ed7531eb4120f495a1c27eae33b911eb232233bf76a7c935b60339
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1429-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2395 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-240-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_install)
NOTE: recipe diffoscope-240-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2397 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2398 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2399 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe diffoscope-240-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: Running task 2400 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_package)
NOTE: Running task 2401 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2402 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2403 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: recipe diffoscope-240-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-240-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe diffoscope-240-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2405 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: Running task 2406 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2407 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2408 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2409 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2410 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2411 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2413 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe diffoscope-240-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_240.bb:do_packagedata)
NOTE: recipe diffoscope-240-r0: task do_packagedata: Started
NOTE: recipe diffoscope-240-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2415 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: Running task 2416 of 2523 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2416 tasks of which 2285 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.4171866
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============1739639610226576968==--

