Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352A7C64ED9
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.10284.1676508396009394288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=EgkRSLz8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018657b00387-b85fd75e-6a5e-471a-b265-0d43606d17ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F/bEuIUJxcwbOWT5HSKVJVdDTmlD6FvyoFVB0gyJiYw=;
	b=EgkRSLz8hwuxojAJsDpLrZaorAnpjiZsM4ggS1fVfjKvG0I4MGTB3MBMBbXB2rXT
	3ArdeUj2Cn+xitrI9BDEdRRCPvI1Ptjha78VHrmRpYgWE/zuCWgeMs1GP77CQQGposK
	5CoLXZvZZlUtadA/rzmSWAmzYWolOgp9dnK8PMTg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F/bEuIUJxcwbOWT5HSKVJVdDTmlD6FvyoFVB0gyJiYw=;
	b=MLJFydg0P0ntKR8psfcFDJZD004NYU7gtRrIP+L5dw+kIxxAsurBuemzjWcA+ptX
	HPIhMNpxdv7jlD8F3yx1WNFpr/Tig7HM3hQthnxxjELeiOotQAYWhf18UsO6nq+H4q9
	xFHx9bonHMc3nD227uiNe8FsVWhzOh1Gq+SWt3VQ=
Content-Type: multipart/mixed; boundary="===============4467620469214100362=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 235 SUCCEEDED
Message-ID: <0101018657b00387-b85fd75e-6a5e-471a-b265-0d43606d17ab-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:38 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177269

