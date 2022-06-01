Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED81CCA48C
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.622.1654100324181019445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=madvC85f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010181200fea38-74cb23c6-939f-4287-a9c9-0146a502d2af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OI/lQALJ+7tVcq0y3gLC5XPPpqzfzj9EGh9v0sborSI=;
	b=madvC85f48dANGvdMP5ID/3ykBnH5XbP8t0ujfs9tppF+FllxVmQyyX09L7pyrmZ
	AnmyTiUKkrdpnH3ERMlx/hxNPTleLdCX/aNYGeLeGoOURcWy6ZoZa+1du66TaqDTl9r
	BW3z8YzT9m182exEmLs3fEab27NsHO4o6ksW8PAM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OI/lQALJ+7tVcq0y3gLC5XPPpqzfzj9EGh9v0sborSI=;
	b=L1lzd/6L1bY3uKhw8pdozzEsLLrecxiaKtKDonptlR+7T8yyv0MTEjUVQhFEScZ6
	kx44Wz7Oa/W9JQDXaEO6CMIbyu43/yR4KPFMoFWLj4GRftSzy+z5Eaon28khtL39qvQ
	IGpORMOQxTYAHzx+fS6VFjUilaYYoEcVrF238GXQ=
Content-Type: multipart/mixed; boundary="===============1320329503267228724=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.13.0 SUCCEEDED
Message-ID: 
 <01010181200fea38-74cb23c6-939f-4287-a9c9-0146a502d2af-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:42 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166411

--===============1320329503267228724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.12.0-4.13.0.patch
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
--===============1320329503267228724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-a2c867ac5361fb0fdd489e0439f0bfae8b49d5e8"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a2c867ac5361fb0fdd489e0439f0bfae8b49d5e8"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 186 Local 3 Mirrors 0 Missed 183 Current 413 (1% match, 69% complete)
Removing 23 stale sstate objects for arch ppc7400...done.
Removing 15 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 878 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_fetch)
NOTE: Running task 1020 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_fetch)
NOTE: Running task 1024 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1025 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_fetch)
NOTE: Running task 1059 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 1084 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_write_config)
NOTE: Running task 1085 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 1093 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1109 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1122 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Started
NOTE: Running task 1176 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1180 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_fetch)
NOTE: Running task 1197 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1198 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1199 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1200 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1202 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Succeeded
NOTE: Running task 1269 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: Running task 1270 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1271 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_fetch: Succeeded
NOTE: Running task 1272 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1273 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1274 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 1275 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_unpack)
NOTE: recipe curl-7.83.1-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: Running task 1276 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_unpack)
NOTE: Running task 1277 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: Running task 1278 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe curl-7.83.1-r0: task do_fetch: Succeeded
NOTE: Running task 1279 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 1320 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_write_config: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: Running task 1321 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1331 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.5-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1332 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1364 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe gnutls-3.7.5-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: Running task 1365 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 1366 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_unpack)
NOTE: Running task 1367 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1368 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: Running task 1369 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1385 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1386 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1402 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_configure)
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1403 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: Running task 1408 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe curl-7.83.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 1432 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1433 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_fetch)
NOTE: Running task 1434 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1435 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_fetch)
NOTE: Running task 1438 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1445 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1446 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_fetch)
NOTE: Running task 1447 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: Running task 1467 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 1468 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1469 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1479 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_fetch)
NOTE: Running task 1480 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_fetch)
NOTE: Running task 1483 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1502 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: Running task 1506 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_fetch)
NOTE: Running task 1507 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1508 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_fetch)
NOTE: Running task 1509 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1523 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_fetch)
NOTE: Running task 1545 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_fetch)
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.5-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 1638 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe librepo-1.14.3-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Started
NOTE: Running task 1639 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Started
NOTE: Running task 1640 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: Running task 1641 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1642 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 1643 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe libdnf-0.67.0-r0: task do_fetch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe dnf-4.13.0-r0: task do_fetch: Started
NOTE: Running task 1644 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: Running task 1645 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: Running task 1646 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1647 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_fetch: Started
NOTE: Running task 1648 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_unpack)
NOTE: Running task 1649 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1650 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: Running task 1651 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: Running task 1652 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1653 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: Running task 1654 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1655 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_patch)
NOTE: Running task 1656 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.14.3-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Succeeded
NOTE: Running task 1657 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_unpack)
NOTE: recipe gnupg-2.3.6-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1658 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_unpack)
NOTE: Running task 1659 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1660 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.13.0-r0: task do_fetch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_patch: Started
NOTE: Running task 1661 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 1662 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 1663 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 1664 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_unpack)
NOTE: Running task 1665 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_unpack)
NOTE: Running task 1666 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_unpack)
NOTE: Running task 1667 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1668 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: Running task 1669 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: Running task 1670 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_unpack)
NOTE: Running task 1671 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_unpack)
NOTE: Running task 1672 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Started
NOTE: recipe librepo-1.14.3-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Started
NOTE: Running task 1673 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: Running task 1674 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1675 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: Running task 1676 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_unpack: Succeeded
NOTE: Running task 1677 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1678 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: recipe dnf-4.13.0-r0: task do_unpack: Started
NOTE: Running task 1679 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.3.6-r0: task do_unpack: Started
NOTE: Running task 1680 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_patch)
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Started
NOTE: Running task 1681 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1682 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: Running task 1683 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: Running task 1684 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1685 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1686 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: Running task 1687 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe curl-7.83.1-r0: task do_patch: Started
NOTE: Running task 1688 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_patch)
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: Running task 1689 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: Running task 1690 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1691 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1692 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1693 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1694 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_patch)
NOTE: Running task 1695 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: Running task 1696 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1697 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_patch: Started
NOTE: Running task 1698 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: Running task 1699 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: recipe nettle-3.7.3-r0: task do_patch: Succeeded
NOTE: Running task 1700 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1701 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1702 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1703 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: Running task 1704 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_unpack: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_unpack: Succeeded
NOTE: Running task 1705 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_patch)
NOTE: Running task 1706 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_patch)
NOTE: Running task 1707 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_patch)
NOTE: Running task 1708 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1709 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_patch)
NOTE: Running task 1710 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 1711 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1712 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1713 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1714 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1715 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_unpack: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Started
NOTE: recipe librepo-1.14.3-r0: task do_patch: Started
NOTE: Running task 1716 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1717 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_patch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1718 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Started
NOTE: recipe libdnf-0.67.0-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1719 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1720 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1721 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1722 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1723 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1724 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: Running task 1725 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1726 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1727 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1728 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: Running task 1729 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure)
NOTE: Running task 1730 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1731 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: Running task 1732 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1733 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1734 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_generate_toolchain_file)
NOTE: Running task 1735 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe librepo-1.14.3-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1736 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1737 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_generate_toolchain_file)
NOTE: Running task 1738 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: Running task 1739 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_generate_toolchain_file)
NOTE: Running task 1740 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe gnutls-3.7.5-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1741 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1742 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1743 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe librepo-1.14.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe librepo-1.14.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1744 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1745 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: recipe librepo-1.14.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: Running task 1746 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e82d54167de6cd911b786b0426fa4bccc1e380bc20788e2233d6300b4af50fa7
NOTE: Running task 1747 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1748 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_compile)
NOTE: Running task 1749 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1750 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1751 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_generate_toolchain_file)
NOTE: Running task 1752 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_populate_lic)
NOTE: recipe libdnf-0.67.0-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Started
NOTE: Running task 1753 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1754 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_generate_toolchain_file)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1755 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_install)
NOTE: recipe dnf-4.13.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.13.0-r0: task do_populate_lic: Started
NOTE: recipe libdnf-0.67.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.67.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1756 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1757 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_patch)
NOTE: recipe libdnf-0.67.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1758 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_configure)
NOTE: recipe dnf-4.13.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_populate_lic unihash changed to 5837ed29e35062b1ecc48497f69a183a04d7d45bf48debd335f341077f480b05
NOTE: recipe xorgproto-2022.1-r0: task do_install: Started
NOTE: recipe gnupg-2.3.6-r0: task do_patch: Started
NOTE: recipe dnf-4.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure: Started
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: Running task 1759 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1760 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1761 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe gnupg-2.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1762 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1763 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1764 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1765 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1b54e8aa8aee5d3ea5b54e008297ee7bbf3b94e85d7a3a78822315f8cc4766e6
NOTE: recipe xorgproto-2022.1-r0: task do_install: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: Running task 1766 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot)
NOTE: Running task 1767 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_package: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot unihash changed to 40ce10e10f6d0fe844ae821954376876e0db2aef2bd9233e4014e31ce6e5bde2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Running setscene task 583 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running task 1768 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 1769 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1770 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1771 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1772 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1783 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package unihash changed to 30055a354a68ab214b2314b47c671fcb85e3628b7aa6943629bfe32c41269450
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package became valid
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot unihash changed to a98cbfd6fa576284bb5eab1aa5e3ddd27f55d8d2c2fe47c913c1955ce6a47025
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: Running setscene task 584 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_setscene)
NOTE: Running setscene task 585 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1784 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1785 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1786 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1792 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1793 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1794 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1795 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure_ptest_base)
NOTE: Running task 1796 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 1812 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running task 1813 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1814 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot unihash changed to d35ef93d6477cb56e98f5576a1c6952429b3b0dc1229be45bef203ae5b07c240
NOTE: Setscene tasks completed
NOTE: Running task 1828 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1829 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1830 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1831 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1832 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1834 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1835 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package unihash changed to 09d9792dcb30ac43401eb0320ee77579f2a31fe5183da15321e0b82c9ff49ff3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata became valid
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1836 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 1837 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: Running task 1838 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package unihash changed to 2c775854aac7faf200cbf6686bccb315942a4c99d3c4f0bdc7b1de2808082de9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata became valid
NOTE: Running setscene task 598 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1840 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1842 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Started
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: Running task 1843 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1845 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: Running task 1846 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: Running task 1847 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1848 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: Running task 1849 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1850 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 1851 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1852 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1853 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1854 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: Running task 1855 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1856 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1857 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot unihash changed to 98c5a7a27be6d27e962e9fbbbf4129303f285edb454797b0befb8f497e778dcc
NOTE: Setscene tasks completed
NOTE: Running task 1858 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: recipe systemd-1_250.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 1859 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1860 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 1861 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe systemd-1_250.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1862 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_configure)
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: Running task 1863 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: Running task 1864 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: Running task 1865 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 1866 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe systemd-1_250.5-r0: task do_configure: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 1867 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: Running task 1868 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1869 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package unihash changed to a66a173daeb6a4051944165a9f31fbe71c426b876ed86f7e7e7ac85b95a18cb4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata became valid
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1870 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_compile)
NOTE: recipe file-5.41-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 1872 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1873 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 1874 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: Running task 1875 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1876 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: Running task 1877 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe nettle-3.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1878 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile_ptest_base)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.41-r0: task do_compile: Succeeded
NOTE: Running task 1879 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_install)
NOTE: recipe file-5.41-r0: task do_install: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Succeeded
NOTE: Running task 1880 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1881 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile)
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Started
NOTE: recipe file-5.41-r0: task do_install: Succeeded
NOTE: Running task 1882 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: Running task 1883 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_package)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.41-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1884 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 1885 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 1886 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 1887 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1888 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_package: Succeeded
NOTE: Running task 1889 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata)
NOTE: recipe file-5.41-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1890 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_packagedata: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Succeeded
NOTE: Running task 1891 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 1892 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Succeeded
NOTE: Running task 1893 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_install)
NOTE: recipe libcomps-0.1.18-r0: task do_install: Started
NOTE: recipe libcomps-0.1.18-r0: task do_install: Succeeded
NOTE: Running task 1894 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package)
NOTE: Running task 1895 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_populate_sysroot)
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1897 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_install: Started
NOTE: Running task 1898 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1899 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package: Succeeded
NOTE: Running task 1900 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_packagedata)
NOTE: recipe libgpg-error-1.45-r0: task do_install: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Started
NOTE: Running task 1901 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 1902 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package_write_rpm)
NOTE: Running task 1903 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_populate_sysroot)
NOTE: Running task 1904 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_package)
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.45-r0: task do_package: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1905 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1906 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1907 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1908 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1909 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1910 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe libksba-1.6.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_package: Succeeded
NOTE: Running task 1911 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1912 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1913 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_install)
NOTE: recipe nettle-3.7.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.7.3-r0: task do_install: Succeeded
NOTE: Running task 1915 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1916 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_install)
NOTE: recipe systemd-1_250.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1917 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install: Started
NOTE: recipe nettle-3.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1918 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot)
NOTE: recipe systemd-1_250.5-r0: task do_compile: Started
NOTE: Running task 1919 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package)
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.7.3-r0: task do_package: Started
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1920 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 1921 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 1922 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install: Succeeded
NOTE: Running task 1923 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_install_ptest_base)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1924 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_populate_sysroot)
NOTE: Running task 1925 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1926 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_compile)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1927 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 1928 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: Running task 1929 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1930 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1931 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 1932 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1933 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_install)
NOTE: recipe libksba-1.6.0-r0: task do_install: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 1934 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: Running task 1935 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe libksba-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 1936 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_package)
NOTE: Running task 1937 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1938 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1939 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1940 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_configure)
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1941 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_configure)
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Started
NOTE: recipe nettle-3.7.3-r0: task do_package: Succeeded
NOTE: Running task 1942 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata)
NOTE: recipe nettle-3.7.3-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 1943 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1944 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe libksba-1.6.0-r0: task do_package: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1945 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1946 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1947 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe systemd-1_250.5-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_install)
NOTE: recipe systemd-1_250.5-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1949 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_compile)
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Started
NOTE: recipe systemd-1_250.5-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_populate_sysroot)
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1951 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_package)
NOTE: Running task 1952 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_install)
NOTE: recipe pinentry-1.2.0-r0: task do_install: Started
NOTE: recipe systemd-1_250.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_250.5-r0: task do_package: Started
NOTE: recipe pinentry-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1953 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_package: Started
NOTE: recipe systemd-1_250.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_populate_sysroot unihash changed to 46f2f82c1b992670205777cb6bd5af61ecc9f2adb4a61cfc8c29bac52602869e
NOTE: Setscene tasks completed
NOTE: Running task 1954 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1955 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure)
NOTE: recipe dbus-1.14.0-r0: task do_configure: Started
NOTE: recipe pinentry-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1956 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_packagedata)
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package: Succeeded
NOTE: Running task 1957 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1959 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata: Failed
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Succeeded
NOTE: recipe systemd-1_250.5-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1959 tasks of which 1618 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 109 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glib-2.0/1_2.72.1-r0/temp/log.do_packagedata.3637554
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata) failed with exit code '1'

