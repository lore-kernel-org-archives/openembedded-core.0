Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF32CCA482
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4417.1655298220948491324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=n4sotYsn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010181677667bc-8827a5af-962c-4ab1-afa6-c38a4ae9e8e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ta3AKUXIpUMPTohqOTKAWhzMwmA16FQAzTUI615chms=;
	b=n4sotYsn4Ng2OGsJMWeoFeyuYK3itzt/+k0nHQmPntijKFd1o2ZrDyAFx+XIvBjM
	fAljT9fb26BGJNCqlSCyuqYn5qlbrRXp4k8k5HvjZs/JhmKER4UNh05N/rIYAuWYcMn
	mpLuo5czpWjPRSn37nMiMNYyQk3dFlEqqvkvaqkY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ta3AKUXIpUMPTohqOTKAWhzMwmA16FQAzTUI615chms=;
	b=TjEs574vFf+pS0gLQJPVSkGInd84oCAas2qA/uF6CDHzmmRZgh68PWrVVsA3LP9j
	HFvA7uX8uFDE9kNvoOz9DqkShxv2Sks1IzpKtJaC5lNexPBbODWwnaQNVcRTAMBuXl6
	Emco9WRzCu+dUFg5du9Vhji4aW2HxvA23ULYtX3M=
Content-Type: multipart/mixed; boundary="===============2216846878443863380=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 216 SUCCEEDED
Message-ID: 
 <01010181677667bc-8827a5af-962c-4ab1-afa6-c38a4ae9e8e5-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:42 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166975