--===============4467620469214100362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *235* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-234-235.patch
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
--===============4467620469214100362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 72 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-47a7a1406c23390e9c87c050acd6fbf13a71805e"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:47a7a1406c23390e9c87c050acd6fbf13a71805e"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 110 Local 17 Mirrors 0 Missed 93 Current 618 (15% match, 87% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 668 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.87.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.87.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/curl/7.87.0-r0/temp/log.do_packagedata_setscene.3273024
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 725 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_package_setscene)
NOTE: recipe curl-7.87.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 867 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 969 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1149 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1185 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Started
NOTE: Running task 1210 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1232 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1235 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1237 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Succeeded
NOTE: Running task 1272 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_unpack)
NOTE: Running task 1350 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1351 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1352 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: Running task 1407 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1409 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 1425 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_fetch)
NOTE: Running task 1437 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 1438 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 1439 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1440 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 1441 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 1442 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe curl-7.87.0-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1527 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1528 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 1536 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 1537 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-235-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 1538 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: Running task 1539 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1540 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1541 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1293-r0: task do_fetch: Started
NOTE: recipe diffoscope-235-r0: task do_fetch: Succeeded
NOTE: Running task 1542 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 1543 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 1544 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 1545 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: Running task 1546 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 1547 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1548 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe vim-9.0.1293-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: Running task 1549 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe diffoscope-235-r0: task do_unpack: Started
NOTE: Running task 1550 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 1551 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1552 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 1553 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: Running task 1554 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 1555 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-235-r0: task do_unpack: Succeeded
NOTE: Running task 1556 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1557 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 1558 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 1559 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe diffoscope-235-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: Running task 1560 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1561 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1563 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 1564 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1565 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1566 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1567 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe diffoscope-235-r0: task do_patch: Succeeded
NOTE: Running task 1568 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1570 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 1572 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-235-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-235-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1575 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-235-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_lic unihash changed to c53637343f5603ecce0eec7e6eb5caa7b2c5f2624cfbcff53f2600c487e54abe
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-235-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1576 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4817efef4b707245ab88d5266d93bb6526fbc3fb945995561611618574018e1c
NOTE: Running task 1577 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1578 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1579 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: Running task 1581 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Succeeded
NOTE: Running task 1582 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1583 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe curl-7.87.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 726 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-9.0.1293-r0: task do_unpack: Succeeded
NOTE: Running task 1588 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe vim-9.0.1293-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9c037122271d20eab942bcef627c8daf1e16fc02b8b7bbc0edd2c42912c38dbc
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1589 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 1798 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1842 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure_ptest_base)
NOTE: recipe vim-9.0.1293-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2084 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2087 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2096 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Started
NOTE: Running task 2151 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2152 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2153 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2191 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2192 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2229 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2280 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2282 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2284 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: Running task 2287 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2305 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2319 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2320 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2358 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe curl-7.87.0-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2359 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe diffoscope-235-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2360 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2361 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2362 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: Running task 2363 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: Running task 2365 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_install: Started
NOTE: recipe vim-9.0.1293-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe curl-7.87.0-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2366 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: Running task 2368 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2369 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe diffoscope-235-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2370 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2371 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe diffoscope-235-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-235-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Running task 2373 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe diffoscope-235-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: Running task 2375 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2376 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: recipe pango-1.50.12-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install_ptest_base)
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2378 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2379 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: Running task 2380 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package)
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe pango-1.50.12-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe diffoscope-235-r0: task do_compile: Succeeded
NOTE: Running task 2382 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-235-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2384 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2385 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2387 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2389 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: Running task 2390 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2391 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-235-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package)
NOTE: Running task 2393 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe diffoscope-235-r0: task do_package: Started
NOTE: recipe diffoscope-235-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2395 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2396 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe diffoscope-235-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2397 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: Running task 2398 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2399 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Started
NOTE: Running task 2400 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 2401 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2402 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe diffoscope-235-r0: task do_package: Succeeded
NOTE: Running task 2403 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_packagedata)
NOTE: recipe diffoscope-235-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Succeeded
NOTE: Running task 2405 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe diffoscope-235-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2406 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2407 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2408 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2409 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_install: Succeeded
NOTE: Running task 2411 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2412 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot)
NOTE: Running task 2413 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_package)
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: Running task 2417 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2419 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2420 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2422 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2423 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2424 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: Running task 2426 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2427 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: Running task 2428 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2429 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: Running task 2433 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe file-5.44-r0: task do_compile: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2434 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: Running task 2435 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2436 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: Running task 2437 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 2438 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2439 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_install: Succeeded
NOTE: Running task 2440 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot)
NOTE: Running task 2441 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2442 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.44-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2443 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 2444 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: Running task 2445 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2447 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2448 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 2449 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe file-5.44-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2451 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_packagedata: Succeeded
NOTE: Running task 2452 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2453 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 2455 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 2456 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2457 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2458 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2459 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2460 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2461 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2462 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 2463 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 2464 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 2465 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 2466 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2468 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 2469 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2470 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 2471 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2472 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 2473 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 2474 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Succeeded
NOTE: Running task 2475 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package)
NOTE: Running task 2477 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2478 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1293-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1293-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2479 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.1293-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.1293-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.1293-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.1293-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Succeeded
NOTE: Running task 2483 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2484 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: recipe vim-9.0.1293-r0: task do_install: Succeeded
NOTE: Running task 2485 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.1293-r0: task do_package: Started
NOTE: recipe vim-9.0.1293-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.1293-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.1293-r0: task do_packagedata: Succeeded
NOTE: Running task 2487 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.1293-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.1293-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Running task 2488 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2489 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: Running task 2490 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2491 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2492 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2493 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2494 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2495 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2496 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2499 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2500 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2501 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 2503 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2504 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 2505 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2506 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 2507 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2508 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: Running task 2509 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2510 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2511 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2512 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2513 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: Running task 2514 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_compile)
NOTE: recipe binutils-2.40-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 2515 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2516 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2517 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2518 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2519 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2520 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.40-r0: task do_compile: Succeeded
NOTE: Running task 2521 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_install: Succeeded
NOTE: Running task 2522 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_package: Succeeded
NOTE: Running task 2523 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_packagedata)
NOTE: recipe binutils-2.40-r0: task do_packagedata: Started
NOTE: recipe binutils-2.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2524 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_package_write_rpm)
NOTE: Running task 2525 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package_write_rpm)
NOTE: Running task 2526 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package_qa)
NOTE: recipe binutils-2.40-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-235-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-235-r0: task do_package_qa: Started
NOTE: recipe diffoscope-235-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-235-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.40-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2527 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_build)
NOTE: Tasks Summary: Attempted 2527 tasks of which 2266 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4467620469214100362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 234 [default] to 235 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "234" to "235"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 234 [default] to 235 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "234" to "235"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 234 [default] to 235 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "234" to "235"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 234 [default] to 235 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "234" to "235"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 234 [default] to 235 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "234" to "235"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 234 [default] to 235 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "234" to "235"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1389553 to 1406020 (+1%)
packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-234.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-235.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/arsc.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/arsc.py"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 234 [default] to 235 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "234" to "235"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-234.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-235.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 234 [default] to 235 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "234" to "235"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-234.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-235.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/arsc.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/arsc.cpython-311.pyc was added