--===============1320329503267228724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGSIZE changed from 10220 to 11228 (+10%)
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-si: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 944048 to 946036 (+0%)
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/core2-32-poky-linux/dnf: PV changed from "4.12.0" to "4.13.0"
packages/core2-32-poky-linux/dnf: PKGV changed from 4.12.0 [default] to 4.13.0 [default]

--===============1320329503267228724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-a2c867ac5361fb0fdd489e0439f0bfae8b49d5e8"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a2c867ac5361fb0fdd489e0439f0bfae8b49d5e8"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 190 Local 3 Mirrors 0 Missed 187 Current 409 (1% match, 68% complete)
Removing 15 stale sstate objects for arch qemumips...done.
Removing 23 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 878 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_fetch)
NOTE: Running task 1017 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_fetch)
NOTE: Running task 1021 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1022 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 1023 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_fetch)
NOTE: Running task 1054 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 1079 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_write_config)
NOTE: Running task 1080 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 1088 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1104 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1115 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_fetch)
NOTE: Running task 1167 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1171 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_fetch)
NOTE: Running task 1185 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1189 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1190 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: Running task 1191 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1193 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Succeeded
NOTE: Running task 1258 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_fetch: Started
NOTE: Running task 1259 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_unpack)
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1260 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1261 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_unpack)
NOTE: Running task 1262 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1263 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_unpack)
NOTE: Running task 1264 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.5-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1265 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1266 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: Running task 1267 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 1268 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1269 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: Running task 1270 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1271 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_unpack)
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1305 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_write_config: Succeeded
NOTE: Running task 1306 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_unpack)
NOTE: Running task 1307 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 1313 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1325 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1343 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: Running task 1344 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: Running task 1363 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 1364 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1376 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1377 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1379 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1396 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_configure)
NOTE: Running task 1397 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: Running task 1399 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: Running task 1423 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.83.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 1424 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_fetch)
NOTE: Running task 1425 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1426 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_fetch)
NOTE: Running task 1429 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.5-r0: task do_unpack: Started
NOTE: Running task 1436 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1437 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: Running task 1438 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_fetch)
NOTE: Running task 1458 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1459 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 1460 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1470 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_fetch)
NOTE: Running task 1471 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: Running task 1474 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1491 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: Running task 1495 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_fetch)
NOTE: Running task 1496 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1497 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_fetch)
NOTE: Running task 1498 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1512 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_fetch)
NOTE: Running task 1534 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_fetch)
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch)
NOTE: Running task 1628 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 1629 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1630 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Started
NOTE: Running task 1631 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe librepo-1.14.3-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: Running task 1632 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: Running task 1633 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1634 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: Running task 1635 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: Running task 1636 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_patch)
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Started
NOTE: Running task 1637 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: Running task 1638 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1639 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1640 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1641 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.67.0-r0: task do_fetch: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: Running task 1642 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_unpack)
NOTE: Running task 1643 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1644 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1645 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: Running task 1646 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_fetch: Started
NOTE: recipe gnupg-2.3.6-r0: task do_fetch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Started
NOTE: Running task 1647 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: recipe librepo-1.14.3-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Succeeded
NOTE: Running task 1648 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: Running task 1649 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: Running task 1650 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 1651 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_unpack)
NOTE: Running task 1652 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_unpack)
NOTE: Running task 1653 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: Running task 1654 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_unpack)
NOTE: Running task 1655 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_unpack)
NOTE: Running task 1656 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1657 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.67.0-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 1658 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_unpack)
NOTE: Running task 1659 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: Running task 1660 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_unpack)
NOTE: recipe dnf-4.13.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1661 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe curl-7.83.1-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1662 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_patch)
NOTE: Running task 1663 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: Running task 1664 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1665 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1666 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1667 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: Running task 1668 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1669 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1670 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 1671 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe librepo-1.14.3-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Started
NOTE: Running task 1672 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1673 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_unpack: Started
NOTE: Running task 1674 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: recipe dnf-4.13.0-r0: task do_unpack: Started
NOTE: recipe libdnf-0.67.0-r0: task do_unpack: Started
NOTE: Running task 1675 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe curl-7.83.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: recipe nettle-3.7.3-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1676 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: Running task 1677 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 1678 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: recipe curl-7.83.1-r0: task do_patch: Succeeded
NOTE: Running task 1679 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: Running task 1680 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: Running task 1681 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1682 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_patch)
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: Running task 1683 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: Running task 1684 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_patch)
NOTE: Running task 1685 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 1686 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1687 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1688 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1689 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1690 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1691 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1692 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1693 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libksba-1.6.0-r0: task do_patch: Started
NOTE: Running task 1694 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.5-r0: task do_unpack: Succeeded
NOTE: Running task 1695 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: Running task 1696 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_patch)
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 1697 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1698 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_configure)
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1699 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_patch)
NOTE: recipe librepo-1.14.3-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Succeeded
NOTE: Running task 1700 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: Running task 1701 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_patch)
NOTE: Running task 1702 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_patch)
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1703 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_patch)
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 1704 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure)
NOTE: Running task 1705 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1706 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1707 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.5-r0: task do_patch: Started
NOTE: Running task 1708 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1709 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1710 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1711 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_patch: Started
NOTE: recipe libdnf-0.67.0-r0: task do_unpack: Succeeded
NOTE: Running task 1712 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1713 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1714 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Started
NOTE: Running task 1715 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: Running task 1716 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_patch)
NOTE: Running task 1717 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_patch)
NOTE: Running task 1718 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure: Started
NOTE: Running task 1719 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1720 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1721 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: Running task 1722 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1723 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1724 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe dnf-4.13.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1725 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1726 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_generate_toolchain_file)
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running task 1727 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: Running task 1728 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: Running task 1729 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1730 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1731 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_generate_toolchain_file)
NOTE: recipe librepo-1.14.3-r0: task do_patch: Succeeded
NOTE: Running task 1732 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_deploy_source_date_epoch)
NOTE: Running task 1733 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1734 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_generate_toolchain_file)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1735 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: Running task 1736 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: recipe librepo-1.14.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Started
NOTE: recipe librepo-1.14.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: Running task 1737 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_compile)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1738 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1739 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Started
NOTE: Running task 1740 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4ab42ede2677cce4212c466b3ef30574fd6175351b72ab958f0221ab510b8ca7
NOTE: Running task 1741 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_deploy_source_date_epoch)
NOTE: recipe librepo-1.14.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1742 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.67.0-r0: task do_patch: Succeeded
NOTE: Running task 1743 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1744 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_generate_toolchain_file)
NOTE: recipe xorgproto-2022.1-r0: task do_install: Started
NOTE: recipe dnf-4.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1745 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1746 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_generate_toolchain_file)
NOTE: Running task 1747 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_populate_lic)
NOTE: recipe gnupg-2.3.6-r0: task do_unpack: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Succeeded
NOTE: Running task 1748 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1749 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.67.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1750 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_configure)
NOTE: recipe dnf-4.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.13.0-r0: task do_populate_lic: Started
NOTE: recipe libdnf-0.67.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.3.6-r0: task do_patch: Started
NOTE: recipe dnf-4.13.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: Running task 1751 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure: Started
NOTE: recipe libdnf-0.67.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1752 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_populate_lic unihash changed to 5837ed29e35062b1ecc48497f69a183a04d7d45bf48debd335f341077f480b05
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1753 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe dnf-4.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gnupg-2.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1754 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1755 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1756 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 79d1bd3af41b691337b63d14f116451371696bde00710abdb7b8f2249dbf033a
NOTE: recipe gnupg-2.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1757 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot)
NOTE: Running task 1758 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1759 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_package: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot unihash changed to f2bd41ed503e4d301a6e9e9d82c7cbb319e8295714b4775f0a1dd6cfd5285cf6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Running setscene task 583 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1761 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1762 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 1763 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1774 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot unihash changed to cc5616849de38b7377c27556a9f424fe58062fa4a5bff72d82ff45323fcac007
NOTE: recipe xorgproto-2022.1-r0: task do_package: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package unihash changed to ba5bef80cd62ca7893462e035bb99c61426649610d83cc57227f9912012cb15d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_setscene)
NOTE: Running setscene task 586 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package_setscene)
NOTE: Running setscene task 588 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_setscene)
NOTE: Running setscene task 590 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running task 1775 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1776 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1777 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1778 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1784 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running setscene task 597 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running task 1795 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1796 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 1797 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1798 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1799 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1800 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1801 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure_ptest_base)
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1807 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1808 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot unihash changed to e753f5209bf0fbdd7fb681188718ec7723ed91219ebde3d85cd73d65039ff99f
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1809 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1823 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1824 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1825 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1826 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: Running task 1827 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_configure)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package unihash changed to 2d89539ace6dadab7dde3adbe482d4d3696910c1c193e173b1a2d5cba415143f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata became valid
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1828 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: Running task 1829 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 1830 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1832 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package unihash changed to 0c2d598c06582a8451743d8f9bc4c16190260fe36748a644d14615208a034f58
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata became valid
NOTE: Running setscene task 598 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1834 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_compile)
NOTE: Running task 1835 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1836 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: Running task 1837 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: Running task 1838 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1839 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: Running task 1840 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1841 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1842 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1843 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 1844 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1845 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: Running task 1846 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Running task 1847 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1848 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1849 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1850 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: Running task 1851 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: Running task 1853 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 1854 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot unihash changed to b423da22a5ac057d28205b2c59be86aee979ef9451171abbeaf4d4a845653d24
NOTE: Setscene tasks completed
NOTE: Running task 1855 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_250.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 1856 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: Running task 1857 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 1858 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: Running task 1859 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: Running task 1860 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1861 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 1862 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe systemd-1_250.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1863 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_configure)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.5-r0: task do_configure: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 1864 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package unihash changed to b61ab2d80467c1bd2736037a3ef250a5ee495d47490b6b61aafaf32667fc4115
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata became valid
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1865 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 1866 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: Running task 1867 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.41-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 1869 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: Running task 1870 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1871 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile_ptest_base)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1872 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1873 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.41-r0: task do_compile: Succeeded
NOTE: Running task 1874 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_install)
NOTE: recipe file-5.41-r0: task do_install: Started
NOTE: recipe file-5.41-r0: task do_install: Succeeded
NOTE: Running task 1875 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: Running task 1876 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_package)
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Succeeded
NOTE: Running task 1877 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure_ptest_base)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.41-r0: task do_package: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 1878 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile)
NOTE: Running task 1879 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1880 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe file-5.41-r0: task do_package: Succeeded
NOTE: Running task 1881 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 1882 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 1883 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe file-5.41-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe file-5.41-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1884 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1885 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_configure)
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Succeeded
NOTE: Running task 1886 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 1887 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure: Succeeded
NOTE: Running task 1888 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_configure_ptest_base)
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Succeeded
NOTE: Running task 1889 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1890 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.18-r0: task do_install: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package)
NOTE: Running task 1892 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile_ptest_base)
NOTE: Running task 1893 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_populate_sysroot)
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1894 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install)
NOTE: recipe libgpg-error-1.45-r0: task do_install: Started
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_package: Succeeded
NOTE: Running task 1895 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_packagedata)
NOTE: recipe libgpg-error-1.45-r0: task do_install: Succeeded
NOTE: Running task 1896 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install_ptest_base)
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1897 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_populate_sysroot)
NOTE: Running task 1898 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_package)
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 1899 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.45-r0: task do_package: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1900 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1901 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1902 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1903 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1904 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_configure)
NOTE: Running task 1905 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_package: Succeeded
NOTE: Running task 1906 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1907 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1908 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1909 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe systemd-1_250.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1910 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1911 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 1912 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe systemd-1_250.5-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile: Succeeded
NOTE: Running task 1913 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1914 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_install)
NOTE: Running task 1916 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe nettle-3.7.3-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 1917 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 1918 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe nettle-3.7.3-r0: task do_install: Succeeded
NOTE: Running task 1919 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_install_ptest_base)
NOTE: recipe nettle-3.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1920 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot)
NOTE: Running task 1921 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot: Started
NOTE: Running task 1922 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.7.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install_ptest_base: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1923 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1924 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_populate_sysroot)
NOTE: Running task 1925 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package: Started
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1926 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1927 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1928 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 1929 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1930 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_compile)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 1931 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 1932 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 1933 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: Running task 1934 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1935 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1936 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1937 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_install)
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1938 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_configure)
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1939 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: Running task 1940 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_configure)
NOTE: recipe libksba-1.6.0-r0: task do_install: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: Running task 1941 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_package)
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Started
NOTE: Running task 1942 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_package: Started
NOTE: recipe nettle-3.7.3-r0: task do_package: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1943 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata)
NOTE: recipe nettle-3.7.3-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 1944 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-1_250.5-r0: task do_compile: Succeeded
NOTE: Running task 1945 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_install)
NOTE: recipe libksba-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 1946 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1947 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Started
NOTE: recipe systemd-1_250.5-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1948 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-1_250.5-r0: task do_install: Succeeded
NOTE: Running task 1949 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_populate_sysroot)
NOTE: Running task 1950 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_package)
NOTE: recipe systemd-1_250.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_250.5-r0: task do_package: Started
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1951 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_compile)
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Started
NOTE: recipe systemd-1_250.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_populate_sysroot unihash changed to 81fa89263894b0131dd212c1983cec93a8f32b71ff9f0059f4d3d638fedb3875
NOTE: Setscene tasks completed
NOTE: Running task 1952 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1953 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_install)
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1954 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure)
NOTE: recipe pinentry-1.2.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure: Started
NOTE: recipe pinentry-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1955 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package: Succeeded
NOTE: Running task 1956 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1957 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_packagedata)
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata: Failed
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Succeeded
NOTE: recipe systemd-1_250.5-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1957 tasks of which 1604 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 109 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glib-2.0/1_2.72.1-r0/temp/log.do_packagedata.3403412
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata) failed with exit code '1'