--===============2216846878443863380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *216* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-215-216.patch
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
--===============2216846878443863380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8800da34d23cd8bf998680971ab4ad3bfcef1d89"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8800da34d23cd8bf998680971ab4ad3bfcef1d89"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 103 Local 8 Mirrors 0 Missed 95 Current 614 (7% match, 86% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 662 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata_setscene)
NOTE: recipe file-5.41-r0: task do_packagedata_setscene: Started
NOTE: Running task 1021 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_fetch)
NOTE: Running task 1179 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 1180 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_fetch)
NOTE: Running task 1181 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1221 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: recipe file-5.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1282 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Started
NOTE: Running task 1356 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Succeeded
NOTE: Running task 1392 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_unpack)
NOTE: Running task 1393 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1395 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.8-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.8-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: Running task 1397 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_unpack)
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Started
NOTE: recipe curl-7.83.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1398 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 1399 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1400 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1401 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1402 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1403 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Succeeded
NOTE: Running task 1478 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1491 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_patch)
NOTE: Running task 1504 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_unpack)
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1579 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_fetch)
NOTE: Running task 1592 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1593 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: Running task 1620 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: recipe nettle-3.8-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1771 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1772 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1787 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: recipe curl-7.83.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Succeeded
NOTE: Running task 1956 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 1957 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1958 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1959 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_unpack)
NOTE: Running task 1971 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1972 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2006 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_fetch)
NOTE: recipe nettle-3.8-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 2030 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 2045 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_fetch)
NOTE: Running task 2046 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: Running task 2047 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2048 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2049 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2050 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2051 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2122 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2158 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2159 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2197 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2198 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: Running task 2199 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-216-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Started
NOTE: recipe diffoscope-216-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 2219 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: Running task 2220 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.26-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2.5034-r0: task do_fetch: Started
NOTE: Running task 2221 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 2222 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_unpack)
NOTE: Running task 2223 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2224 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_unpack)
NOTE: Running task 2225 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe nettle-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 2226 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2227 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2228 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2229 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: Running task 2230 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 2231 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2232 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2.5034-r0: task do_fetch: Succeeded
NOTE: Running task 2233 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 2234 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe diffoscope-216-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2235 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 2236 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_unpack: Started
NOTE: Running task 2237 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-216-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2238 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: recipe curl-7.83.1-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2239 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_patch)
NOTE: Running task 2240 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe python3-magic-0.4.26-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2241 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 2242 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: Running task 2243 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2244 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe diffoscope-216-r0: task do_unpack: Succeeded
NOTE: Running task 2245 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe vim-8.2.5034-r0: task do_unpack: Started
NOTE: Running task 2246 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: Running task 2247 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: Running task 2248 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 2249 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: Running task 2250 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe curl-7.83.1-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-216-r0: task do_patch: Started
NOTE: Running task 2251 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2252 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2253 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: Running task 2254 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.83.1-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2255 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2256 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 2257 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2258 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2259 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2260 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-216-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2261 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-216-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe nettle-3.8-r0: task do_configure: Started
NOTE: Running task 2262 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2263 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_deploy_source_date_epoch)
NOTE: Running task 2264 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_patch)
NOTE: Running task 2265 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2266 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: Running task 2267 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2268 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_configure)
NOTE: Running task 2269 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2270 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2271 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-216-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-216-r0: task do_populate_lic: Started
NOTE: Running task 2272 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2273 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: recipe diffoscope-216-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2275 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_lic unihash changed to 8e8529d3ed1e951f83f675ee05aaf9455e39bd430196d6588b95cf4a9933e10b
NOTE: recipe diffoscope-216-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2276 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2277 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2278 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_configure)
NOTE: Running task 2279 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2280 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2281 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: Running task 2282 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_configure)
NOTE: Running task 2283 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_configure: Started
NOTE: Running task 2284 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-216-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2285 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe python3-magic-0.4.26-r0: task do_configure: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: Running task 2286 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_compile)
NOTE: recipe diffoscope-216-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2287 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_compile)
NOTE: Running task 2288 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2289 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-magic-0.4.26-r0: task do_compile: Started
NOTE: recipe diffoscope-216-r0: task do_compile: Started
NOTE: recipe vim-8.2.5034-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: Running task 2290 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 65b17ebcffa94b7f2b9452d2bd205777f4276a38b65464b4d238b2a804cb2a4d
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe vim-8.2.5034-r0: task do_patch: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: Running task 2319 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2.5034-r0: task do_patch: Succeeded
NOTE: Running task 2320 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe vim-8.2.5034-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2321 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 2322 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-8.2.5034-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 656728e8dec0d72a8fab5de1f4fa41bdbcc84231c5c7f67760b54a24cbeee47b
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2333 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2334 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2335 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2336 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2337 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2338 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2339 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2340 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: Running task 2342 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe diffoscope-216-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_install: Succeeded
NOTE: Running task 2345 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: Running task 2346 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_package)
NOTE: recipe diffoscope-216-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_package: Started
NOTE: recipe nettle-3.8-r0: task do_configure: Succeeded
NOTE: Running task 2347 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_configure_ptest_base)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2348 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe nettle-3.8-r0: task do_configure_ptest_base: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe nettle-3.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2350 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe nettle-3.8-r0: task do_compile: Started
NOTE: recipe diffoscope-216-r0: task do_install: Succeeded
NOTE: Running task 2351 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_package)
NOTE: Running task 2352 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_sysroot)
NOTE: recipe diffoscope-216-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-216-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2354 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2355 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_package: Succeeded
NOTE: Running task 2356 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: Running task 2357 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata)
NOTE: recipe diffoscope-216-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_packagedata: Failed
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: recipe diffoscope-216-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2357 tasks of which 2208 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-magic/0.4.26-r0/temp/log.do_packagedata.522881
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata) failed with exit code '1'

