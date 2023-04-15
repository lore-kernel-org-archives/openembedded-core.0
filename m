Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C05AC88C83
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.13806.1681581685431984805
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RCVEm7U8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018786143557-bebc3d41-b47c-4427-96cc-de1e7b4b7910-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yj4bj+QDS9+kpS8pMol4mb1hlGpKCuh2GCehrXSbR+M=;
	b=RCVEm7U8naEZKarGLeNKuBLpaMf7SJgGaV40GC5XI1sP+kwTlVNUkVlsSPLXL9q2
	odoJBVlaXvTVT7zdotbytbycrCUqhCtp053y8zpdc2QmPlfP/Jl33/PF8cj7B45yljU
	MyhSOnkAL72P7hpLtUAEGxp58rzTGxTS8JHQ1mH8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yj4bj+QDS9+kpS8pMol4mb1hlGpKCuh2GCehrXSbR+M=;
	b=HfRltfZgsWPoiOyf7RFpXbMQ0cNCx4v9iv3Ue3b7npvB6IZyDHy1Tv05VLCELKdJ
	t4kDtyLFi6e9o3FRQDHENYL7+uEz2fdQptjRZGq+BZLRHAO1OGJtijIWys/Mr4SXVeJ
	PDxsDoMvQX+7WcYKtjNY3uwnF7n0pME0BmMG0/Cc=
Content-Type: multipart/mixed; boundary="===============4667251149192416894=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.21.1 SUCCEEDED
Message-ID: <0101018786143557-bebc3d41-b47c-4427-96cc-de1e7b4b7910-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180048