--===============4467620469214100362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1694 targets, 49 skipped, 0 masked, 0 errors.
Removing 115 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============4467620469214100362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1694 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (894 cached, 1 parsed). 1693 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-47a7a1406c23390e9c87c050acd6fbf13a71805e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:47a7a1406c23390e9c87c050acd6fbf13a71805e"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 15 Mirrors 0 Missed 93 Current 624 (13% match, 87% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 674 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.87.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.87.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.87.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/curl/7.87.0-r0/temp/log.do_packagedata_setscene.2380577
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 731 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_package_setscene)
NOTE: Running task 1041 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 1215 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure_ptest_base)
NOTE: Running task 1230 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1322 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1323 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Started
NOTE: recipe curl-7.87.0-r0: task do_package_setscene: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Succeeded
NOTE: Running task 1515 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1551 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: Running task 1552 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile)
NOTE: Running task 1582 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1613 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1616 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1625 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: Running task 1769 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1827 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1828 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1829 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1896 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1903 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1904 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: Running task 1915 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 1916 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 1927 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: Running task 2008 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 2009 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2010 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: Running task 2011 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 2012 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2016 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2018 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2066 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_fetch)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2104 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2105 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2106 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2107 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 2108 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2109 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2110 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2111 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: Running task 2156 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2266 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2267 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-235-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1293-r0: task do_fetch: Started
NOTE: Running task 2290 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe diffoscope-235-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2291 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2292 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_unpack)
NOTE: Running task 2293 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: Running task 2294 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: Running task 2295 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2296 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 2297 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2298 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 2299 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2300 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2301 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2302 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1293-r0: task do_fetch: Succeeded
NOTE: Running task 2303 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: Running task 2304 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-235-r0: task do_unpack: Started
NOTE: Running task 2305 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: Running task 2306 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2307 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2308 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: Running task 2309 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 2310 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe diffoscope-235-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: Running task 2311 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2312 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2313 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 2314 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-235-r0: task do_unpack: Succeeded
NOTE: Running task 2315 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe vim-9.0.1293-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 2317 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe pango-1.50.12-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2318 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe diffoscope-235-r0: task do_patch: Started
NOTE: Running task 2319 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: Running task 2320 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2321 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2322 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: Running task 2323 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2324 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2325 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 797a1f60b029d1426fd5844d9372e793307380323e335de4e341b3b4b719d326
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2344 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 2345 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 2346 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe diffoscope-235-r0: task do_patch: Succeeded
NOTE: Running task 2347 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-235-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2348 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_deploy_source_date_epoch)
NOTE: Running task 2349 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_lic)
NOTE: Running task 2350 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Running task 2351 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 2352 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2353 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2354 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-235-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2355 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe diffoscope-235-r0: task do_populate_lic: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2356 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2357 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: Running task 2358 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe diffoscope-235-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_lic unihash changed to c53637343f5603ecce0eec7e6eb5caa7b2c5f2624cfbcff53f2600c487e54abe
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2359 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2360 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe diffoscope-235-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2361 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: Running task 2362 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2363 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-235-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe curl-7.87.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2364 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2378 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2379 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-235-r0: task do_configure: Succeeded
NOTE: Running task 2380 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: Running task 2381 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2382 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe curl-7.87.0-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe diffoscope-235-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: Running task 2383 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe vim-9.0.1293-r0: task do_unpack: Succeeded
NOTE: Running task 2384 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe pango-1.50.12-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install_ptest_base)
NOTE: recipe curl-7.87.0-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_patch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 2386 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3263d406b861519abafcb566ea589932eb9a2e7bc2c259532ce6d560ec9d798e
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2393 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1293-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2394 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2395 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: Running task 2397 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package)
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe pango-1.50.12-r0: task do_package: Started
NOTE: recipe vim-9.0.1293-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2398 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2399 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2400 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2401 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: recipe diffoscope-235-r0: task do_compile: Succeeded
NOTE: Running task 2402 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2403 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-235-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2406 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: Running task 2407 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe diffoscope-235-r0: task do_install: Succeeded
NOTE: Running task 2409 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package)
NOTE: Running task 2410 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe diffoscope-235-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-235-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2412 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2413 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2414 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_configure)
NOTE: recipe diffoscope-235-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2415 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2417 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2418 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2420 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2421 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2422 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe diffoscope-235-r0: task do_package: Succeeded
NOTE: Running task 2424 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_packagedata)
NOTE: recipe diffoscope-235-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2426 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-235-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install_ptest_base)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2429 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot)
NOTE: Running task 2430 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2431 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_package: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2432 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2433 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2434 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2435 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_package: Succeeded
NOTE: Running task 2436 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2437 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2438 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Succeeded
NOTE: Running task 2439 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2440 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2441 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2442 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2443 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: Running task 2444 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2445 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2446 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2447 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: Running task 2448 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2449 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: Running task 2450 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_compile)
NOTE: recipe file-5.44-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 2451 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 2452 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2453 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 2454 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe file-5.44-r0: task do_compile: Succeeded
NOTE: Running task 2455 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_install)
NOTE: recipe file-5.44-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2456 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2457 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure)
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Started
NOTE: recipe file-5.44-r0: task do_install: Succeeded
NOTE: Running task 2458 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot)
NOTE: Running task 2459 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package)
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.44-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2460 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2461 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2462 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2463 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_package: Succeeded
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2464 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: Running task 2465 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_packagedata: Succeeded
NOTE: Running task 2466 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 2467 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2468 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 2469 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2470 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2471 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2472 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 2473 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: Running task 2474 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2476 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2477 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2478 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2479 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2480 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 2484 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2485 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2486 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 2487 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 2488 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2489 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 2490 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2491 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 2493 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2495 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2496 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1293-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1293-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2497 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.1293-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Succeeded
NOTE: Running task 2498 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.1293-r0: task do_configure: Succeeded
NOTE: Running task 2499 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.1293-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.1293-r0: task do_install: Started
NOTE: recipe vim-9.0.1293-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.1293-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Succeeded
NOTE: Running task 2502 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2503 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: recipe vim-9.0.1293-r0: task do_package: Succeeded
NOTE: Running task 2504 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.1293-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.1293-r0: task do_packagedata: Succeeded
NOTE: Running task 2505 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.1293-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.1293-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Running task 2506 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2507 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: Running task 2508 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2509 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2510 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2511 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2512 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2513 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2514 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2515 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2516 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2517 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2518 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2519 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2520 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 2521 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2522 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 2523 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2524 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 2525 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2526 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: Running task 2527 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2528 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2529 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2530 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2531 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: Running task 2532 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_compile)
NOTE: recipe binutils-2.40-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 2533 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2534 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2535 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2536 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2537 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2538 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.40-r0: task do_compile: Succeeded
NOTE: Running task 2539 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_install: Succeeded
NOTE: Running task 2540 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_package: Succeeded
NOTE: Running task 2541 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_packagedata)
NOTE: recipe binutils-2.40-r0: task do_packagedata: Started
NOTE: recipe binutils-2.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2542 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_package_write_rpm)
NOTE: Running task 2543 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package_write_rpm)
NOTE: Running task 2544 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package_qa)
NOTE: recipe binutils-2.40-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-235-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-235-r0: task do_package_qa: Started
NOTE: recipe diffoscope-235-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-235-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.40-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2545 of 2545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_build)
NOTE: Tasks Summary: Attempted 2545 tasks of which 2284 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4467620469214100362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.11/site-packages/diffoscope-234.dist-info -> /usr/lib/python3.11/site-packages/diffoscope-235.dist-info, added "/usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/arsc.cpython-311.pyc /usr/lib/python3.11/site-packages/diffoscope/comparators/arsc.py"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-234.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-235.dist-info
  /usr/lib/python3.11/site-packages/diffoscope/comparators/arsc.py was added
  /usr/lib/python3.11/site-packages/diffoscope/comparators/__pycache__/arsc.cpython-311.pyc was added