--===============2216846878443863380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1643 targets, 49 skipped, 0 masked, 0 errors.
Removing 114 recipes from the core2-32 sysroot...done.
Removing 120 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============2216846878443863380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1643 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8800da34d23cd8bf998680971ab4ad3bfcef1d89"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8800da34d23cd8bf998680971ab4ad3bfcef1d89"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 99 Local 8 Mirrors 0 Missed 91 Current 622 (8% match, 87% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 670 of 721 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata_setscene)
NOTE: recipe file-5.41-r0: task do_packagedata_setscene: Started
NOTE: Running task 1021 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_fetch)
NOTE: recipe file-5.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1185 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_fetch)
NOTE: Running task 1186 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 1228 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 1289 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Succeeded
NOTE: Running task 1365 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_fetch)
NOTE: Running task 1393 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_unpack)
NOTE: Running task 1394 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1404 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe nettle-3.8-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.8-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Started
NOTE: recipe curl-7.83.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1406 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_unpack)
NOTE: Running task 1407 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1408 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1409 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1410 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Succeeded
NOTE: Running task 1451 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_patch)
NOTE: Running task 1486 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1512 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_unpack)
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1588 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_fetch)
NOTE: Running task 1601 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1602 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1629 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.8-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1786 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1787 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1802 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: recipe curl-7.83.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Succeeded
NOTE: Running task 1957 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 1958 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_unpack)
NOTE: Running task 1959 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1960 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 1993 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: recipe nettle-3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1997 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1998 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 2036 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_fetch)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: Running task 2037 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2071 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 2076 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_fetch)
NOTE: Running task 2077 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2078 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2079 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2080 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2081 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2090 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2091 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2170 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: Running task 2171 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 2172 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 2212 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-216-r0: task do_fetch: Started
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8-r0: task do_patch: Started
NOTE: recipe diffoscope-216-r0: task do_fetch: Succeeded
NOTE: Running task 2249 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2250 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_fetch: Started
NOTE: recipe vim-8.2.5034-r0: task do_fetch: Started
NOTE: Running task 2251 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2252 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_unpack)
NOTE: Running task 2253 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2254 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2255 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 2256 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_unpack)
NOTE: Running task 2257 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2258 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2259 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe vim-8.2.5034-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2260 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2261 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2262 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2263 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe diffoscope-216-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2264 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2265 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 2266 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.83.1-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2267 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_unpack: Started
NOTE: Running task 2268 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: Running task 2269 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: Running task 2270 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe diffoscope-216-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-216-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2271 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_patch)
NOTE: Running task 2272 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2273 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe vim-8.2.5034-r0: task do_unpack: Started
NOTE: recipe nettle-3.8-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe curl-7.83.1-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: Running task 2275 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-216-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 2276 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2277 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.26-r0: task do_patch: Started
NOTE: Running task 2278 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe curl-7.83.1-r0: task do_patch: Succeeded
NOTE: Running task 2279 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2280 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2281 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2282 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2283 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 2284 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2285 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2286 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2287 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2288 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_configure)
NOTE: Running task 2289 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2290 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Running task 2291 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Succeeded
NOTE: Running task 2292 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 2293 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_patch)
NOTE: Running task 2294 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2295 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Started
NOTE: recipe diffoscope-216-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-216-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_patch: Succeeded
NOTE: Running task 2296 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_deploy_source_date_epoch)
NOTE: Running task 2297 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_lic)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 2298 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2300 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Started
NOTE: Running task 2301 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-216-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-216-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2302 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2303 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running task 2304 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 2305 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2306 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: Running task 2307 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe diffoscope-216-r0: task do_populate_lic: Succeeded
NOTE: recipe diffoscope-216-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_lic unihash changed to 8e8529d3ed1e951f83f675ee05aaf9455e39bd430196d6588b95cf4a9933e10b
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2308 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2309 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_configure)
NOTE: Running task 2310 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_configure)
NOTE: Running task 2311 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2312 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe diffoscope-216-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe diffoscope-216-r0: task do_configure: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_compile)
NOTE: Running task 2315 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5ed870303c0f0e0c6c89ebd0b9380a1e9a66eea011259bf73fe3c430bec67250
NOTE: recipe diffoscope-216-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_compile: Started
NOTE: recipe vim-8.2.5034-r0: task do_unpack: Succeeded
NOTE: Running task 2344 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe vim-8.2.5034-r0: task do_patch: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: Running task 2345 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2346 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe vim-8.2.5034-r0: task do_patch: Succeeded
NOTE: Running task 2347 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2348 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2.5034-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-8.2.5034-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b0e3b0d12ad862ed776625cc4e9c3615fd854e96416679a1d13b7b665f13755d
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2359 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2360 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: Running task 2361 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2362 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2363 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2364 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2365 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe python3-magic-0.4.26-r0: task do_compile: Succeeded
NOTE: Running task 2369 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe python3-magic-0.4.26-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2371 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_package)
NOTE: recipe diffoscope-216-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_install)
NOTE: recipe nettle-3.8-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_configure_ptest_base)
NOTE: recipe python3-magic-0.4.26-r0: task do_package: Started
NOTE: recipe nettle-3.8-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-216-r0: task do_install: Started
NOTE: recipe nettle-3.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2375 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_compile)
NOTE: recipe nettle-3.8-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe diffoscope-216-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: Running task 2378 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_package)
NOTE: Running task 2379 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe diffoscope-216-r0: task do_package: Started
NOTE: recipe diffoscope-216-r0: task do_populate_sysroot: Started
NOTE: Running task 2380 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2381 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: Running task 2382 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.26-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_packagedata: Started
NOTE: recipe diffoscope-216-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2384 of 2498 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.26-r0: task do_packagedata: Failed
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-216-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2384 tasks of which 2240 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-magic/0.4.26-r0/temp/log.do_packagedata.448658
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata) failed with exit code '1'