--===============4667251149192416894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.21.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.20.1-0.21.1.patch
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
--===============4667251149192416894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:7896474770f9317fc2f0d6383208a5ba333711f9"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 77 Local 13 Mirrors 0 Missed 64 Current 439 (16% match, 87% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 447 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxml2/2.10.3-r0/temp/log.do_packagedata_setscene.2646929
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 515 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package_setscene)
NOTE: Running task 896 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: Running task 897 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 948 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 983 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 996 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_fetch)
NOTE: Running task 1031 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1035 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 1179 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: Running task 1198 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_fetch)
NOTE: Running task 1199 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1203 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1204 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1205 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: Running task 1269 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1270 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1271 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1272 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1273 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 1274 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.0.1-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1298 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe curl-8.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1327 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1353 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1368 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: Running task 1449 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1462 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_fetch)
NOTE: Running task 1463 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 1476 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1477 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: Running task 1478 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1479 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1480 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: Running task 1481 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1492 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: Running task 1524 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 1525 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe curl-8.0.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: Running task 1637 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1639 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1640 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Succeeded
NOTE: Running task 1641 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_unpack)
NOTE: Running task 1642 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1643 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1644 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: Running task 1645 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_package_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: Running task 1646 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1647 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1648 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Succeeded
NOTE: Running task 1649 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1650 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1651 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1652 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1653 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1654 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1655 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: Running task 1656 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1657 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.0.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: Running task 1658 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1659 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1660 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 1661 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: Running task 1662 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1663 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: Running task 1664 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: Running task 1665 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Started
NOTE: Running task 1666 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1667 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1668 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: Running task 1669 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1670 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe curl-8.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 1671 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1672 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_generate_toolchain_file)
NOTE: Running task 1673 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1674 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1675 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1676 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 1677 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1678 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1679 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic unihash changed to 41fdd12f168f2f36edfe64572f3dd0291d1760e55284963136ed98eb0e466592
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1680 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 1681 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1682 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.10.3-r0: task do_package_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1720 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1723 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1732 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1733 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1734 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1735 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1736 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1737 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1739 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1741 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 1742 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1743 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 1744 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: Running task 1745 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_compile)
NOTE: recipe file-5.44-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1746 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: Running task 1747 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1748 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile)
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Started
NOTE: recipe file-5.44-r0: task do_compile: Succeeded
NOTE: Running task 1749 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1750 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe file-5.44-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_install: Succeeded
NOTE: Running task 1751 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot)
NOTE: Running task 1752 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package)
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: recipe file-5.44-r0: task do_package: Started
NOTE: Running task 1753 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 1754 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1755 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1756 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_package: Succeeded
NOTE: Running task 1757 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_packagedata: Started
NOTE: recipe file-5.44-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Succeeded
NOTE: Running task 1758 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1759 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_install: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install: Succeeded
NOTE: Running task 1760 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1761 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot)
NOTE: Running task 1762 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_package)
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_package: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1763 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1764 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 1765 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_package: Succeeded
NOTE: Running task 1766 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1767 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1768 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 1769 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 1770 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1771 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 1772 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1773 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1774 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 1775 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1776 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 1777 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1778 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 1779 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 1780 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1781 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1782 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1783 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1784 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1786 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1787 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1788 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1789 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1790 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1791 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1792 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1793 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_configure)
NOTE: recipe curl-8.0.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1794 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1796 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_configure_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1797 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_compile)
NOTE: recipe curl-8.0.1-r0: task do_compile: Started
NOTE: recipe curl-8.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1798 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_compile_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1799 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_install)
NOTE: recipe curl-8.0.1-r0: task do_install: Started
NOTE: recipe curl-8.0.1-r0: task do_install: Succeeded
NOTE: Running task 1800 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_install_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1801 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_populate_sysroot)
NOTE: Running task 1802 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_package)
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.0.1-r0: task do_package: Started
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_package: Succeeded
NOTE: Running task 1803 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_packagedata)
NOTE: recipe curl-8.0.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1804 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1805 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1806 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1807 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1808 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1809 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1810 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1811 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1812 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1813 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_configure: Succeeded
NOTE: Running task 1814 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_compile: Succeeded
NOTE: Running task 1815 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_install: Succeeded
NOTE: Running task 1816 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_populate_sysroot)
NOTE: Running task 1817 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1818 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1819 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_package: Succeeded
NOTE: Running task 1820 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 1821 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1822 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1824 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 1825 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1826 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: Running task 1827 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1828 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1829 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 1830 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1831 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1832 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1833 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 1834 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1835 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1836 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 1837 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 1838 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_install)
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 1839 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1841 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1843 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_write_rpm)
NOTE: Running task 1844 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1845 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1845 tasks of which 1649 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4667251149192416894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.0.20.1", added "/usr/lib/.debug/libcreaterepo_c.so.0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1158848 to 1213820 (+5%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 142602 to 146318 (+3%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1222467 to 1271448 (+4%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.20.1", added "/usr/lib/libcreaterepo_c.so.0.21.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 526215 to 534884 (+2%)
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.20.1" to "0.21.1"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.20.1 [default] to 0.21.1 [default]
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.20.1 to libcreaterepo_c.so.0.21.1
  /usr/lib/libcreaterepo_c.so.0.20.1 moved to /usr/lib/libcreaterepo_c.so.0.21.1

--===============4667251149192416894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:7896474770f9317fc2f0d6383208a5ba333711f9"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 77 Local 13 Mirrors 0 Missed 64 Current 439 (16% match, 87% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 447 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libxml2/2.10.3-r0/temp/log.do_packagedata_setscene.3446612
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 515 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 896 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: Running task 897 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 948 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 983 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 996 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_fetch)
NOTE: Running task 1031 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1035 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: Running task 1179 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: Running task 1198 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_fetch)
NOTE: Running task 1199 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1203 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1204 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: Running task 1205 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: Running task 1252 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1253 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1254 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1255 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe curl-8.0.1-r0: task do_fetch: Started
NOTE: Running task 1256 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: Running task 1257 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1258 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe curl-8.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1296 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_unpack)
NOTE: Running task 1306 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1327 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Succeeded
NOTE: Running task 1426 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_unpack)
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1450 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1460 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: Running task 1461 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1462 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1463 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1464 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 1465 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: Running task 1466 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 1470 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_fetch)
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: Running task 1509 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 1510 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe curl-8.0.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Started
NOTE: Running task 1637 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: Running task 1639 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1640 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1641 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_patch)
NOTE: Running task 1642 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Succeeded
NOTE: Running task 1643 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_unpack)
NOTE: Running task 1644 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1645 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: Running task 1646 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: Running task 1647 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1648 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: Running task 1649 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Succeeded
NOTE: Running task 1650 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1651 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1652 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_patch)
NOTE: Running task 1653 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1654 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1655 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1656 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: Running task 1657 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: Running task 1658 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.0.1-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.0.1-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1659 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1660 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1661 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 1662 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: Running task 1663 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_patch)
NOTE: recipe curl-8.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1664 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: Running task 1665 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: Running task 1666 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1667 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1668 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1669 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1670 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe curl-8.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1671 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 1672 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: Running task 1673 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1674 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_generate_toolchain_file)
NOTE: Running task 1675 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: Running task 1676 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1677 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1678 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1679 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic unihash changed to 41fdd12f168f2f36edfe64572f3dd0291d1760e55284963136ed98eb0e466592
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1680 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 1681 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 1682 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: Setscene tasks completed
NOTE: Running task 1720 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1723 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1732 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1733 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1734 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1735 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1736 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1737 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1739 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1741 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 1742 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1743 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 1744 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: Running task 1745 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_compile)
NOTE: recipe file-5.44-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1746 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: Running task 1747 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1748 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile)
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1749 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_install)
NOTE: recipe file-5.44-r0: task do_install: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: recipe file-5.44-r0: task do_install: Succeeded
NOTE: Running task 1751 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: Running task 1752 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot)
NOTE: Running task 1753 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package)
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 1754 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1755 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1756 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_package: Succeeded
NOTE: Running task 1757 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_packagedata: Started
NOTE: recipe file-5.44-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Succeeded
NOTE: Running task 1758 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1759 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_install: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install: Succeeded
NOTE: Running task 1760 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1761 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot)
NOTE: Running task 1762 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_package)
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_package: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1763 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1764 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 1765 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_package: Succeeded
NOTE: Running task 1766 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1767 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1768 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 1769 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 1770 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 1771 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1772 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1773 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1774 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 1775 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1776 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 1777 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1778 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 1779 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 1780 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1781 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1782 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1783 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1784 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1786 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1787 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1788 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1789 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1790 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1791 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1792 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1793 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_configure)
NOTE: recipe curl-8.0.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1794 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1796 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_configure_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1797 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_compile)
NOTE: recipe curl-8.0.1-r0: task do_compile: Started
NOTE: recipe curl-8.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1798 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_compile_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1799 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_install)
NOTE: recipe curl-8.0.1-r0: task do_install: Started
NOTE: recipe curl-8.0.1-r0: task do_install: Succeeded
NOTE: Running task 1800 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_install_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1801 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_populate_sysroot)
NOTE: Running task 1802 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_package)
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.0.1-r0: task do_package: Started
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_package: Succeeded
NOTE: Running task 1803 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_packagedata)
NOTE: recipe curl-8.0.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1804 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1805 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1806 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1807 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1808 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1809 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1810 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1811 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1812 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1813 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_configure: Succeeded
NOTE: Running task 1814 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_compile: Succeeded
NOTE: Running task 1815 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_install: Succeeded
NOTE: Running task 1816 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_populate_sysroot)
NOTE: Running task 1817 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1818 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1819 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_package: Succeeded
NOTE: Running task 1820 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 1821 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1822 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1824 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 1825 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1826 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: Running task 1827 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1828 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1829 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 1830 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1831 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1832 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1833 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 1834 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1835 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1836 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 1837 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 1838 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_install)
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 1839 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1841 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1843 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_write_rpm)
NOTE: Running task 1844 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1845 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1845 tasks of which 1649 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4667251149192416894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.20.1", added "/usr/lib/libcreaterepo_c.so.0.21.1"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.20.1 to libcreaterepo_c.so.0.21.1
  /usr/lib/libcreaterepo_c.so.0.20.1 moved to /usr/lib/libcreaterepo_c.so.0.21.1