--===============4467620469214100362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-47a7a1406c23390e9c87c050acd6fbf13a71805e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:47a7a1406c23390e9c87c050acd6fbf13a71805e"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 15 Mirrors 0 Missed 93 Current 620 (13% match, 87% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 670 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.87.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.87.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.87.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/curl/7.87.0-r0/temp/log.do_packagedata_setscene.2682404
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 727 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_package_setscene)
NOTE: Running task 1041 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 1215 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure_ptest_base)
NOTE: Running task 1230 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1350 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1351 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Succeeded
NOTE: Running task 1550 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: Running task 1556 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_unpack)
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1582 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1587 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile)
NOTE: Running task 1613 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: recipe curl-7.87.0-r0: task do_package_setscene: Started
NOTE: Running task 1616 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1625 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1820 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Started
NOTE: Running task 1821 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1822 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1833 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1929 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1930 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1931 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: Running task 1932 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 1933 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 1972 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 1990 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile_ptest_base)
NOTE: Running task 1993 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1996 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 2044 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 2076 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 2077 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 2078 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2079 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2086 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2087 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2088 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2089 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 2090 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2091 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2111 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2112 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2137 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe diffoscope-235-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: Running task 2268 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-235-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: Running task 2270 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_unpack)
NOTE: Running task 2271 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1293-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2272 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 2273 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2274 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2275 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 2276 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2277 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2278 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2279 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2280 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 2281 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2282 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_fetch: Succeeded
NOTE: Running task 2283 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2284 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: Running task 2285 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2286 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2287 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2288 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe diffoscope-235-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 2289 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe diffoscope-235-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2290 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2291 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-235-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2292 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2293 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: Running task 2294 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: Running task 2295 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2296 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe pango-1.50.12-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 2298 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe diffoscope-235-r0: task do_patch: Started
NOTE: Running task 2299 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2300 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2301 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2302 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: Running task 2303 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: Running task 2304 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: Running task 2305 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: Running task 2306 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2307 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Running task 2308 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7a3ecd0453329f08fc7dc59198cc5dbb9d428c1b9dd44663a3e9a6b0049f23f1
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-235-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-235-r0: task do_patch: Succeeded
NOTE: Running task 2320 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: Running task 2328 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 2329 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_deploy_source_date_epoch)
NOTE: Running task 2330 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 2331 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2333 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2334 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2335 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: Running task 2336 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2337 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-235-r0: task do_populate_lic: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: Running task 2338 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-235-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2339 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: Running task 2340 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-235-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_lic unihash changed to c53637343f5603ecce0eec7e6eb5caa7b2c5f2624cfbcff53f2600c487e54abe
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2341 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2342 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2343 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe diffoscope-235-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2344 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_configure)
NOTE: Running task 2345 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-235-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2346 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Running task 2347 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe diffoscope-235-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2348 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: Running task 2349 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.87.0-r0: task do_package_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2363 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata)
NOTE: Running task 2364 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe vim-9.0.1293-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-235-r0: task do_compile: Started
NOTE: Running task 2365 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: Running task 2366 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe curl-7.87.0-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe pango-1.50.12-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 2367 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install_ptest_base)
NOTE: recipe vim-9.0.1293-r0: task do_patch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2369 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.87.0-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e9c1144ea2419bed6d0fc635780029749c392f66d9ede00d45690172e50f2dbd
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2376 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2377 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: Running task 2378 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package)
NOTE: Running task 2379 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe vim-9.0.1293-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_package: Started
NOTE: recipe vim-9.0.1293-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 2382 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2383 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2384 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe diffoscope-235-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-235-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2387 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2388 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2389 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2390 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe diffoscope-235-r0: task do_install: Succeeded
NOTE: Running task 2391 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package)
NOTE: Running task 2392 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe diffoscope-235-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-235-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2394 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe diffoscope-235-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2395 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2396 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2397 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2398 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2399 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2400 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2401 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Succeeded
NOTE: Running task 2402 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2403 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2404 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_install: Started
NOTE: recipe diffoscope-235-r0: task do_package: Succeeded
NOTE: Running task 2405 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2406 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe diffoscope-235-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2407 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe diffoscope-235-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2409 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install: Succeeded
NOTE: Running task 2410 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install_ptest_base)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2411 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_package)
NOTE: Running task 2413 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2419 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2420 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2422 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2423 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2424 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2426 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: Running task 2427 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: Running task 2428 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2429 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2432 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 2433 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe file-5.44-r0: task do_compile: Succeeded
NOTE: Running task 2434 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2435 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: Running task 2436 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe file-5.44-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2437 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2438 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure)
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_install: Succeeded
NOTE: Running task 2439 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot)
NOTE: Running task 2440 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package)
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2441 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.44-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2442 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 2443 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: Running task 2444 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2445 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_package: Succeeded
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2446 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata)
NOTE: Running task 2447 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: recipe file-5.44-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_packagedata: Succeeded
NOTE: Running task 2448 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 2449 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2450 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 2451 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2452 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2453 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 2455 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 2456 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2458 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2459 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2460 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2461 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2462 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 2463 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 2464 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 2465 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 2466 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2468 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 2469 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2470 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 2471 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 2472 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2473 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 2474 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Succeeded
NOTE: Running task 2475 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package)
NOTE: Running task 2477 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2478 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1293-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1293-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2479 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.1293-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.1293-r0: task do_compile: Started
NOTE: recipe vim-9.0.1293-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.1293-r0: task do_install: Started
NOTE: recipe vim-9.0.1293-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.1293-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Succeeded
NOTE: Running task 2484 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2485 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: recipe vim-9.0.1293-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.1293-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.1293-r0: task do_packagedata: Succeeded
NOTE: Running task 2487 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.1293-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.1293-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Running task 2488 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2489 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: Running task 2490 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2491 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2492 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2493 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2494 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2495 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2496 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2499 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2500 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2501 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 2503 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2504 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 2505 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2506 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 2507 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2508 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: Running task 2509 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2510 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2511 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2512 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2513 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: Running task 2514 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_compile)
NOTE: recipe binutils-2.40-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 2515 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2516 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2517 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2518 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2519 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2520 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.40-r0: task do_compile: Succeeded
NOTE: Running task 2521 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_install: Succeeded
NOTE: Running task 2522 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_package: Succeeded
NOTE: Running task 2523 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_packagedata)
NOTE: recipe binutils-2.40-r0: task do_packagedata: Started
NOTE: recipe binutils-2.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2524 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_package_write_rpm)
NOTE: Running task 2525 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package_write_rpm)
NOTE: Running task 2526 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package_qa)
NOTE: recipe binutils-2.40-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-235-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-235-r0: task do_package_qa: Started
NOTE: recipe diffoscope-235-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-235-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.40-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2527 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_build)
NOTE: Tasks Summary: Attempted 2527 tasks of which 2266 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4467620469214100362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-47a7a1406c23390e9c87c050acd6fbf13a71805e"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:47a7a1406c23390e9c87c050acd6fbf13a71805e"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 114 Local 17 Mirrors 0 Missed 97 Current 614 (14% match, 86% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 664 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.87.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.87.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.87.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/curl/7.87.0-r0/temp/log.do_packagedata_setscene.2970701
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 725 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_package_setscene)
NOTE: Running task 866 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 867 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 966 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: Running task 1181 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1206 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_fetch: Succeeded
NOTE: Running task 1207 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 1208 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1209 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_unpack)
NOTE: Running task 1231 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1234 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1236 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: Running task 1348 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1349 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1350 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 1404 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1407 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 1423 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_fetch)
NOTE: Running task 1435 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 1436 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 1437 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 1438 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 1439 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1440 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: Running task 1484 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe curl-7.87.0-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1533 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1534 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: Running task 1535 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-235-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: Running task 1536 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1537 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1538 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe diffoscope-235-r0: task do_fetch: Succeeded
NOTE: Running task 1539 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 1540 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_unpack)
NOTE: Running task 1541 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 1542 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1543 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1544 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: Running task 1545 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 1546 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: recipe vim-9.0.1293-r0: task do_fetch: Succeeded
NOTE: Running task 1547 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: Running task 1548 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe diffoscope-235-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 1549 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1550 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: Running task 1551 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: Running task 1552 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: Running task 1554 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_unpack: Started
NOTE: Running task 1555 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe diffoscope-235-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: Running task 1556 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1557 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1558 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 1559 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe diffoscope-235-r0: task do_patch: Started
NOTE: Running task 1560 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 1561 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1563 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 1564 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1565 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe diffoscope-235-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1566 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_deploy_source_date_epoch)
NOTE: Running task 1567 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1568 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1570 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 1571 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1572 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-235-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-235-r0: task do_populate_lic: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1573 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 1574 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1575 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-235-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_lic unihash changed to c53637343f5603ecce0eec7e6eb5caa7b2c5f2624cfbcff53f2600c487e54abe
NOTE: recipe gnutls-3.7.8-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: Running task 1576 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: Running task 1577 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe diffoscope-235-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0695e9e8b2f4b8b2c4715d4c53efa9be70d0de573463e5a5169889555f05fbb7
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1578 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1579 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1580 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: Running task 1582 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1583 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe curl-7.87.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 726 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe vim-9.0.1293-r0: task do_unpack: Succeeded
NOTE: Running task 1588 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-9.0.1293-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1589 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 046205aa66778148b3471ca4f7fc14af418b4fb272b1d1f1c69cf6355dc24e4e
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe vim-9.0.1293-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1797 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1798 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1840 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2078 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2081 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2144 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2145 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2146 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Started
NOTE: Running task 2184 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2219 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile)
NOTE: Running task 2220 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.87.0.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2271 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2273 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2275 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: Running task 2278 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2296 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2310 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2311 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.87.0-r0: task do_packagedata: Started
NOTE: Running task 2349 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: Running task 2350 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2351 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe diffoscope-235-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1293-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2352 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: Running task 2353 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2354 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2355 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2356 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2357 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe vim-9.0.1293-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe curl-7.87.0-r0: task do_packagedata: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2358 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2359 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2360 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2361 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe diffoscope-235-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2362 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2363 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 2364 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe diffoscope-235-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-235-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: Running task 2366 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe diffoscope-235-r0: task do_compile: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2368 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: recipe pango-1.50.12-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install_ptest_base)
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2370 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2372 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2374 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: Running task 2375 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-235-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2377 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-235-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2378 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 2380 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2381 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2383 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2384 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe diffoscope-235-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package)
NOTE: Running task 2386 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe diffoscope-235-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-235-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2387 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2388 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe diffoscope-235-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2389 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2390 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2391 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2392 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe diffoscope-235-r0: task do_package: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 2394 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2395 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe diffoscope-235-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2397 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-235-r0: task do_packagedata: Succeeded
NOTE: Running task 2398 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2400 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2401 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_install: Succeeded
NOTE: Running task 2403 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2404 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot)
NOTE: Running task 2405 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_package)
NOTE: recipe pango-1.50.12-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_package: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2408 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2409 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2410 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2411 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2414 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2417 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: Running task 2420 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2424 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: Running task 2425 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2428 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_compile: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2429 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2430 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe file-5.44-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot)
NOTE: Running task 2432 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: Running task 2434 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.44-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2435 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 2436 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2437 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata)
NOTE: Running task 2438 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 2439 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe file-5.44-r0: task do_packagedata: Succeeded
NOTE: Running task 2441 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2442 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2443 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2444 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2445 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2446 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2447 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 2448 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2449 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 2450 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2451 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2452 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2453 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 2454 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: Running task 2455 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 2456 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2458 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2459 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2460 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 2461 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2462 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2463 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 2464 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 2465 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 2466 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2468 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2469 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2470 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 2471 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2472 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 2473 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Succeeded
NOTE: Running task 2474 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Succeeded
NOTE: Running task 2475 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package)
NOTE: Running task 2476 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2477 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: Running task 2478 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.1293-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2479 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.1293-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.1293-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.1293-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1293-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.1293-r0: task do_install: Started
NOTE: recipe vim-9.0.1293-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.1293-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_configure: Succeeded
NOTE: Running task 2484 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2485 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: recipe vim-9.0.1293-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.1293-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.1293-r0: task do_packagedata: Succeeded
NOTE: Running task 2487 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.1293-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.1293-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Running task 2488 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2489 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: Running task 2490 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.7.8-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2491 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2492 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2493 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2494 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2495 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2496 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2499 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2500 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2501 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 2503 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2504 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 2505 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2506 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 2507 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2508 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: Running task 2509 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2510 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2511 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2512 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2513 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: Running task 2514 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_compile)
NOTE: recipe binutils-2.40-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 2515 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2516 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2517 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2518 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2519 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2520 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.40-r0: task do_compile: Succeeded
NOTE: Running task 2521 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_install: Succeeded
NOTE: Running task 2522 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_package: Succeeded
NOTE: Running task 2523 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_packagedata)
NOTE: recipe binutils-2.40-r0: task do_packagedata: Started
NOTE: recipe binutils-2.40-r0: task do_packagedata: Succeeded
NOTE: Running task 2524 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_package_write_rpm)
NOTE: Running task 2525 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package_write_rpm)
NOTE: Running task 2526 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_package_qa)
NOTE: recipe binutils-2.40-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-235-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-235-r0: task do_package_qa: Started
NOTE: recipe diffoscope-235-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-235-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.40-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2527 of 2527 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_235.bb:do_build)
NOTE: Tasks Summary: Attempted 2527 tasks of which 2252 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.88.0-r0 to 0:7.87.0-r0) [version-going-backwards]
ERROR: curl-7.87.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4467620469214100362==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-234-235.patch"