--===============1320329503267228724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1644 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (882 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a2c867ac5361fb0fdd489e0439f0bfae8b49d5e8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a2c867ac5361fb0fdd489e0439f0bfae8b49d5e8"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 186 Local 3 Mirrors 0 Missed 183 Current 413 (1% match, 69% complete)
Removing 23 stale sstate objects for arch core2-64...done.
Removing 15 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 878 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_fetch)
NOTE: Running task 1020 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_fetch)
NOTE: Running task 1024 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1025 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_fetch)
NOTE: Running task 1059 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 1084 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_write_config)
NOTE: Running task 1085 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 1093 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1109 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1122 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Started
NOTE: Running task 1176 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1180 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_fetch)
NOTE: Running task 1194 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1198 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1199 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: Running task 1201 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1202 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_unpack)
NOTE: Running task 1267 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: Running task 1272 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1274 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_write_config: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe curl-7.83.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: Running task 1275 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_unpack)
NOTE: Running task 1276 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1277 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: Running task 1278 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1279 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: Running task 1280 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 1281 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1282 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_unpack)
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_write_config: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1302 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1303 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Started
NOTE: Running task 1319 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_unpack)
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: Running task 1321 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: Running task 1323 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1324 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1336 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1337 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 1338 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1356 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_configure)
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Succeeded
NOTE: Running task 1357 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_patch)
NOTE: Running task 1358 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.83.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 1388 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.5-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1390 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1391 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1409 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: Running task 1433 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1434 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_fetch)
NOTE: Running task 1435 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1436 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_fetch)
NOTE: Running task 1439 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1446 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 1447 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_fetch)
NOTE: Running task 1448 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: Running task 1468 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 1469 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 1470 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 1471 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1481 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_fetch)
NOTE: Running task 1482 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_fetch)
NOTE: Running task 1485 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1504 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: Running task 1508 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_fetch)
NOTE: Running task 1509 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1510 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_fetch)
NOTE: Running task 1511 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1525 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_fetch)
NOTE: Running task 1530 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch)
NOTE: Running task 1531 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 1549 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1635 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: Running task 1636 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: Running task 1644 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe librepo-1.14.3-r0: task do_fetch: Started
NOTE: Running task 1645 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: Running task 1646 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Started
NOTE: Running task 1647 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1648 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: Running task 1649 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1650 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_fetch: Started
NOTE: Running task 1651 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1652 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: Running task 1653 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: Running task 1654 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1655 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_unpack)
NOTE: Running task 1656 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe dnf-4.13.0-r0: task do_fetch: Started
NOTE: recipe gnupg-2.3.6-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 1657 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 1658 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_unpack)
NOTE: Running task 1659 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1660 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: Running task 1661 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_patch: Started
NOTE: Running task 1662 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_unpack)
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_fetch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: Running task 1663 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1664 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_unpack)
NOTE: Running task 1665 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 1666 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1667 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: recipe libdnf-0.67.0-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 1668 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_unpack)
NOTE: Running task 1669 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_unpack)
NOTE: Running task 1670 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Succeeded
NOTE: Running task 1671 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_unpack)
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 1672 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1673 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_unpack)
NOTE: recipe curl-7.83.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1674 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1675 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Started
NOTE: Running task 1676 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe librepo-1.14.3-r0: task do_unpack: Started
NOTE: Running task 1677 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1678 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Started
NOTE: Running task 1679 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: Running task 1680 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: Running task 1681 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: Running task 1682 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Started
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_unpack: Started
NOTE: Running task 1683 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe dnf-4.13.0-r0: task do_unpack: Started
NOTE: Running task 1684 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libdnf-0.67.0-r0: task do_unpack: Started
NOTE: Running task 1685 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: Running task 1686 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: Running task 1687 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_patch)
NOTE: Running task 1688 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1689 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe curl-7.83.1-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: Running task 1690 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1691 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: Running task 1692 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1693 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: Running task 1694 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 1695 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_patch)
NOTE: Running task 1696 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1697 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: Running task 1698 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1699 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_patch: Started
NOTE: Running task 1700 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure)
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1701 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: Running task 1702 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 1703 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1704 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1705 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.5-r0: task do_unpack: Succeeded
NOTE: Running task 1706 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1707 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_patch)
NOTE: recipe librepo-1.14.3-r0: task do_unpack: Succeeded
NOTE: Running task 1708 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_patch)
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Succeeded
NOTE: Running task 1709 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1710 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_patch)
NOTE: recipe libksba-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1711 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_patch)
NOTE: Running task 1712 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure)
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1713 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1714 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_patch: Started
NOTE: Running task 1715 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gnutls-3.7.5-r0: task do_patch: Started
NOTE: Running task 1716 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1717 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1718 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1719 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_patch)
NOTE: Running task 1720 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1721 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1722 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_patch)
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1723 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_patch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Started
NOTE: Running task 1724 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe nettle-3.7.3-r0: task do_configure: Started
NOTE: Running task 1725 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Started
NOTE: Running task 1726 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1727 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1728 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1729 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1730 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1731 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 1732 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: recipe libdnf-0.67.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1733 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: Running task 1734 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.5-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe librepo-1.14.3-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_patch: Started
NOTE: Running task 1735 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 1736 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1737 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_generate_toolchain_file)
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1738 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_generate_toolchain_file)
NOTE: Running task 1739 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_deploy_source_date_epoch)
NOTE: Running task 1740 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: recipe librepo-1.14.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: Running task 1741 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1742 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_generate_toolchain_file)
NOTE: recipe librepo-1.14.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1743 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1744 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1745 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Succeeded
NOTE: Running task 1746 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1747 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b0c61aea22dce8f624b85304ab204c1e9684ae296da75745f49b90a50579929e
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: Running task 1748 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe librepo-1.14.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_patch: Succeeded
NOTE: Running task 1749 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1751 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_generate_toolchain_file)
NOTE: Running task 1752 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_install)
NOTE: recipe dnf-4.13.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe libdnf-0.67.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1753 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1754 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_generate_toolchain_file)
NOTE: Running task 1755 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_populate_lic)
NOTE: recipe libdnf-0.67.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1756 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_configure)
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1757 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.13.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe xorgproto-2022.1-r0: task do_install: Started
NOTE: recipe dnf-4.13.0-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure: Started
NOTE: recipe dnf-4.13.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1758 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1759 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe dnf-4.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_populate_lic unihash changed to 5837ed29e35062b1ecc48497f69a183a04d7d45bf48debd335f341077f480b05
NOTE: Running task 1760 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_patch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1761 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gnupg-2.3.6-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1762 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 56fac8ee0c7d26483246c4fcb01cc0878f40f2b7f8798514e2447802eab20187
NOTE: recipe gnupg-2.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1763 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1764 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe xorgproto-2022.1-r0: task do_install: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1765 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot)
NOTE: Running task 1766 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: Running task 1767 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Started
NOTE: recipe gnupg-2.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.1-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1768 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot unihash changed to 659c224d7d11c0396bad66f2a25a08999a111269c04ef0b048bfd30885b30b91
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot became valid
NOTE: Running setscene task 581 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1769 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1770 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1771 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1787 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1788 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe xorgproto-2022.1-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package unihash changed to 7a33c97e41ec29933cb9dae04a8661cd54765a345b041550f7f6dbfb99644d87
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Running setscene task 585 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_setscene)
NOTE: Running setscene task 587 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package_setscene)
NOTE: Running setscene task 589 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 590 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_setscene)
NOTE: Running task 1789 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot unihash changed to 7d08109cf2f300eb8548d9f046520a905b674595378802415ccff2f000750c29
NOTE: Running task 1790 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_setscene: Started
NOTE: Running task 1791 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1792 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1793 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1794 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: recipe nettle-3.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1795 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: Running task 1796 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1797 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 1798 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1799 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 594 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot unihash changed to f0ab4a6ee5d8305f8bd9099505be711935f422249c4410ba8fd48eb742a68f22
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1800 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1801 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running task 1812 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1818 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1819 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 1834 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package unihash changed to b485e2b5520d056c61274ec9dbd8e26935ba5c4c4ba1dd34338a8c6df0606e8b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata became valid
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1835 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: Running task 1836 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Started
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1838 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 1839 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1840 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package unihash changed to ab21e839aa7c2bf62620b6a555ff735bd25ec0d0fdade7cc08aa5345f52d738c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata became valid
NOTE: Running setscene task 598 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: Running task 1842 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1843 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1845 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: Running task 1846 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: Running task 1847 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: Running task 1848 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1849 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1850 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 1851 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Started
NOTE: Running task 1852 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1853 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Running task 1854 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1855 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1856 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package)
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1857 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 1858 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot unihash changed to 5ca2c4219d857517eff8c3029ae50cfab1ac5ee49942f8aab7c0663f6d7a2b00
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1859 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1860 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 1861 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe systemd-1_250.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: Running task 1862 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: Running task 1863 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 1864 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: Running task 1865 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1866 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 1867 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 1868 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-1_250.5-r0: task do_configure: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 1870 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package unihash changed to 621fb4f3731e16034dc17653f9ab7d227dae3dc936d518f8e6ff82f9fcb49901
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata became valid
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1871 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 1872 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: Running task 1873 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: Running task 1875 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: recipe file-5.41-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1876 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: Running task 1877 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1878 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1880 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile)
NOTE: recipe file-5.41-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_install)
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Started
NOTE: recipe file-5.41-r0: task do_install: Started
NOTE: recipe file-5.41-r0: task do_install: Succeeded
NOTE: Running task 1882 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: Running task 1883 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_package)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.41-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1884 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 1885 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 1886 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 1887 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1888 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_package: Succeeded
NOTE: Running task 1889 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata)
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1890 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_packagedata: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Succeeded
NOTE: Running task 1891 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 1892 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Succeeded
NOTE: Running task 1893 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_install)
NOTE: recipe libcomps-0.1.18-r0: task do_install: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Succeeded
NOTE: Running task 1894 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile_ptest_base)
NOTE: recipe libcomps-0.1.18-r0: task do_install: Succeeded
NOTE: Running task 1895 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package)
NOTE: Running task 1896 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_populate_sysroot)
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1897 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install)
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package: Started
NOTE: recipe libgpg-error-1.45-r0: task do_install: Started
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure: Succeeded
NOTE: Running task 1898 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1899 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1900 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_compile)
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1901 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_populate_sysroot)
NOTE: Running task 1902 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_package)
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.45-r0: task do_package: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package: Succeeded
NOTE: Running task 1903 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_packagedata)
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 1904 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1905 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1906 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1907 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1908 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1909 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_configure)
NOTE: Running task 1910 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_package: Succeeded
NOTE: Running task 1911 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1912 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1913 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_install)
NOTE: recipe nettle-3.7.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1915 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_install)
NOTE: recipe nettle-3.7.3-r0: task do_install: Succeeded
NOTE: Running task 1916 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install: Started
NOTE: recipe nettle-3.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1917 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot)
NOTE: Running task 1918 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package)
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.7.3-r0: task do_package: Started
NOTE: recipe systemd-1_250.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1919 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_compile)
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.5-r0: task do_compile: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1920 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_compile)
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1921 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install: Succeeded
NOTE: Running task 1922 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1923 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_populate_sysroot)
NOTE: Running task 1924 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package: Started
NOTE: Running task 1925 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 1926 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1927 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 1928 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1929 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_install)
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe libksba-1.6.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1930 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1931 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe libksba-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 1932 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_package)
NOTE: Running task 1933 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_package: Started
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1934 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 1935 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 1936 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: Running task 1937 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1938 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1939 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 1940 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_packagedata)
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1941 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_configure)
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1942 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_configure)
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 1943 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe nettle-3.7.3-r0: task do_package: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: Running task 1944 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata)
NOTE: recipe nettle-3.7.3-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1945 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1946 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1947 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe systemd-1_250.5-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_install)
NOTE: recipe systemd-1_250.5-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1949 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_compile)
NOTE: recipe systemd-1_250.5-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_populate_sysroot)
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Started
NOTE: Running task 1951 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_package)
NOTE: recipe systemd-1_250.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_250.5-r0: task do_package: Started
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1952 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_install)
NOTE: recipe pinentry-1.2.0-r0: task do_install: Started
NOTE: recipe systemd-1_250.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_populate_sysroot unihash changed to a7f3416e828a3b721d1cd68ac2cfabbc0d0686c82454d3ed132c917973cd2798
NOTE: Setscene tasks completed
NOTE: Running task 1953 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1954 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_package: Started
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1955 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure)
NOTE: recipe dbus-1.14.0-r0: task do_configure: Started
NOTE: recipe pinentry-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1956 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_packagedata)
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package: Succeeded
NOTE: Running task 1957 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1959 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata: Failed
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Succeeded
NOTE: recipe systemd-1_250.5-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1959 tasks of which 1618 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 109 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.72.1-r0/temp/log.do_packagedata.2917174
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata) failed with exit code '1'