--===============4667251149192416894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 71 recipes from the core2-32 sysroot...done.
Removing 76 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7896474770f9317fc2f0d6383208a5ba333711f9"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 258 Local 174 Mirrors 0 Missed 84 Current 164 (67% match, 80% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 165 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 171 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 172 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 177 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 178 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 180 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 539 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: Running task 540 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 541 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 592 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 594 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 603 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_fetch)
NOTE: Running task 616 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running task 617 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 618 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 671 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: Running task 672 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_fetch)
NOTE: Running task 673 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 674 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running task 675 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_fetch)
NOTE: Running task 676 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 677 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 678 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 679 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: Running task 713 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 714 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe curl-8.0.1-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Started
NOTE: Running task 771 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libxml2/2.10.3-r0/temp/log.do_packagedata_setscene.3708502
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 264 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package_setscene)
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe curl-8.0.1-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: Running task 772 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 773 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 774 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 775 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_unpack)
NOTE: Running task 776 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 777 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 778 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 779 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_unpack)
NOTE: Running task 780 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 781 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 782 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 265 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: Running setscene task 266 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 783 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 784 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: Running task 785 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_unpack)
NOTE: recipe zstd-1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 786 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 787 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 788 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe curl-8.0.1-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 789 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Succeeded
NOTE: Running task 790 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 791 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 272 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running task 792 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running task 798 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Started
NOTE: Running task 803 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 279 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 808 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: Running task 809 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 810 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: Running task 811 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 820 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 821 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 822 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 823 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 828 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 293 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_package_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 833 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 834 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.0.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: Running task 835 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_patch)
NOTE: Running task 836 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: Running task 837 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 852 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_patch)
NOTE: Running task 853 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: Running task 854 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_patch: Started
NOTE: Running task 855 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 857 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 861 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.0.1-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 862 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 863 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 868 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 877 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 878 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_generate_toolchain_file)
NOTE: Running task 879 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 880 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: Running task 881 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 882 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 883 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe curl-8.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic unihash changed to 41fdd12f168f2f36edfe64572f3dd0291d1760e55284963136ed98eb0e466592
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: Running task 892 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 893 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 894 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 895 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 896 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_setscene)
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 897 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 902 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 327 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 330 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 911 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 334 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 400 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 403 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 420 of 422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1105 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1106 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1107 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1118 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1164 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1223 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1224 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1227 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1228 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1229 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1230 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1325 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1376 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe zstd-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1377 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1378 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe zstd-1.5.4-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1379 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1380 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1381 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: Running task 1382 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1383 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1384 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1385 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: Running task 1386 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: Running task 1387 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1388 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: Running task 1389 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe zstd-1.5.4-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1390 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1391 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1392 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1393 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1394 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1395 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1396 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1397 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1398 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1399 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1400 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1401 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1402 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1403 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1404 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1405 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1406 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1407 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: Running task 1408 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1409 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1410 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: Running task 1411 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 1412 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1413 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1414 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1415 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Running task 1416 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: Running task 1417 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1418 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: Running task 1419 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1420 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 1421 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: Running task 1422 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1423 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 1424 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1425 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Started
NOTE: recipe file-5.44-r0: task do_compile: Succeeded
NOTE: Running task 1426 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_install: Succeeded
NOTE: Running task 1427 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot)
NOTE: Running task 1428 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package)
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.44-r0: task do_package: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1429 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1430 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1431 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: recipe file-5.44-r0: task do_package: Succeeded
NOTE: Running task 1432 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: Running task 1433 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe file-5.44-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1434 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1435 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe file-5.44-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 1436 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1437 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1438 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1439 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 1440 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Succeeded
NOTE: Running task 1441 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1442 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_install: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install: Succeeded
NOTE: Running task 1443 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1444 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot)
NOTE: Running task 1445 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_package)
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_package: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1446 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1447 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe zstd-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1448 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_install)
NOTE: recipe zstd-1.5.4-r0: task do_install: Started
NOTE: recipe libgpg-error-1.46-r0: task do_package: Succeeded
NOTE: Running task 1449 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 1450 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 1451 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1452 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe zstd-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 1453 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 1454 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1455 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.4-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1456 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1457 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1458 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe zstd-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 1459 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_packagedata)
NOTE: recipe zstd-1.5.4-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 1460 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1461 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 1462 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1463 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 1464 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 1465 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1466 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1467 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 1468 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 1469 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 1470 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1473 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1474 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1475 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1476 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1477 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1478 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1479 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1480 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1481 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1482 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1483 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_configure)
NOTE: recipe curl-8.0.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1484 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1485 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1486 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_configure_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1487 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_compile)
NOTE: recipe curl-8.0.1-r0: task do_compile: Started
NOTE: recipe curl-8.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1488 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_compile_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1489 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_install)
NOTE: recipe curl-8.0.1-r0: task do_install: Started
NOTE: recipe curl-8.0.1-r0: task do_install: Succeeded
NOTE: Running task 1490 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_install_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1491 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_populate_sysroot)
NOTE: Running task 1492 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_package)
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.0.1-r0: task do_package: Started
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_package: Succeeded
NOTE: Running task 1493 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_packagedata)
NOTE: recipe curl-8.0.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1494 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1495 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1497 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1498 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1499 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1500 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1501 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1502 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1503 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_install: Succeeded
NOTE: Running task 1506 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_populate_sysroot)
NOTE: Running task 1507 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1508 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1509 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1512 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1514 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 1515 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1516 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: Running task 1517 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1518 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1519 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 1520 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1521 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1523 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 1524 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1525 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_install)
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 1529 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 1530 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1531 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 1532 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1533 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_write_rpm)
NOTE: Running task 1534 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1535 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1535 tasks of which 1281 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4667251149192416894==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.20.1-0.21.1.patch"