--===============2216846878443863380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 215 [default] to 216 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "215" to "216"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 215 [default] to 216 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "215" to "216"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 215 [default] to 216 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "215" to "216"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 215 [default] to 216 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "215" to "216"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 215 [default] to 216 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "215" to "216"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 215 [default] to 216 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "215" to "216"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 215 [default] to 216 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1058245 to 1059120 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "215" to "216"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 215 [default] to 216 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-215.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-216.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "215" to "216"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-215.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-216.dist-info

--===============2216846878443863380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8800da34d23cd8bf998680971ab4ad3bfcef1d89"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8800da34d23cd8bf998680971ab4ad3bfcef1d89"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 99 Local 8 Mirrors 0 Missed 91 Current 618 (8% match, 87% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 666 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata_setscene)
NOTE: Running task 1021 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_fetch)
NOTE: recipe file-5.41-r0: task do_packagedata_setscene: Started
NOTE: Running task 1185 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_fetch)
NOTE: Running task 1186 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1228 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 1289 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Started
NOTE: Running task 1365 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1402 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe nettle-3.8-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1403 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_unpack)
NOTE: recipe nettle-3.8-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_fetch: Started
NOTE: recipe curl-7.83.1-r0: task do_fetch: Succeeded
NOTE: Running task 1404 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1405 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_unpack)
NOTE: Running task 1406 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1407 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1408 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1409 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 1485 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1511 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_unpack)
NOTE: Running task 1587 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_fetch)
NOTE: Running task 1600 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1601 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1628 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Started
NOTE: recipe nettle-3.8-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: Running task 1779 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1780 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1795 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.83.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Started
NOTE: Running task 1973 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1975 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Succeeded
NOTE: Running task 2012 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: Running task 2049 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 2050 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2052 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2053 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2054 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_unpack)
NOTE: Running task 2055 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2056 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_fetch)
NOTE: Running task 2057 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2058 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: recipe nettle-3.8-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: Running task 2198 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: Running task 2217 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2222 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2223 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2224 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: Running task 2225 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2226 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 2227 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe diffoscope-216-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-216-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: Running task 2228 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2229 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2230 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2.5034-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_fetch: Started
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: Running task 2231 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2232 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_unpack)
NOTE: Running task 2233 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Succeeded
NOTE: Running task 2234 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2235 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.26-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe nettle-3.8-r0: task do_patch: Started
NOTE: Running task 2236 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_patch)
NOTE: Running task 2237 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: Running task 2238 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: Running task 2239 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_unpack)
NOTE: Running task 2240 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vim-8.2.5034-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: Running task 2241 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2242 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2243 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-216-r0: task do_unpack: Started
NOTE: Running task 2244 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe curl-7.83.1-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-216-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: Running task 2245 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2246 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 2247 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2248 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2249 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_unpack: Started
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2250 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2251 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2252 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.26-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe vim-8.2.5034-r0: task do_unpack: Started
NOTE: Running task 2253 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe diffoscope-216-r0: task do_unpack: Succeeded
NOTE: Running task 2254 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 2255 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe nettle-3.8-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2256 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2257 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-216-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2258 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 2259 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Succeeded
NOTE: Running task 2260 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2261 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2262 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2263 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2264 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2265 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: Running task 2266 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2267 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: Running task 2268 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe diffoscope-216-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-216-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2269 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_configure)
NOTE: Running task 2270 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_deploy_source_date_epoch)
NOTE: Running task 2271 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_lic)
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2272 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2273 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Running task 2275 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure)
NOTE: Running task 2276 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_patch)
NOTE: recipe nettle-3.8-r0: task do_configure: Started
NOTE: Running task 2277 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe diffoscope-216-r0: task do_populate_lic: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-216-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2278 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Started
NOTE: Running task 2279 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2280 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 2281 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2282 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2283 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe diffoscope-216-r0: task do_populate_lic: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_lic unihash changed to 8e8529d3ed1e951f83f675ee05aaf9455e39bd430196d6588b95cf4a9933e10b
NOTE: Running task 2284 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe diffoscope-216-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2285 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_configure)
NOTE: Running task 2286 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: Running task 2287 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2288 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2289 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2290 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2291 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: recipe diffoscope-216-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_configure: Started
NOTE: Running task 2292 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2293 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe diffoscope-216-r0: task do_configure: Succeeded
NOTE: Running task 2294 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2295 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.26-r0: task do_configure: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: Running task 2296 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe diffoscope-216-r0: task do_compile: Started
NOTE: recipe vim-8.2.5034-r0: task do_unpack: Succeeded
NOTE: Running task 2297 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_compile: Started
NOTE: Running task 2298 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dc0d3db9dacec36b3d96867e3c562f4b22fb5604cc27df94b9d900531a55cd39
NOTE: recipe vim-8.2.5034-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: Running task 2327 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2.5034-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2328 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2329 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: recipe vim-8.2.5034-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2330 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2.5034-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 101b7664e0b3bdada8186be4cb7cfc0075093b0291f572f9b5dc31a118d52e19
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2341 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2342 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2343 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2345 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2346 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2347 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_compile: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: Running task 2348 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2349 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2350 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-216-r0: task do_compile: Succeeded
NOTE: Running task 2351 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: Running task 2352 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe diffoscope-216-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe nettle-3.8-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_configure_ptest_base)
NOTE: recipe python3-magic-0.4.26-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: Running task 2356 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe nettle-3.8-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2357 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe nettle-3.8-r0: task do_compile: Started
NOTE: recipe diffoscope-216-r0: task do_install: Succeeded
NOTE: Running task 2358 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_package)
NOTE: Running task 2359 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2360 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe diffoscope-216-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-216-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe diffoscope-216-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2362 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.26-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_packagedata: Failed
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: recipe diffoscope-216-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2364 tasks of which 2222 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-magic/0.4.26-r0/temp/log.do_packagedata.485610
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata) failed with exit code '1'