--===============1320329503267228724==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.12.0-4.13.0.patch"

From 32f37f47528564f18dee7d88524a5b84e2d74f40 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 07:28:07 +0000
Subject: [PATCH] dnf: upgrade 4.12.0 -> 4.13.0

---
 meta/recipes-devtools/dnf/{dnf_4.12.0.bb => dnf_4.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.12.0.bb => dnf_4.13.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.12.0.bb b/meta/recipes-devtools/dnf/dnf_4.13.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.12.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.13.0.bb
index d621e72d4e..bf89ceb275 100644
--- a/meta/recipes-devtools/dnf/dnf_4.12.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.13.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "956b5c74bab2affde27f404e7aee98c10818b188"
+SRCREV = "ef09e48fc3ebbbaf4dfa478e6e0532706506f091"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.31.1


--===============1320329503267228724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1643 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 113 recipes from the core2-32 sysroot...done.
Removing 126 recipes from the qemux86 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a2c867ac5361fb0fdd489e0439f0bfae8b49d5e8"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a2c867ac5361fb0fdd489e0439f0bfae8b49d5e8"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 327 Local 163 Mirrors 0 Missed 164 Current 164 (49% match, 66% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 194 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 207 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 226 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: Running task 581 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_fetch)
NOTE: Running task 638 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 640 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_fetch)
NOTE: Running task 641 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_fetch)
NOTE: Running task 642 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 658 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 659 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 660 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 668 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 669 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_write_config)
NOTE: Running task 672 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_fetch)
NOTE: Running task 673 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_fetch)
NOTE: Running task 674 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 675 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 682 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_fetch)
NOTE: Running task 683 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 684 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 685 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 686 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running task 688 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: Running task 689 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: Running task 694 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 695 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_fetch)
NOTE: Running task 696 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 699 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_fetch)
NOTE: Running task 702 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 703 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 704 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_fetch)
NOTE: Running task 705 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: Running task 724 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 725 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 726 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 727 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_fetch)
NOTE: Running task 728 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_fetch)
NOTE: Running task 730 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 731 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: Running task 732 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_fetch)
NOTE: Running task 733 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 734 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_fetch)
NOTE: Running task 735 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 738 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_fetch)
NOTE: Running task 740 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_fetch)
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.83.1-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_fetch: Started
NOTE: Running task 778 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_unpack)
NOTE: Running task 779 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 780 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_write_config: Started
NOTE: recipe gnutls-3.7.5-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 781 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_unpack)
NOTE: Running task 782 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 783 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_fetch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Started
NOTE: Running task 784 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_unpack)
NOTE: recipe librepo-1.14.3-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 785 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_unpack)
NOTE: Running task 786 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: recipe libdnf-0.67.0-r0: task do_fetch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: Running task 787 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: Running task 788 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: Running task 789 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_unpack)
NOTE: Running task 790 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 791 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: Running task 792 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 793 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: Running task 794 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: Running task 795 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_unpack)
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: recipe gnupg-2.3.6-r0: task do_fetch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Started
NOTE: Running task 796 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_write_config: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 797 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: recipe librepo-1.14.3-r0: task do_fetch: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_fetch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 798 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 799 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: Running task 800 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 801 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 802 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_unpack)
NOTE: Running task 803 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: Running task 804 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 805 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_unpack)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: Running task 806 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_unpack)
NOTE: recipe libdnf-0.67.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 807 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Started
NOTE: Running task 808 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_unpack)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: Running task 809 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 810 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_unpack)
NOTE: Running task 811 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_unpack)
NOTE: Running task 812 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_unpack)
NOTE: recipe dnf-4.13.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_unpack: Started
NOTE: Running task 822 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: Running setscene task 348 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.7.5-r0: task do_unpack: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running setscene task 349 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: Running task 827 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe librepo-1.14.3-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 828 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: Running task 829 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 830 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Started
NOTE: Running task 831 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 832 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: recipe libdnf-0.67.0-r0: task do_unpack: Started
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Started
NOTE: Running task 833 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch)
NOTE: recipe dnf-4.13.0-r0: task do_unpack: Started
NOTE: Running task 834 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 835 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: Running task 836 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: Running task 837 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: Running task 838 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: Running task 839 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: Running task 840 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe nettle-3.7.3-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: Running task 841 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_patch)
NOTE: Running task 842 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running task 844 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 848 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: Running task 853 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 854 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 858 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 860 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 861 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: Running task 862 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_patch)
NOTE: Running task 863 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 864 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: Running task 865 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 866 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: Running task 867 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: Running task 868 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 869 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.14.3-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 870 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 871 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 872 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.83.1-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 873 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_patch)
NOTE: Running task 874 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: Running task 875 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: Running task 880 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_patch)
NOTE: Running task 881 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 882 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.83.1-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: Running setscene task 365 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_populate_sysroot_setscene)
NOTE: Running task 883 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_deploy_source_date_epoch)
NOTE: recipe librepo-1.14.3-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe libdnf-0.67.0-r0: task do_unpack: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Succeeded
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Started
NOTE: Running task 888 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 889 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_patch)
NOTE: Running task 890 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_patch)
NOTE: Running task 891 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Started
NOTE: recipe dnf-4.13.0-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 892 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 893 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_patch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 894 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 895 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_patch)
NOTE: Running task 896 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 897 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 902 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: Running task 903 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_patch: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Started
NOTE: Running setscene task 378 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 389 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: recipe dnf-4.13.0-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running setscene task 390 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 908 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 909 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.5-r0: task do_unpack: Succeeded
NOTE: Running task 910 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_patch: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 911 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 912 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 913 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 922 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 402 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 923 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_generate_toolchain_file)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 404 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 928 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 929 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_generate_toolchain_file)
NOTE: Running task 930 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 411 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_fetch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Started
NOTE: Running task 955 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_patch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 968 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 969 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_generate_toolchain_file)
NOTE: recipe musl-obstack-1.1-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 974 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: Running task 975 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 976 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 977 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe argp-standalone-1.3-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: Running task 982 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_patch)
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 983 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_patch: Succeeded
NOTE: Running task 988 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_patch: Started
NOTE: Running task 989 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: Running task 994 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.67.0-r0: task do_patch: Succeeded
NOTE: Running task 995 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 996 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_generate_toolchain_file)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.13.0-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 997 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 998 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_generate_toolchain_file)
NOTE: Running task 999 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_populate_lic)
NOTE: recipe libdnf-0.67.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.67.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe gnutls-3.7.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_populate_lic: Started
NOTE: recipe dnf-4.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.13.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe argp-standalone-1.3-r0: task do_patch: Succeeded
NOTE: Running task 1000 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 436 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 1005 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dnf-4.13.0-r0: task do_populate_lic: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gnupg-2.3.6-r0: task do_unpack: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1007 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_populate_lic unihash changed to 5837ed29e35062b1ecc48497f69a183a04d7d45bf48debd335f341077f480b05
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dnf-4.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.3.6-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: Running task 1008 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1009 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1018 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 478 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 488 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 491 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1201 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1286 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1289 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1290 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1296 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1297 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1298 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1317 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1328 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1329 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1354 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1355 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1371 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1373 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1378 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1379 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1380 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1393 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1434 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 1435 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1436 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure)
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1437 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1438 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1439 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1440 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: Running task 1441 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 1442 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_configure)
NOTE: recipe musl-obstack-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1443 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: Running task 1444 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1445 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: Running task 1447 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1448 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe nettle-3.7.3-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: Running task 1449 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: Running task 1450 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: Running task 1451 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_configure)
NOTE: recipe argp-standalone-1.3-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: Running task 1453 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: Running task 1454 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1455 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1456 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1457 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 1458 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1459 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1460 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1461 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: Running task 1462 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1463 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile)
NOTE: Running task 1464 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_configure: Succeeded
NOTE: Running task 1465 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_compile)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1466 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 1467 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe argp-standalone-1.3-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1468 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1469 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.3-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_install)
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_install: Started
NOTE: Running task 1471 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 1472 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1473 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: recipe argp-standalone-1.3-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 1474 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot)
NOTE: Running task 1475 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package)
NOTE: Running task 1476 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1477 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1478 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 1479 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe musl-obstack-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1480 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe musl-obstack-1.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1481 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe musl-obstack-1.1-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: Running task 1483 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe argp-standalone-1.3-r0: task do_package: Succeeded
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe musl-obstack-1.1-r0: task do_install: Succeeded
NOTE: Running task 1484 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata)
NOTE: Running task 1485 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: Running task 1486 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1487 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: Running task 1488 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1489 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: Running task 1490 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1491 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1492 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1493 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1494 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 1495 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Running task 1496 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: Running task 1497 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1498 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe musl-obstack-1.1-r0: task do_package: Succeeded
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: Running task 1499 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1500 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1502 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: Running task 1503 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: Running task 1504 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: Running task 1505 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: Running task 1506 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1507 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata)
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: Running task 1508 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.41-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1509 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: Running task 1510 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 1511 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1512 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 1513 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: Running task 1514 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1515 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1516 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: Running task 1518 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1519 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: Running task 1520 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Succeeded
NOTE: Running task 1521 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure_ptest_base)
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.41-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Started
NOTE: Running task 1522 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1523 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1524 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe file-5.41-r0: task do_install: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.41-r0: task do_install: Succeeded
NOTE: Running task 1525 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: Running task 1526 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_package)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.41-r0: task do_package: Started
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1527 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile_ptest_base)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 1530 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 1531 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe nettle-3.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1532 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 1533 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.41-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata)
NOTE: recipe file-5.41-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1535 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.41-r0: task do_packagedata: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Succeeded
NOTE: Running task 1536 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 1537 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Succeeded
NOTE: Running task 1538 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_install)
NOTE: recipe libcomps-0.1.18-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure: Succeeded
NOTE: Running task 1539 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1540 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_compile)
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Succeeded
NOTE: Running task 1541 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile_ptest_base)
NOTE: recipe libcomps-0.1.18-r0: task do_install: Succeeded
NOTE: Running task 1542 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Started
NOTE: Running task 1543 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_populate_sysroot)
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1544 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install)
NOTE: recipe libcomps-0.1.18-r0: task do_package: Started
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.45-r0: task do_install: Started
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_install: Succeeded
NOTE: Running task 1545 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1546 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_populate_sysroot)
NOTE: Running task 1547 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_package)
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.45-r0: task do_package: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1548 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_packagedata)
NOTE: Running task 1549 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_install)
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_install: Started
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 1550 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1551 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1552 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1553 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1554 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1555 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_configure)
NOTE: Running task 1556 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_package: Succeeded
NOTE: Running task 1557 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1558 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile: Succeeded
NOTE: Running task 1559 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1560 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1561 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_install)
NOTE: recipe nettle-3.7.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1562 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_install: Succeeded
NOTE: Running task 1563 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_install_ptest_base)
NOTE: recipe nettle-3.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1564 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_compile)
NOTE: recipe nettle-3.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1565 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot)
NOTE: Running task 1566 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 1567 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe nettle-3.7.3-r0: task do_package: Started
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1568 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 1569 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1570 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install: Succeeded
NOTE: Running task 1571 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_install_ptest_base)
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: Running task 1572 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install_ptest_base: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1573 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_populate_sysroot)
NOTE: Running task 1574 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_package)
NOTE: recipe zstd-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1575 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1576 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 1577 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: Running task 1578 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1579 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1580 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_compile: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1581 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_install)
NOTE: Running task 1582 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1583 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_install: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1584 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_configure)
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Started
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1585 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_configure)
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_install: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1586 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_package)
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1587 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: Running task 1588 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_configure)
NOTE: Running task 1589 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1590 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1591 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: Running task 1592 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1593 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_packagedata)
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Started
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 1595 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package: Succeeded
NOTE: Running task 1596 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata)
NOTE: recipe nettle-3.7.3-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1597 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1598 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_compile)
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Started
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1599 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_install)
NOTE: recipe pinentry-1.2.0-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1600 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_package: Started
NOTE: recipe pinentry-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_packagedata)
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 1602 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1603 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 1604 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1605 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 1606 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Succeeded
NOTE: Running task 1607 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_compile)
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata: Failed
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1608 tasks of which 1249 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 109 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glib-2.0/1_2.72.1-r0/temp/log.do_packagedata.3927893
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata) failed with exit code '1'