RnJvbSBmNjEyMzM0Y2JjYTIxNTc0MTIxZDBkYWVjNmEzYjUyZTg4MDQ2NzE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMDg6NTE6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cmVhdGVyZXBvLWM6IHVwZ3JhZGUgMC4yMC4xIC0+IDAuMjEuMQoKLS0tCiAuLi4vY3JlYXRlcmVw
by1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2ggICAgICB8IDkgKysrKysrLS0t
CiAuLi4ve2NyZWF0ZXJlcG8tY18wLjIwLjEuYmIgPT4gY3JlYXRlcmVwby1jXzAuMjEuMS5iYn0g
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMve2NyZWF0ZXJlcG8t
Y18wLjIwLjEuYmIgPT4gY3JlYXRlcmVwby1jXzAuMjEuMS5iYn0gKDk2JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLWlu
Y2x1ZGUtcnBtLXJwbXN0cmluZy5oLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0
ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRjaApp
bmRleCBhMjQ5ZWFmNWExLi44N2NmNzI3MjEzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0cmlu
Zy5oLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRl
cmVwby1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2gKQEAgLTEsNyArMSw3IEBA
Ci1Gcm9tIDhkZWZlNmFhZjkxNjEzYzNmY2I1NDBkZjY1YTk0Y2Q1NmQzNzczNjcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDU0MzAyODYzMzU1NDhlZjFiZGQ0MGE1M2MzZjE5MzVkYjEy
NTFlM2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgogRGF0ZTogRnJpLCAxMyBKYW4gMjAyMyAxMzoyMTo1MSAtMDgwMAotU3ViamVj
dDogW1BBVENIIDEvMl0gaW5jbHVkZSBycG0vcnBtc3RyaW5nLmgKK1N1YmplY3Q6IFtQQVRDSF0g
aW5jbHVkZSBycG0vcnBtc3RyaW5nLmgKIAogSXRzIG5lZWRlZCBmb3IgcmFzcHJpbnRmIGRlY2xh
cmF0aW9uCiAKQEAgLTExLDEwICsxMSwxMyBAQCBvbiAncmFzcHJpbnRmJzsgSVNPIEM5OSBhbmQg
bGF0ZXIgZG8gbm90IHN1cHBvcnQgaW1wbGljaXQgZnVuY3Rpb24gZGVjbGFyYXRpb25zCiAKIFVw
c3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJl
LW1hbmFnZW1lbnQvY3JlYXRlcmVwb19jL3B1bGwvMzQwXQogU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KKwogLS0tCiAgc3JjL3htbF9maWxlLmMgfCAxICsKICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAorZGlmZiAtLWdpdCBhL3NyYy94bWxfZmls
ZS5jIGIvc3JjL3htbF9maWxlLmMKK2luZGV4IGQyNDAwYjguLjg3MTEwOWMgMTAwNjQ0CiAtLS0g
YS9zcmMveG1sX2ZpbGUuYwogKysrIGIvc3JjL3htbF9maWxlLmMKIEBAIC0xOSw2ICsxOSw3IEBA
CkBAIC0yMyw1ICsyNiw1IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiAgI2luY2x1ZGUgPGdsaWIvZ3N0ZGlvLmg+CiArI2luY2x1ZGUgPHJwbS9ycG1zdHJp
bmcuaD4KICAjaW5jbHVkZSA8YXNzZXJ0Lmg+CisgI2luY2x1ZGUgPHJwbS9ycG1zdHJpbmcuaD4K
ICAjaW5jbHVkZSAieG1sX2ZpbGUuaCIKLSAjaW5jbHVkZSA8ZXJybm8uaD4KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzAuMjAuMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzAuMjEu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18wLjIwLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzAuMjEuMS5iYgppbmRleCAx
YzRjZGQ1ZTNjLi4wZjFmN2FhNmZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18wLjIwLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMC4yMS4xLmJiCkBAIC05LDcgKzksNyBA
QCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvY3Jl
YXRlcmVwb19jO2JyYW5jaD1tYXN0ZXI7cAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pbmNsdWRl
LXJwbS1ycG1zdHJpbmcuaC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gImFmMTRl
MTY0YTNlNGFiOWRmYWVmMTIxMmU4NTJiOWVjZWJjMzI2YTIiCitTUkNSRVYgPSAiMDY1MmQ3MzAz
Y2UyMzZlNTk2YzgzYzI5Y2NjOWJlZTc4NjhmY2U2ZSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIK
IAotLSAKMi4zOS4yCgo=