--===============2216846878443863380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.10/site-packages/diffoscope-215.dist-info moved to /usr/lib/python3.10/site-packages/diffoscope-216.dist-info

--===============2216846878443863380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8800da34d23cd8bf998680971ab4ad3bfcef1d89"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8800da34d23cd8bf998680971ab4ad3bfcef1d89"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 99 Local 8 Mirrors 0 Missed 91 Current 618 (8% match, 87% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 666 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata_setscene)
NOTE: recipe file-5.41-r0: task do_packagedata_setscene: Started
NOTE: Running task 1021 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_fetch)
NOTE: Running task 1185 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_fetch)
NOTE: Running task 1186 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1228 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Started
NOTE: Running task 1289 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: recipe file-5.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Succeeded
NOTE: Running task 1357 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_unpack)
NOTE: Running task 1358 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1367 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_fetch)
NOTE: recipe nettle-3.8-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: Running task 1404 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.8-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Started
NOTE: recipe curl-7.83.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.83.1-r0: task do_fetch: Succeeded
NOTE: Running task 1406 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_unpack)
NOTE: Running task 1407 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1408 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1409 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1410 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Succeeded
NOTE: Running task 1457 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_patch)
NOTE: Running task 1486 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1512 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_unpack)
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1588 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_fetch)
NOTE: Running task 1601 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1602 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1629 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.8-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1780 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1781 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1796 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: recipe curl-7.83.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: Running task 1970 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_unpack)
NOTE: Running task 1971 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 1972 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1973 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1980 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: Running task 1981 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe nettle-3.8-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 2015 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2018 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_fetch)
NOTE: Running task 2033 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: Running task 2053 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: Running task 2054 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2055 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2056 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 2057 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2058 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: Running task 2063 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2064 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_fetch)
NOTE: Running task 2065 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 2066 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2067 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2068 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-216-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2184 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2185 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 2186 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe diffoscope-216-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8-r0: task do_patch: Started
NOTE: Running task 2187 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2188 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: Running task 2189 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_unpack)
NOTE: Running task 2190 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe vim-8.2.5034-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Started
NOTE: Running task 2237 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 2238 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2239 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe vim-8.2.5034-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2240 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_fetch: Succeeded
NOTE: Running task 2241 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 2242 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_unpack)
NOTE: recipe curl-7.83.1-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2243 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe diffoscope-216-r0: task do_unpack: Started
NOTE: Running task 2244 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_patch)
NOTE: Running task 2245 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2246 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2247 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2248 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_unpack)
NOTE: Running task 2249 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2250 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 2251 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-216-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 2252 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.38-r0: task do_unpack: Started
NOTE: recipe vim-8.2.5034-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-216-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_unpack: Started
NOTE: recipe curl-7.83.1-r0: task do_patch: Started
NOTE: Running task 2253 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: Running task 2254 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: Running task 2255 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2256 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2257 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2258 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_patch)
NOTE: recipe curl-7.83.1-r0: task do_patch: Succeeded
NOTE: Running task 2259 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2260 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2261 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe diffoscope-216-r0: task do_patch: Started
NOTE: Running task 2262 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2263 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.26-r0: task do_patch: Started
NOTE: Running task 2264 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 2265 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2266 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 2267 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2268 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2269 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe diffoscope-216-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-216-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2270 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_deploy_source_date_epoch)
NOTE: Running task 2271 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_lic)
NOTE: Running task 2272 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2273 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_patch: Succeeded
NOTE: Running task 2274 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_configure)
NOTE: recipe diffoscope-216-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2275 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_patch)
NOTE: recipe diffoscope-216-r0: task do_populate_lic: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Running task 2276 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2277 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 2278 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Started
NOTE: Running task 2279 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2280 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2281 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: Running task 2282 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe diffoscope-216-r0: task do_populate_lic: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 2283 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_lic unihash changed to 8e8529d3ed1e951f83f675ee05aaf9455e39bd430196d6588b95cf4a9933e10b
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-216-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2284 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: Running task 2285 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2286 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: Running task 2287 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2288 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Succeeded
NOTE: Running task 2289 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe diffoscope-216-r0: task do_configure: Started
NOTE: Running task 2290 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: Running task 2291 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2292 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe diffoscope-216-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_configure: Started
NOTE: Running task 2293 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: Running task 2294 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_configure: Succeeded
NOTE: Running task 2295 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_compile)
NOTE: recipe diffoscope-216-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2296 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6592d480d8aaae170902a68ee445a1803e9df6f4b3484c7fd1c9bbf86134282f
NOTE: recipe vim-8.2.5034-r0: task do_unpack: Succeeded
NOTE: Running task 2325 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: Running task 2326 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe vim-8.2.5034-r0: task do_patch: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: Running task 2327 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe vim-8.2.5034-r0: task do_patch: Succeeded
NOTE: Running task 2328 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2329 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: recipe vim-8.2.5034-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2330 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2.5034-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 08abae7ae8354982c1d0ddb8c615ca1c9dda908bb56086f651c88a0eb59290aa
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2342 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe binutils-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2343 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2345 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2346 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe binutils-2.38-r0: task do_patch: Succeeded
NOTE: Running task 2347 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_compile: Succeeded
NOTE: recipe binutils-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2348 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_install: Started
NOTE: Running task 2350 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_configure_ptest_base)
NOTE: Running task 2351 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: recipe nettle-3.8-r0: task do_configure_ptest_base: Started
NOTE: Running task 2352 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe nettle-3.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2353 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe nettle-3.8-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_package)
NOTE: recipe diffoscope-216-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.26-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 2357 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe diffoscope-216-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe diffoscope-216-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_package)
NOTE: Running task 2360 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_216.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2362 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe diffoscope-216-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-216-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: Running task 2363 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe diffoscope-216-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.26-r0: task do_packagedata: Failed
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-216-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.8-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2365 tasks of which 2222 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.27-r0 to 0:0.4.26-r0) [version-going-backwards]
ERROR: python3-magic-0.4.26-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-magic/0.4.26-r0/temp/log.do_packagedata.561495
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.26.bb:do_packagedata) failed with exit code '1'

--===============2216846878443863380==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-215-216.patch"

From 45254cccf961c562f5d61bd417fdee4d9f7a4b28 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 13:01:15 +0000
Subject: [PATCH] diffoscope: upgrade 215 -> 216

---
 .../diffoscope/{diffoscope_215.bb => diffoscope_216.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_215.bb => diffoscope_216.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_215.bb b/meta/recipes-support/diffoscope/diffoscope_216.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_215.bb
rename to meta/recipes-support/diffoscope/diffoscope_216.bb
index a61d68f7eb..87172e9512 100644
--- a/meta/recipes-support/diffoscope/diffoscope_215.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_216.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4754ad3356b0acc1d2ceffbfa516961a7df0a2d816cd3cce6c9d084ce54d9433"
+SRC_URI[sha256sum] = "7809caabf4369a1f1dffb9fa37e247b4326aa3366cabd6ab3eb7de5cb4402c39"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.31.1


--===============2216846878443863380==--