--===============1320329503267228724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-a2c867ac5361fb0fdd489e0439f0bfae8b49d5e8"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a2c867ac5361fb0fdd489e0439f0bfae8b49d5e8"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 186 Local 3 Mirrors 0 Missed 183 Current 413 (1% match, 69% complete)
Removing 23 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 15 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 878 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_fetch)
NOTE: Running task 1020 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_fetch)
NOTE: Running task 1024 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1025 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_fetch)
NOTE: Running task 1059 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 1084 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_write_config)
NOTE: Running task 1085 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 1093 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1109 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1122 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Started
NOTE: Running task 1176 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1180 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_fetch)
NOTE: Running task 1194 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1198 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 1199 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1200 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: Running task 1202 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: Running task 1263 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_unpack)
NOTE: Running task 1264 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_fetch: Started
NOTE: Running task 1271 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_write_config: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_fetch: Succeeded
NOTE: Running task 1273 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_unpack)
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.83.1-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: Running task 1274 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1275 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_unpack)
NOTE: Running task 1276 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.83.1-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.5-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: Running task 1277 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1278 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1279 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 1280 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1281 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_write_config: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1307 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: Running task 1308 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_unpack)
NOTE: Running task 1309 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 1310 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 1322 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1323 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: Running task 1325 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1329 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1341 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1360 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_configure)
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Succeeded
NOTE: Running task 1379 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: Running task 1380 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_patch)
NOTE: Running task 1388 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1389 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1391 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.83.1-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.5-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1409 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_fetch)
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1433 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1434 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_fetch)
NOTE: Running task 1435 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1436 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_fetch)
NOTE: Running task 1439 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1446 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1447 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_fetch)
NOTE: Running task 1448 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_fetch)
NOTE: Running task 1468 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1469 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_fetch)
NOTE: Running task 1470 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_fetch)
NOTE: Running task 1480 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_fetch)
NOTE: Running task 1481 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_fetch)
NOTE: Running task 1484 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1500 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch)
NOTE: Running task 1501 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 1505 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_fetch)
NOTE: Running task 1509 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1510 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_fetch)
NOTE: Running task 1511 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_fetch)
NOTE: Running task 1512 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: Running task 1526 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_fetch)
NOTE: Running task 1548 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_fetch)
NOTE: Running task 1581 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 1642 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1643 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1644 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1645 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librepo-1.14.3-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: Running task 1646 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Started
NOTE: Running task 1647 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1648 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1649 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: recipe librepo-1.14.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_patch: Started
NOTE: recipe gpgme-1.17.1-r0: task do_fetch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_fetch: Started
NOTE: recipe json-c-0.16-r0: task do_fetch: Succeeded
NOTE: Running task 1650 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1651 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1652 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_unpack)
NOTE: Running task 1653 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1654 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_unpack)
NOTE: Running task 1655 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_unpack)
NOTE: Running task 1656 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_unpack)
NOTE: Running task 1657 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.83.1-r0: task do_unpack: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_fetch: Succeeded
NOTE: Running task 1658 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Started
NOTE: recipe dnf-4.13.0-r0: task do_fetch: Started
NOTE: Running task 1659 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_unpack)
NOTE: Running task 1660 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Started
NOTE: recipe gnupg-2.3.6-r0: task do_fetch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1661 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_patch)
NOTE: Running task 1662 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_unpack)
NOTE: recipe libmodulemd-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1663 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 1664 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_unpack)
NOTE: Running task 1665 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_unpack)
NOTE: Running task 1666 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1667 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_fetch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: Running task 1668 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_unpack)
NOTE: Running task 1669 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_unpack)
NOTE: Running task 1670 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 1671 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_unpack)
NOTE: recipe libdnf-0.67.0-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: Running task 1672 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Succeeded
NOTE: recipe libmodulemd-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_fetch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: Running task 1673 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1674 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: Running task 1675 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1676 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1677 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 1678 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_unpack: Started
NOTE: Running task 1679 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1680 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: Running task 1681 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_patch)
NOTE: Running task 1682 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Started
NOTE: Running task 1683 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1684 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_patch)
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.83.1-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.5-r0: task do_unpack: Succeeded
NOTE: recipe gnupg-2.3.6-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Started
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: Running task 1685 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Started
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_unpack: Started
NOTE: recipe libdnf-0.67.0-r0: task do_unpack: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.7.3-r0: task do_patch: Succeeded
NOTE: Running task 1686 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_patch)
NOTE: Running task 1687 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: Running task 1688 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: Running task 1689 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.83.1-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: Running task 1690 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Started
NOTE: Running task 1691 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1692 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.16-r0: task do_patch: Started
NOTE: Running task 1693 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Started
NOTE: recipe libksba-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Started
NOTE: Running task 1694 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_patch)
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1695 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_patch: Started
NOTE: recipe pinentry-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.5-r0: task do_unpack: Succeeded
NOTE: Running task 1696 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: Running task 1697 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1698 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1699 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1700 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniparse-0.5-r0: task do_patch: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1701 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1702 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1703 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Started
NOTE: recipe libksba-1.6.0-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1704 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1705 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: Running task 1706 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_configure)
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Started
NOTE: recipe libassuan-2.5.5-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_patch: Started
NOTE: Running task 1707 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 1708 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_patch)
NOTE: Running task 1709 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gpgme-1.17.1-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: Running task 1710 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_patch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1711 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.83.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1712 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure)
NOTE: Running task 1713 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1714 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_patch)
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1715 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1716 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1717 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1718 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1719 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_configure)
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Started
NOTE: recipe librepo-1.14.3-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1720 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1721 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.13.0-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1722 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 1723 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_patch)
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_unpack: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Started
NOTE: Running task 1724 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: Running task 1725 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_patch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.5-r0: task do_patch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Started
NOTE: Running task 1726 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1727 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1728 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1729 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1730 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_patch: Started
NOTE: Running task 1731 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: recipe json-c-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1732 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: Running task 1733 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.7.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1734 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_configure)
NOTE: recipe libmodulemd-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1735 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe librepo-1.14.3-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running task 1736 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1737 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.14.3.bb:do_generate_toolchain_file)
NOTE: recipe libassuan-2.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_patch: Succeeded
NOTE: Running task 1738 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1739 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_generate_toolchain_file)
NOTE: recipe libsolv-0.7.22-r0: task do_patch: Succeeded
NOTE: Running task 1740 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_generate_toolchain_file)
NOTE: Running task 1741 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.22.bb:do_deploy_source_date_epoch)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-c-0.16-r0: task do_configure: Started
NOTE: Running task 1742 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libksba-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librepo-1.14.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Started
NOTE: recipe gnutls-3.7.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1743 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Succeeded
NOTE: Running task 1744 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1745 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_compile)
NOTE: recipe pinentry-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.22-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1746 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3000313df6bda1abdc7383cb1934a1e02bdc4614c2c371572e118046c755cd76
NOTE: Running task 1747 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1748 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.14.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: Running task 1749 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_install)
NOTE: recipe libdnf-0.67.0-r0: task do_patch: Succeeded
NOTE: Running task 1750 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_compile)
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Started
NOTE: Running task 1751 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1752 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb:do_generate_toolchain_file)
NOTE: recipe dnf-4.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1753 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1754 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_generate_toolchain_file)
NOTE: Running task 1755 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_populate_lic)
NOTE: recipe gpgme-1.17.1-r0: task do_patch: Succeeded
NOTE: Running task 1756 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Started
NOTE: recipe libdnf-0.67.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.67.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.3.6-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_install: Started
NOTE: Running task 1757 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_patch)
NOTE: Running task 1758 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_configure)
NOTE: recipe libdnf-0.67.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_populate_lic: Started
NOTE: recipe dnf-4.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1759 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.13.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.13.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure: Started
NOTE: recipe gnupg-2.3.6-r0: task do_patch: Started
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.67.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.13.0-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.13.0.bb:do_populate_lic unihash changed to 5837ed29e35062b1ecc48497f69a183a04d7d45bf48debd335f341077f480b05
NOTE: recipe gpgme-1.17.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1760 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe dnf-4.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1761 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe gnupg-2.3.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 1762 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1763 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnupg-2.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e8d93026dbeccfd3e4330a21e6653ae4d7cd62eb97959ec91da1f8f8ed8d1b0d
NOTE: recipe gnupg-2.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1764 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1765 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot)
NOTE: Running task 1766 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe xorgproto-2022.1-r0: task do_package: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Started
NOTE: Running task 1767 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot unihash changed to c5f2dc23efb073cad05553b213186b97a484065530476ebb5e6887a700c421f6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot became valid
NOTE: Running setscene task 583 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1768 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 1769 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1780 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1781 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe xorgproto-2022.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package unihash changed to e620d777d692073b67a8a7fafe0117e8bef58b47abc887da8a43041676d5b966
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Running setscene task 585 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_setscene)
NOTE: Running setscene task 586 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_setscene)
NOTE: Running setscene task 587 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package_setscene)
NOTE: Running setscene task 591 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot unihash changed to 22f70bdf2b447bd4a9c8ac530b2dda9327cca78e9d0c876d9f5dc2b79d2ebeda
NOTE: recipe libice-1_1.0.10-r0: task do_package_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_setscene: Started
NOTE: Running task 1802 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1803 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 1809 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 1810 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1811 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 1812 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 1814 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 1815 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1819 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package: Started
NOTE: Running task 1820 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1821 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile)
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1822 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1823 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: recipe nettle-3.7.3-r0: task do_compile: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1824 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot unihash changed to 35cb279ba5f169f6479c4fd4dd7392a37206e13345d2a0c16d81133fcde03963
NOTE: Running task 1825 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1826 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_configure)
NOTE: Running task 1827 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Started
NOTE: recipe json-c-0.16-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package unihash changed to 914e34b61738fcf1c27902824b2a7629d3c762fc8fea9be1604979ef9e42ef8b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata became valid
NOTE: recipe python3-six-1.16.0-r0: task do_package: Succeeded
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata_setscene)
NOTE: Running task 1828 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_compile)
NOTE: Running task 1829 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1830 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_configure)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1832 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe json-c-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1833 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_install)
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe json-c-0.16-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe json-c-0.16-r0: task do_install: Succeeded
NOTE: Running task 1838 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_populate_sysroot)
NOTE: Running task 1839 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1840 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.16-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe json-c-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package unihash changed to b492e35be9c2a77c96641e66b5695ebe079ab6adcded3a18d9218e81a4d3adc4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata became valid
NOTE: Running setscene task 598 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1842 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_compile)
NOTE: recipe json-c-0.16-r0: task do_package: Succeeded
NOTE: Running task 1843 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.16.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Started
NOTE: recipe json-c-0.16-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_install)
NOTE: recipe json-c-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_install: Succeeded
NOTE: Running task 1845 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package)
NOTE: Running task 1846 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot)
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1847 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_configure: Succeeded
NOTE: Running task 1848 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Started
NOTE: Running task 1849 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1850 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 1851 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: Running task 1852 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure_ptest_base)
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1853 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package: Succeeded
NOTE: Running task 1854 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Running task 1855 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Succeeded
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: Running task 1856 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1857 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1858 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm)
NOTE: recipe gtk-doc-1.33.2-r0: task do_compile: Succeeded
NOTE: Running task 1859 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_install)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot unihash changed to 1b1ff5d420882fa2adbc7de4f1d68986a3f00682a44f2fd14ec887165a66cd37
NOTE: Setscene tasks completed
NOTE: Running task 1860 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 1861 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe systemd-1_250.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_install: Succeeded
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: Running task 1862 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot)
NOTE: Running task 1863 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_package)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 1864 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile_ptest_base)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1865 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1866 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 1867 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 1868 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: Running task 1869 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-1_250.5-r0: task do_configure: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package unihash changed to 375630b3b8817f98c59e076e537cda3210b89c4d300021f24250f88df2a8d875
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata became valid
NOTE: Running setscene task 599 of 599 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 1870 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install_ptest_base)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe popt-1.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1872 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 1873 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe file-5.41-r0: task do_configure: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_package: Succeeded
NOTE: Running task 1874 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_compile)
NOTE: Running task 1875 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.41-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1876 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile_ptest_base)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1877 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata: Succeeded
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: Running task 1878 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1880 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile)
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Started
NOTE: recipe file-5.41-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_install)
NOTE: recipe file-5.41-r0: task do_install: Started
NOTE: recipe file-5.41-r0: task do_install: Succeeded
NOTE: Running task 1882 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_populate_sysroot)
NOTE: Running task 1883 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_package)
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.41-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 1884 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1885 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.41-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 1886 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 1887 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1888 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.41-r0: task do_package: Succeeded
NOTE: Running task 1889 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_packagedata)
NOTE: recipe libcomps-0.1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1890 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_packagedata: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_configure: Succeeded
NOTE: Running task 1891 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 1892 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe libcomps-0.1.18-r0: task do_compile: Succeeded
NOTE: Running task 1893 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_install)
NOTE: recipe libcomps-0.1.18-r0: task do_install: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Succeeded
NOTE: Running task 1894 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1895 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install)
NOTE: recipe libcomps-0.1.18-r0: task do_install: Succeeded
NOTE: Running task 1896 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package)
NOTE: Running task 1897 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_populate_sysroot)
NOTE: recipe libgpg-error-1.45-r0: task do_install: Started
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package: Started
NOTE: recipe libcomps-0.1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_install: Succeeded
NOTE: Running task 1898 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1899 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_populate_sysroot)
NOTE: Running task 1900 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure: Succeeded
NOTE: Running task 1901 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.45-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1902 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_compile)
NOTE: recipe libcomps-0.1.18-r0: task do_package: Succeeded
NOTE: Running task 1903 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile: Started
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1904 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1905 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1906 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcomps-0.1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 1907 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb:do_package_write_rpm)
NOTE: recipe libksba-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1908 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: Running task 1909 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_configure)
NOTE: Running task 1910 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_configure)
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe libcomps-0.1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_package: Succeeded
NOTE: Running task 1911 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1912 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1913 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_install)
NOTE: recipe nettle-3.7.3-r0: task do_install: Started
NOTE: recipe systemd-1_250.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1914 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_compile)
NOTE: recipe nettle-3.7.3-r0: task do_install: Succeeded
NOTE: Running task 1915 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile: Succeeded
NOTE: Running task 1916 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe systemd-1_250.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libksba-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1917 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1918 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_install)
NOTE: recipe libksba-1.6.0-r0: task do_compile: Started
NOTE: recipe nettle-3.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install: Started
NOTE: Running task 1919 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_populate_sysroot)
NOTE: Running task 1920 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package)
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.7.3-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_configure: Succeeded
NOTE: Running task 1921 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_compile)
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Started
NOTE: recipe nettle-3.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1922 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install: Succeeded
NOTE: Running task 1923 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install_ptest_base: Started
NOTE: recipe libassuan-2.5.5-r0: task do_compile: Succeeded
NOTE: Running task 1924 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1925 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_populate_sysroot)
NOTE: Running task 1926 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_package)
NOTE: recipe libassuan-2.5.5-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package: Started
NOTE: recipe libksba-1.6.0-r0: task do_compile: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 1927 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_install)
NOTE: Running task 1928 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 1929 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe libksba-1.6.0-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe libassuan-2.5.5-r0: task do_install: Succeeded
NOTE: Running task 1930 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_populate_sysroot)
NOTE: Running task 1931 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1932 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Started
NOTE: recipe libksba-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 1933 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1934 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: Running task 1935 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libksba-1.6.0-r0: task do_package: Started
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1936 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1937 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pinentry-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1938 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_configure)
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Started
NOTE: recipe libksba-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1939 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_configure)
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1940 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1941 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe libassuan-2.5.5-r0: task do_package: Succeeded
NOTE: Running task 1942 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.5.bb:do_packagedata)
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 1943 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.6.0.bb:do_packagedata)
NOTE: recipe libassuan-2.5.5-r0: task do_packagedata: Succeeded
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Started
NOTE: recipe libksba-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1944 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: Running task 1945 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1946 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1947 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe systemd-1_250.5-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_install)
NOTE: recipe systemd-1_250.5-r0: task do_install: Started
NOTE: recipe pinentry-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1949 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_compile)
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Started
NOTE: recipe systemd-1_250.5-r0: task do_install: Succeeded
NOTE: Running task 1950 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_populate_sysroot)
NOTE: Running task 1951 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1952 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_install)
NOTE: recipe systemd-1_250.5-r0: task do_populate_sysroot: Started
NOTE: recipe pinentry-1.2.0-r0: task do_install: Started
NOTE: recipe systemd-1_250.5-r0: task do_package: Started
NOTE: recipe pinentry-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1953 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_package)
NOTE: recipe pinentry-1.2.0-r0: task do_package: Started
NOTE: recipe systemd-1_250.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.5.bb:do_populate_sysroot unihash changed to e3519efa2ae19618b248977b69cffd2e1a861c6d8453b8ea03eeb2963faf6d5d
NOTE: Setscene tasks completed
NOTE: Running task 1954 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1955 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure)
NOTE: recipe dbus-1.14.0-r0: task do_configure: Started
NOTE: recipe pinentry-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1956 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.2.0.bb:do_packagedata)
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 1957 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1958 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 1959 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_package: Succeeded
NOTE: Running task 1960 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata)
NOTE: recipe gpgme-1.17.1-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.17.1.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata: Started
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1962 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 1963 of 2079 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata: Failed
NOTE: recipe systemd-1_250.5-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: recipe gpgme-1.17.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1963 tasks of which 1618 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 109 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.72.2-r0 to 1:2.72.1-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glib-2.0/1_2.72.1-r0/temp/log.do_packagedata.3121879
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata) failed with exit code '1'

--===============1320329503267228724==--