--===============4667251149192416894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:7896474770f9317fc2f0d6383208a5ba333711f9"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 77 Local 13 Mirrors 0 Missed 64 Current 439 (16% match, 87% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 447 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libxml2/2.10.3-r0/temp/log.do_packagedata_setscene.2909873
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 515 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package_setscene)
NOTE: Running task 896 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: Running task 897 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 948 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 983 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 996 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_fetch)
NOTE: Running task 1031 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1035 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 1179 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: Running task 1198 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_fetch)
NOTE: Running task 1199 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1203 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: Running task 1204 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1205 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: Running task 1349 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1350 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1351 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.0.1-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: Running task 1352 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 1353 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1354 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1369 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe curl-8.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1417 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_unpack)
NOTE: Running task 1431 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1448 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: Running task 1457 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: Running task 1462 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1547 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_unpack)
NOTE: Running task 1560 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 1561 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1563 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1564 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1565 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: Running task 1592 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1631 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 1632 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1638 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe curl-8.0.1-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1639 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1640 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1641 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Succeeded
NOTE: Running task 1642 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: Running task 1643 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: Running task 1644 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1645 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1646 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: Running task 1647 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Started
NOTE: Running task 1648 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.10.3-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: Running task 1649 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Succeeded
NOTE: Running task 1650 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1651 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: Running task 1652 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1653 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1654 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1655 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1656 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: Running task 1657 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: Running task 1658 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_patch: Started
NOTE: Running task 1659 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1660 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 1661 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: Running task 1662 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: Running task 1663 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1664 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: Running task 1665 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe curl-8.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1666 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: Running task 1667 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: Running task 1668 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1669 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: Running task 1670 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe curl-8.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 1671 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1672 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_generate_toolchain_file)
NOTE: Running task 1673 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic)
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1674 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1675 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: Running task 1676 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: Running task 1677 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Started
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1678 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic unihash changed to 41fdd12f168f2f36edfe64572f3dd0291d1760e55284963136ed98eb0e466592
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1679 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1680 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 1681 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1719 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1722 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1723 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1732 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1733 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1734 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1735 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1736 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1737 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1739 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1741 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 1742 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1743 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 1744 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: Running task 1745 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_compile)
NOTE: recipe file-5.44-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1746 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: Running task 1747 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1748 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile)
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1749 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe file-5.44-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_install)
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Running task 1751 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot)
NOTE: Running task 1753 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 1754 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.44-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1755 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1756 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_package: Succeeded
NOTE: Running task 1757 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_packagedata: Started
NOTE: recipe file-5.44-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Succeeded
NOTE: Running task 1758 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1759 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_install: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install: Succeeded
NOTE: Running task 1760 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1761 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot)
NOTE: Running task 1762 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_package)
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_package: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1763 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1764 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 1765 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_package: Succeeded
NOTE: Running task 1766 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1767 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1768 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 1769 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 1770 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1771 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 1772 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1773 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1774 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 1775 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1776 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 1777 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1778 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 1779 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 1780 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1781 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1782 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1783 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1784 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1786 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1787 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1788 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1789 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1790 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1791 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1792 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1793 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_configure)
NOTE: recipe curl-8.0.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1794 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1796 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_configure_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1797 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_compile)
NOTE: recipe curl-8.0.1-r0: task do_compile: Started
NOTE: recipe curl-8.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1798 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_compile_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1799 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_install)
NOTE: recipe curl-8.0.1-r0: task do_install: Started
NOTE: recipe curl-8.0.1-r0: task do_install: Succeeded
NOTE: Running task 1800 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_install_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1801 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_populate_sysroot)
NOTE: Running task 1802 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_package)
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.0.1-r0: task do_package: Started
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_package: Succeeded
NOTE: Running task 1803 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_packagedata)
NOTE: recipe curl-8.0.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1804 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1805 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1806 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1807 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1808 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1809 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1810 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1811 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1812 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1813 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_configure: Succeeded
NOTE: Running task 1814 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_compile: Succeeded
NOTE: Running task 1815 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_install: Succeeded
NOTE: Running task 1816 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_populate_sysroot)
NOTE: Running task 1817 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1818 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1819 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_package: Succeeded
NOTE: Running task 1820 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 1821 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1822 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1824 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 1825 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1826 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: Running task 1827 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1828 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1829 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 1830 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1831 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1832 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1833 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 1834 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1835 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1836 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 1837 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 1838 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_install)
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 1839 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1841 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1843 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_write_rpm)
NOTE: Running task 1844 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1845 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1845 tasks of which 1649 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4667251149192416894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:7896474770f9317fc2f0d6383208a5ba333711f9"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 81 Local 13 Mirrors 0 Missed 68 Current 435 (16% match, 86% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 443 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libxml2/2.10.3-r0/temp/log.do_packagedata_setscene.3171444
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 515 of 516 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_package_setscene)
NOTE: Running task 895 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: Running task 896 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 897 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_fetch)
NOTE: Running task 946 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 981 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 991 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_fetch)
NOTE: Running task 1024 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1028 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_fetch)
NOTE: Running task 1168 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_fetch)
NOTE: Running task 1187 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_fetch)
NOTE: Running task 1188 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_fetch)
NOTE: Running task 1192 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running task 1193 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1194 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1317 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_unpack)
NOTE: Running task 1318 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1319 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.0.1-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1320 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Started
NOTE: Running task 1321 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1322 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 1323 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1324 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_unpack)
NOTE: Running task 1328 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1345 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 1346 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.44-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Started
NOTE: Running task 1347 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1407 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running task 1421 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_unpack)
NOTE: Running task 1422 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1423 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 1424 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1425 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1426 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: Running task 1447 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: recipe elfutils-0.188-r0: task do_fetch: Succeeded
NOTE: Running task 1460 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: Running task 1474 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_unpack)
NOTE: recipe file-5.44-r0: task do_fetch: Succeeded
NOTE: Running task 1499 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_unpack)
NOTE: Running task 1500 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe curl-8.0.1-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Started
NOTE: Running task 1627 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Started
NOTE: recipe file-5.44-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Started
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running task 1628 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe nettle-3.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1629 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1630 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_patch)
NOTE: Running task 1631 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1632 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_unpack)
NOTE: Running task 1633 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: Running task 1634 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: Running task 1635 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: Running task 1636 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: Running task 1637 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.10.3-r0: task do_package_setscene: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Started
NOTE: Running task 1638 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_patch: Succeeded
NOTE: Running task 1639 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1640 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1641 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1642 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1643 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1644 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1645 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_unpack: Succeeded
NOTE: Running task 1646 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1647 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: Running task 1648 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1649 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1650 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe file-5.44-r0: task do_patch: Started
NOTE: recipe curl-8.0.1-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1651 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_patch: Succeeded
NOTE: Running task 1652 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: Running task 1653 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1654 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: Running task 1655 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1656 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe curl-8.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1657 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Started
NOTE: recipe nettle-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: Running task 1658 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure)
NOTE: Running task 1659 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1660 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1661 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Started
NOTE: Running task 1662 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_patch)
NOTE: Running task 1663 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: Running task 1664 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_configure)
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 1665 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1666 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_generate_toolchain_file)
NOTE: Running task 1667 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 1668 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1669 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Started
NOTE: recipe elfutils-0.188-r0: task do_unpack: Succeeded
NOTE: Running task 1670 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_patch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_lic unihash changed to 41fdd12f168f2f36edfe64572f3dd0291d1760e55284963136ed98eb0e466592
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1671 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1672 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.188-r0: task do_patch: Succeeded
NOTE: Running task 1673 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1675 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libxml2-2.10.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1713 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1716 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1725 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1726 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1727 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1728 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile)
NOTE: recipe nettle-3.8.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1729 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 1730 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1731 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1732 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1733 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 1734 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1735 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 1736 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1737 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: Running task 1738 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe file-5.44-r0: task do_configure: Succeeded
NOTE: Running task 1739 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: Running task 1741 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.44-r0: task do_compile: Succeeded
NOTE: Running task 1742 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_install)
NOTE: recipe file-5.44-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1743 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe file-5.44-r0: task do_install: Succeeded
NOTE: Running task 1744 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot)
NOTE: Running task 1745 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package)
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: Running task 1746 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure_ptest_base)
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: recipe file-5.44-r0: task do_package: Started
NOTE: Running task 1747 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1748 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1749 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1750 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 1751 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1752 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 1753 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1754 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 1755 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_package: Succeeded
NOTE: Running task 1756 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata)
NOTE: recipe file-5.44-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.44-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_compile: Succeeded
NOTE: Running task 1757 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.46-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1758 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_install: Started
NOTE: recipe libgpg-error-1.46-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 1760 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1761 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot)
NOTE: Running task 1762 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1763 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 1764 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1765 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_package: Succeeded
NOTE: Running task 1766 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata)
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1767 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_compile)
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1768 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_install)
NOTE: recipe libarchive-3.6.2-r0: task do_install: Started
NOTE: recipe libarchive-3.6.2-r0: task do_install: Succeeded
NOTE: Running task 1769 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot)
NOTE: Running task 1770 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_package)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1771 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.2-r0: task do_package: Succeeded
NOTE: Running task 1772 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1773 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1774 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 1775 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1776 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 1777 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1778 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 1779 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 1780 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1781 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_install)
NOTE: recipe libunistring-1.1-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_install: Succeeded
NOTE: Running task 1782 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot)
NOTE: Running task 1783 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_package)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1784 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_package: Succeeded
NOTE: Running task 1786 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1787 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1788 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_install)
NOTE: recipe libidn2-2.3.4-r0: task do_install: Started
NOTE: recipe libidn2-2.3.4-r0: task do_install: Succeeded
NOTE: Running task 1789 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 1790 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1791 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1792 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1793 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_configure)
NOTE: recipe curl-8.0.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1794 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure)
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1796 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_configure_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1797 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_compile)
NOTE: recipe curl-8.0.1-r0: task do_compile: Started
NOTE: recipe curl-8.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1798 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_compile_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1799 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_install)
NOTE: recipe curl-8.0.1-r0: task do_install: Started
NOTE: recipe curl-8.0.1-r0: task do_install: Succeeded
NOTE: Running task 1800 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_install_ptest_base)
NOTE: recipe curl-8.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1801 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_populate_sysroot)
NOTE: Running task 1802 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_package)
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.0.1-r0: task do_package: Started
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_package: Succeeded
NOTE: Running task 1803 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_packagedata)
NOTE: recipe curl-8.0.1-r0: task do_packagedata: Started
NOTE: recipe curl-8.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1804 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1805 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile)
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1806 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1807 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install)
NOTE: recipe gnutls-3.8.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install: Succeeded
NOTE: Running task 1808 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1809 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot)
NOTE: Running task 1810 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_package)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1811 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1812 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.0-r0: task do_package: Succeeded
NOTE: Running task 1813 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_configure: Succeeded
NOTE: Running task 1814 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_compile: Succeeded
NOTE: Running task 1815 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_install: Succeeded
NOTE: Running task 1816 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_populate_sysroot)
NOTE: Running task 1817 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1818 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1819 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure)
NOTE: recipe elfutils-0.188-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_package: Succeeded
NOTE: Running task 1820 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_configure: Succeeded
NOTE: Running task 1821 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1822 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile)
NOTE: recipe elfutils-0.188-r0: task do_compile: Started
NOTE: recipe elfutils-0.188-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1824 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install)
NOTE: recipe elfutils-0.188-r0: task do_install: Started
NOTE: recipe elfutils-0.188-r0: task do_install: Succeeded
NOTE: Running task 1825 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.188-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1826 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot)
NOTE: Running task 1827 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_package)
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1828 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1829 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe elfutils-0.188-r0: task do_package: Succeeded
NOTE: Running task 1830 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata)
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1831 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1832 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 1833 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot)
NOTE: Running task 1834 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1835 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1836 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_configure)
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 1837 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_compile)
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 1838 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_install)
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 1839 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1841 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1843 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_write_rpm)
NOTE: Running task 1844 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.21.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1845 of 1845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1845 tasks of which 1635 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.10.4-r0 to 0:2.10.3-r0) [version-going-backwards]
ERROR: libxml2-2.10.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4667251149192416894==--