RnJvbSAyOGRlOTUyNjU0MzM5OThiODFmODExZTc4YmY0MzI3MTdmOGU5MDM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTYgRmViIDIwMjMgMDA6MTk6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDIzNCAtPiAyMzUKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjM0LmJiID0+IGRpZmZvc2NvcGVfMjM1LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yMzQuYmIgPT4gZGlmZm9zY29wZV8y
MzUuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIzNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yMzUuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIzNC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIzNS5iYgppbmRleCA5OTRkM2U5
NDIyLi5lNGNjMmE5NWI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjM0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMzUuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNjA5MWQ1NTViYzg4Y2VjYTI4NWRjNDBlNjNkZjU2YjU3Mzg1YWEwZGM1NTJkYWE3MGJk
ZTgxZThhNjlmOGM3YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMjc5ZjY2MzdmMWU5Zjc1N2Nh
OWI4YzI4NzBlZDc5Y2VlYWQ1OTcxZTVhMTVkOTUyYTA1NzliMmI0NTcyMGEyIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiYmludXRpbHMgdmltIHNxdWFzaGZzLXRvb2xzIHB5dGhvbjMtbGliYXJjaGl2
ZS1jIHB5dGhvbjMtbWFnaWMgcHl0aG9uMy1ycG0iCiAKLS0gCjIuMzcuMwoK

--===============4467620469214100362==--

