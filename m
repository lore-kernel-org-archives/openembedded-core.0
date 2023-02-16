Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF46C64ED8
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.10158.1676508399496498191
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PIGvU6rw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018657b0042b-155cdd52-98cf-404f-b205-d0239e543b17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RGd3QLZmOGhHGIg6sTlUw9QgimiyfEYU52euzX2/HEo=;
	b=PIGvU6rwISx/L2B3JbnC61cq2qp4yFMtTlLN7xZPKDd/VZZJ1seKMgF5cmj7jSgF
	grPFvikrJFF2pwgBeClBmiUShN2HwDmfar6qPNQuBVMB82jKFhDAUnzIFrzF0Qu6jtT
	7SsGwf9KRZ4uKBx04yDucN0Qt7YUyoahOX73D4rE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508398;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RGd3QLZmOGhHGIg6sTlUw9QgimiyfEYU52euzX2/HEo=;
	b=HPDh29enfaMWZ9qDxXeZT1VO2iYMzP0y/XER10IFB/xUOZfs9Vl33Cu368z8t/bn
	Mjn32etCYSn+flyoEJYSrukr0mNsppfGth8FsDjFjuXXbyn0hs2T4NwojjJd3mqYGnI
	gWtAsnKV1y6SRup271JiJ16qSReLvXwyd03m1mNM=
Content-Type: multipart/mixed; boundary="===============5910531899350582821=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.38.5 SUCCEEDED
Message-ID: <0101018657b0042b-155cdd52-98cf-404f-b205-d0239e543b17-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:38 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177272

--===============5910531899350582821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.38.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.38.4-2.38.5.patch
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
--===============5910531899350582821==
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
DISTRO_VERSION       = "4.1+snapshot-a49d0624c7dbfe335306e6c115d5c8c921781ffc"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a49d0624c7dbfe335306e6c115d5c8c921781ffc"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 130 Local 21 Mirrors 0 Missed 109 Current 581 (16% match, 84% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 604 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1261 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: Running task 1550 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1551 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1552 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1675 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1798 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1871 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 1876 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1885 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure_ptest_base)
NOTE: Running task 1889 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: Running task 1922 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_fetch)
NOTE: Running task 1941 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 1943 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 1944 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 1945 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1946 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1947 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 1950 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1984 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 1985 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_fetch)
NOTE: Running task 1986 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 1987 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 1988 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_fetch)
NOTE: Running task 1989 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 1990 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: Running task 1991 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1992 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 1993 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_fetch)
NOTE: Running task 1994 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_fetch)
NOTE: Running task 1996 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2026 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_fetch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 2035 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: Running task 2048 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2076 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libwpe-1.14.0-r0: task do_fetch: Started
NOTE: Running task 2077 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.51.0-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 2106 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_write_config)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 2107 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 2108 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_write_config)
NOTE: Running task 2109 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_write_config)
NOTE: Running task 2112 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: recipe libwpe-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: Running task 2128 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_unpack)
NOTE: Running task 2129 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: Running task 2130 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: Running task 2131 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 2132 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: Running task 2133 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: Running task 2134 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 2135 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: Running task 2136 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: Running task 2137 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2138 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2139 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Succeeded
NOTE: Running task 2140 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2141 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running task 2142 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 2143 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: Running task 2144 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2145 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2146 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_unpack)
NOTE: Running task 2147 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Started
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2148 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_unpack)
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 2149 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Started
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe libwpe-1.14.0-r0: task do_unpack: Started
NOTE: recipe libwpe-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2150 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2151 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_unpack)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 2152 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_unpack)
NOTE: Running task 2153 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: Running task 2154 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: Running task 2155 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2156 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Succeeded
NOTE: Running task 2157 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2158 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2159 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: Running task 2160 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2161 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Started
NOTE: recipe pango-1.50.12-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2162 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2197 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2198 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: Running task 2199 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 2200 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2201 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2202 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 2203 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: Running task 2204 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe libwpe-1.14.0-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: Running task 2205 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2206 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: Running task 2207 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: Running task 2208 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2209 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2210 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: Running task 2211 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2212 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Started
NOTE: Running task 2213 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2214 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_patch)
NOTE: Running task 2215 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2216 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_patch)
NOTE: Running task 2217 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2218 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Succeeded
NOTE: Running task 2219 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2220 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_patch)
NOTE: Running task 2221 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: Running task 2222 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2223 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.51.0-r0: task do_patch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2224 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2225 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2226 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2227 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2228 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: Running task 2229 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2230 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 2231 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2232 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2233 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2234 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libwpe-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: Running task 2235 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2236 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_generate_toolchain_file)
NOTE: Running task 2237 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2238 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_generate_toolchain_file)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2239 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: Running task 2240 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2241 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.14.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2242 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.51.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2243 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2244 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2245 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: Running task 2246 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2247 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: Running task 2248 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_configure)
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2249 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_configure)
NOTE: Running task 2250 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: Running task 2251 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2252 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_configure)
NOTE: Running task 2253 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: Running task 2254 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.14.0-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2255 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4817efef4b707245ab88d5266d93bb6526fbc3fb945995561611618574018e1c
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2274 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2275 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2276 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2277 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2278 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9c037122271d20eab942bcef627c8daf1e16fc02b8b7bbc0edd2c42912c38dbc
NOTE: Running task 2285 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_compile)
NOTE: recipe libwpe-1.14.0-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2286 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_configure)
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Started
NOTE: recipe libwpe-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2287 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 2288 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe libwpe-1.14.0-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_patch)
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Started
NOTE: recipe libwpe-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 2290 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_populate_sysroot)
NOTE: Running task 2291 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_package)
NOTE: recipe libwpe-1.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.14.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2293 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_generate_toolchain_file)
NOTE: Running task 2294 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2295 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.38.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_lic unihash changed to e44c96b2b45739d36c5a652bff3b9cf01c27af24551fcf391fdafd716b15e00b
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2296 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2297 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_compile)
NOTE: recipe libwpe-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata)
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Started
NOTE: recipe libwpe-1.14.0-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.14.0-r0: task do_packagedata: Failed
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_configure: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2298 tasks of which 2145 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libwpe/1.14.0-r0/temp/log.do_packagedata.3023208
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata) failed with exit code '1'

--===============5910531899350582821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/webkitgtk: SRC_URI changed from "https://www.webkitgtk.org/releases/webkitgtk-2.38.4.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0d3344e17d258106617b0e6d783d073b188a2548.patch file://d318bb461f040b90453bc4e100dcf967243ecd98.patch" to "https://www.webkitgtk.org/releases/webkitgtk-2.38.5.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0d3344e17d258106617b0e6d783d073b188a2548.patch file://d318bb461f040b90453bc4e100dcf967243ecd98.patch"
packages/core2-32-poky-linux/webkitgtk: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk: PV changed from "2.38.4" to "2.38.5"
Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.1.so.0 changed symlink target from libjavascriptcoregtk-4.1.so.0.2.7 to libjavascriptcoregtk-4.1.so.0.2.8
  /usr/lib/libwebkit2gtk-4.1.so.0 changed symlink target from libwebkit2gtk-4.1.so.0.2.7 to libwebkit2gtk-4.1.so.0.2.8
  /usr/lib/libjavascriptcoregtk-4.1.so.0.2.7 moved to /usr/lib/libjavascriptcoregtk-4.1.so.0.2.8
  /usr/lib/libwebkit2gtk-4.1.so.0.2.7 moved to /usr/lib/libwebkit2gtk-4.1.so.0.2.8
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGSIZE changed from 3350389224 to 3354589936 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: FILELIST: removed "/usr/lib/.debug/libwebkit2gtk-4.1.so.0.2.7 /usr/lib/.debug/libjavascriptcoregtk-4.1.so.0.2.7", added "/usr/lib/.debug/libjavascriptcoregtk-4.1.so.0.2.8 /usr/lib/.debug/libwebkit2gtk-4.1.so.0.2.8"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PKGSIZE changed from 5545154 to 5545160 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hr: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hr: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGSIZE changed from 169569416 to 169573438 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PV changed from "2.38.4" to "2.38.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PKGSIZE changed from 83938047 to 84052735 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libjavascriptcoregtk-4.1.so.0.2.7 /usr/lib/libwebkit2gtk-4.1.so.0.2.7", added "/usr/lib/libwebkit2gtk-4.1.so.0.2.8 /usr/lib/libjavascriptcoregtk-4.1.so.0.2.8"
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PKGV changed from 2.38.4 [default] to 2.38.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PV changed from "2.38.4" to "2.38.5"

--===============5910531899350582821==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.38.4-2.38.5.patch"

RnJvbSA4OGUxNzUzZDVmYmZhZDA1NDEyNzkyZWQyYmY1Yjg2YjQ5NzY3ZDkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMjM6MTM6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZWJraXRndGs6IHVwZ3JhZGUgMi4zOC40IC0+IDIuMzguNQoKLS0tCiAuLi4vd2Via2l0L3t3ZWJr
aXRndGtfMi4zOC40LmJiID0+IHdlYmtpdGd0a18yLjM4LjUuYmJ9ICAgICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc2F0by93ZWJraXQve3dlYmtpdGd0a18yLjM4LjQuYmIgPT4gd2Via2l0Z3RrXzIu
MzguNS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Vi
a2l0Z3RrXzIuMzguNC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi4z
OC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zYXRv
L3dlYmtpdC93ZWJraXRndGtfMi4zOC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQvd2Via2l0Z3RrXzIuMzguNS5iYgppbmRleCBjYWI5MWVlYzkzLi5lNTI5MjA4ODNhIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrXzIuMzguNC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrXzIuMzguNS5iYgpAQCAtMTUs
NyArMTUsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LndlYmtpdGd0ay5vcmcvcmVsZWFzZXMv
JHtCUE59LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wZDMzNDRlMTdkMjU4MTA2
NjE3YjBlNmQ3ODNkMDczYjE4OGEyNTQ4LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2QzMThi
YjQ2MWYwNDBiOTA0NTNiYzRlMTAwZGNmOTY3MjQzZWNkOTgucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGY0N2VhMjlhMmQ0ZDVmMTVlZWYzZGM5ZTJkNmM2ZjA2
N2U4ZGU4NjNhM2Y2NDQ1NWUxY2NmOTY5M2NjMWQzNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0
MGMyMGM0MzAyMjI3NGRmNTg5M2YyMmIxMDU0ZmE4OTRjM2VlYTA1NzM4OWJiMDhhZWUwOGM1YjBi
YjBjMWE3IgogCiBpbmhlcml0IGNtYWtlIHBrZ2NvbmZpZyBnb2JqZWN0LWludHJvc3BlY3Rpb24g
cGVybG5hdGl2ZSBmZWF0dXJlc19jaGVjayB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4gZ2ktZG9j
Z2VuCiAKLS0gCjIuMzcuMwoK

--===============5910531899350582821==
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
Removing 114 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a49d0624c7dbfe335306e6c115d5c8c921781ffc"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a49d0624c7dbfe335306e6c115d5c8c921781ffc"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 464 Local 354 Mirrors 0 Missed 110 Current 226 (76% match, 84% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 227 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 243 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 274 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 289 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 378 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 741 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: Running task 839 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 877 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.3-r0: task do_package_setscene: Started
NOTE: Running task 931 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 958 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 961 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 963 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 969 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_fetch)
NOTE: Running task 975 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_fetch)
NOTE: Running task 982 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 983 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 984 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 986 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 987 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 989 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 990 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 1001 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 1002 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1003 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 1004 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_fetch)
NOTE: Running task 1005 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: Running task 1006 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 1007 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_fetch)
NOTE: Running task 1008 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_fetch)
NOTE: Running task 1009 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 1010 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 1011 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_fetch)
NOTE: Running task 1023 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_fetch)
NOTE: Running task 1030 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: Running task 1072 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 1073 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_write_config)
NOTE: Running task 1074 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: Running task 1075 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_write_config)
NOTE: Running task 1076 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 1077 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_write_config)
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 404 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 405 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1110 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1115 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1116 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: recipe libwpe-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 1117 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 1118 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 1123 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: Running task 1124 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1125 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Started
NOTE: Running task 1126 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Started
NOTE: Running task 1127 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1128 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1129 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: Running task 1130 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: Running task 1131 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Succeeded
NOTE: Running task 1132 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 1133 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running task 1134 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 1135 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Succeeded
NOTE: Running task 1136 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_unpack)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 411 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: Running setscene task 412 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 415 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1147 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: Running task 1148 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_unpack)
NOTE: Running task 1149 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: Running task 1150 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1151 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: Running task 1152 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe libwpe-1.14.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Succeeded
NOTE: Running task 1158 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_unpack)
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running setscene task 422 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.51.0-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Started
NOTE: recipe libwpe-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1159 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_patch)
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Started
NOTE: Running task 1160 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1170 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe mesa-2_22.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 427 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: Running task 1172 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: Running task 1173 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1174 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 1175 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: Running task 1176 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: recipe libwpe-1.14.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 1177 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1178 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_patch)
NOTE: Running setscene task 434 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: Running task 1179 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: Running task 1180 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1181 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1182 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_generate_toolchain_file)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1183 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1184 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: Running setscene task 436 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.3-r0: task do_package_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: Running setscene task 450 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: Running setscene task 451 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1199 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: Running task 1201 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: Running setscene task 461 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 1209 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1210 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_patch)
NOTE: Running task 1211 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1212 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: Running task 1213 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1214 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Succeeded
NOTE: Running setscene task 462 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: recipe libwpe-1.14.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1215 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1216 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1217 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1218 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1219 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1220 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: Running task 1221 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1222 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 472 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1227 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: Running task 1228 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1229 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1230 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1231 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: Running setscene task 476 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.51.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1232 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1233 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: Running setscene task 478 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Succeeded
NOTE: Running setscene task 480 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 486 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 493 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: Running task 1262 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1263 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1273 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1280 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: Running task 1284 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1285 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1288 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.51.0-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running task 1289 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_generate_toolchain_file)
NOTE: Running task 1290 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running setscene task 503 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: Running task 1292 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 506 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1301 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1302 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe nghttp2-1.51.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 519 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 523 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1330 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 1339 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1344 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: Running task 1350 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1351 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 538 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1374 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Succeeded
NOTE: Running task 1453 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1466 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Succeeded
NOTE: Running task 1471 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1472 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_generate_toolchain_file)
NOTE: Running task 1473 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_lic)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7c30c18a412f80b8d2e7b1f81942aab64f121c9686db2bdafc9ea4c65d7863f8
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_lic unihash changed to e44c96b2b45739d36c5a652bff3b9cf01c27af24551fcf391fdafd716b15e00b
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1884 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1966 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2032 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2039 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2099 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2116 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2132 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2133 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2134 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2136 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2137 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2139 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2159 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2160 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2161 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2162 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2180 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata)
NOTE: recipe libwpe-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2181 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2183 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4df38cbfcaf6d2c234ceb05b9afdc13533e483ab7f104a794420e68a37a61fb2
NOTE: Running task 2199 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2202 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2203 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2204 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2205 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2206 of 2381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata: Failed
NOTE: recipe nghttp2-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2206 tasks of which 2057 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.4-r0 to 0:0.56.3-r0) [version-going-backwards]
ERROR: vala-0.56.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vala/0.56.3-r0/temp/log.do_packagedata.3071748
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata) failed with exit code '1'

--===============5910531899350582821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.
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
DISTRO_VERSION       = "4.1+snapshot-a49d0624c7dbfe335306e6c115d5c8c921781ffc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a49d0624c7dbfe335306e6c115d5c8c921781ffc"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 129 Local 20 Mirrors 0 Missed 109 Current 586 (15% match, 84% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 608 of 715 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 715 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 715 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1261 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: Running task 1553 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1554 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1555 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1677 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1804 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1889 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 1894 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1903 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure_ptest_base)
NOTE: Running task 1907 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: Running task 1940 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_fetch)
NOTE: Running task 1960 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 1961 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1962 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 1963 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1964 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 1967 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 1968 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 2002 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 2003 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2004 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 2006 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2007 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_fetch)
NOTE: Running task 2008 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 2009 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_fetch)
NOTE: Running task 2010 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 2011 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_fetch)
NOTE: Running task 2012 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2042 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_fetch)
NOTE: Running task 2051 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 2052 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: Running task 2067 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: Running task 2090 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2111 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2112 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2124 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 2127 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_write_config)
NOTE: Running task 2128 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 2129 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_write_config)
NOTE: Running task 2130 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_write_config)
NOTE: recipe libwpe-1.14.0-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 2179 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libwpe-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Started
NOTE: Running task 2181 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_unpack)
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Started
NOTE: Running task 2182 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_unpack)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Started
NOTE: Running task 2183 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: Running task 2184 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: Running task 2185 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Started
NOTE: Running task 2186 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2187 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Started
NOTE: Running task 2188 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Succeeded
NOTE: Running task 2189 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running task 2190 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2191 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2192 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2193 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2194 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2195 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2196 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: Running task 2197 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2198 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_unpack)
NOTE: Running task 2199 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: Running task 2200 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_unpack)
NOTE: recipe libwpe-1.14.0-r0: task do_unpack: Started
NOTE: Running task 2201 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 2202 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_unpack)
NOTE: Running task 2203 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_unpack)
NOTE: Running task 2204 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_unpack)
NOTE: Running task 2205 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.51.0-r0: task do_unpack: Started
NOTE: Running task 2206 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2207 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2208 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2209 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: Running task 2210 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2211 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: Running task 2212 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2213 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: Running task 2214 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_patch)
NOTE: Running task 2215 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Started
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_compile: Started
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libwpe-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Started
NOTE: Running task 2216 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2217 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2218 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2219 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe nghttp2-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2220 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 2221 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2222 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe libwpe-1.14.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2223 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: Running task 2224 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2225 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: Running task 2226 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: Running task 2227 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2228 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_generate_toolchain_file)
NOTE: Running task 2229 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2230 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 2231 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 2232 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2233 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2234 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_patch)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2235 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe nghttp2-1.51.0-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2236 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_patch)
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2237 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Started
NOTE: recipe libwpe-1.14.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 2238 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: Running task 2239 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: Running task 2240 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_patch)
NOTE: recipe libwpe-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2241 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2242 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2243 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libwpe-1.14.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Started
NOTE: Running task 2244 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2245 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: recipe nghttp2-1.51.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2246 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2247 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2248 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2249 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2250 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2251 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2252 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2253 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2254 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2255 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2256 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_patch: Succeeded
NOTE: Running task 2257 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_generate_toolchain_file)
NOTE: Running task 2258 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2259 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2260 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2261 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2262 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 797a1f60b029d1426fd5844d9372e793307380323e335de4e341b3b4b719d326
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2280 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: Running task 2281 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: Running task 2282 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe nghttp2-1.51.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2284 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2285 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 2286 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2287 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: Running task 2288 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_configure)
NOTE: Running task 2289 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.14.0-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: Running task 2290 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: Running task 2291 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe nghttp2-1.51.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2292 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: Running task 2293 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2294 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2295 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2296 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3263d406b861519abafcb566ea589932eb9a2e7bc2c259532ce6d560ec9d798e
NOTE: recipe libwpe-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2303 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_compile)
NOTE: recipe libwpe-1.14.0-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2304 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_configure)
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Started
NOTE: recipe libwpe-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2305 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_install)
NOTE: recipe libwpe-1.14.0-r0: task do_install: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Succeeded
NOTE: Running task 2306 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_patch)
NOTE: recipe libwpe-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_populate_sysroot)
NOTE: Running task 2308 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_package)
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2309 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe libwpe-1.14.0-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Succeeded
NOTE: Running task 2310 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2311 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_generate_toolchain_file)
NOTE: Running task 2312 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2313 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.38.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_lic unihash changed to e44c96b2b45739d36c5a652bff3b9cf01c27af24551fcf391fdafd716b15e00b
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2314 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 2315 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_packagedata: Started
NOTE: Running task 2316 of 2470 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_compile)
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Started
NOTE: recipe libwpe-1.14.0-r0: task do_packagedata: Failed
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_configure: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2316 tasks of which 2163 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libwpe/1.14.0-r0/temp/log.do_packagedata.2882210
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata) failed with exit code '1'

--===============5910531899350582821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.1.so.0 changed symlink target from libjavascriptcoregtk-4.1.so.0.2.7 to libjavascriptcoregtk-4.1.so.0.2.8
  /usr/lib/libwebkit2gtk-4.1.so.0 changed symlink target from libwebkit2gtk-4.1.so.0.2.7 to libwebkit2gtk-4.1.so.0.2.8
  /usr/lib/libjavascriptcoregtk-4.1.so.0.2.7 moved to /usr/lib/libjavascriptcoregtk-4.1.so.0.2.8
  /usr/lib/libwebkit2gtk-4.1.so.0.2.7 moved to /usr/lib/libwebkit2gtk-4.1.so.0.2.8
packages/core2-32-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libjavascriptcoregtk-4.1.so.0.2.7 /usr/lib/libwebkit2gtk-4.1.so.0.2.7", added "/usr/lib/libjavascriptcoregtk-4.1.so.0.2.8 /usr/lib/libwebkit2gtk-4.1.so.0.2.8"

--===============5910531899350582821==
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
DISTRO_VERSION       = "4.1+snapshot-a49d0624c7dbfe335306e6c115d5c8c921781ffc"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a49d0624c7dbfe335306e6c115d5c8c921781ffc"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 131 Local 22 Mirrors 0 Missed 109 Current 580 (16% match, 84% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 604 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1261 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: Running task 1552 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1553 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1554 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1675 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1798 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1871 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 1876 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1885 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1889 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_fetch)
NOTE: Running task 1922 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_fetch)
NOTE: Running task 1943 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1944 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1945 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 1947 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 1948 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 1949 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 1950 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: Running task 1984 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_fetch)
NOTE: Running task 1985 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 1986 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_fetch)
NOTE: Running task 1987 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1988 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 1990 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 1991 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_fetch)
NOTE: Running task 1992 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 1993 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_fetch)
NOTE: Running task 1994 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 2024 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_fetch)
NOTE: Running task 2051 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2080 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 2081 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2103 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 2104 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_write_config)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 2107 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 2108 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_write_config)
NOTE: Running task 2109 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_write_config)
NOTE: Running task 2127 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2158 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2159 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.14.0-r0: task do_fetch: Started
NOTE: Running task 2162 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe libwpe-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2163 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_unpack)
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Started
NOTE: Running task 2164 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: Running task 2165 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 2166 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_unpack)
NOTE: Running task 2167 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: Running task 2168 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: Running task 2169 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2170 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2171 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2172 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running task 2173 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2174 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2175 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2176 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_unpack)
NOTE: Running task 2177 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: Running task 2178 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_unpack)
NOTE: Running task 2179 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2180 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running task 2181 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: Running task 2182 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_unpack)
NOTE: Running task 2183 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2184 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_unpack)
NOTE: Running task 2185 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 2186 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_unpack)
NOTE: Running task 2187 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2188 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.14.0-r0: task do_unpack: Started
NOTE: Running task 2189 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: Running task 2190 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2191 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2192 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2193 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 2194 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.51.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe pango-1.50.12-r0: task do_compile: Started
NOTE: Running task 2195 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2196 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running task 2197 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe libwpe-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2198 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_patch)
NOTE: recipe libwpe-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2199 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Started
NOTE: Running task 2200 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2201 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: Running task 2202 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2203 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: Running task 2204 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 2205 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: Running task 2206 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2207 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 2208 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2209 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2210 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_patch)
NOTE: Running task 2211 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 2212 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: Running task 2213 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2214 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 2215 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2216 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2217 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2218 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2219 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.51.0-r0: task do_unpack: Succeeded
NOTE: Running task 2220 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Started
NOTE: Running task 2221 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2222 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_patch)
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2223 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2224 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2225 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2226 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2227 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2228 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2229 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2230 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2231 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2233 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: Running task 2234 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2235 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Succeeded
NOTE: Running task 2236 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_patch: Succeeded
NOTE: Running task 2237 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_generate_toolchain_file)
NOTE: Running task 2238 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2239 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_generate_toolchain_file)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: Running task 2240 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2241 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2242 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2243 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2244 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2245 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libwpe-1.14.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7a3ecd0453329f08fc7dc59198cc5dbb9d428c1b9dd44663a3e9a6b0049f23f1
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: Running task 2264 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.14.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 2265 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2266 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2267 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libwpe-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2268 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_configure)
NOTE: Running task 2269 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: Running task 2270 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: Running task 2271 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2272 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: Running task 2273 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_configure)
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2274 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2275 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: Running task 2276 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2277 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe libwpe-1.14.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2278 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e9c1144ea2419bed6d0fc635780029749c392f66d9ede00d45690172e50f2dbd
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2285 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_configure)
NOTE: recipe libwpe-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2286 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_compile)
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Started
NOTE: recipe libwpe-1.14.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2287 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 2288 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_patch)
NOTE: recipe libwpe-1.14.0-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 2290 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2291 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_generate_toolchain_file)
NOTE: Running task 2292 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_lic)
NOTE: Running task 2293 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_populate_sysroot)
NOTE: Running task 2294 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_package)
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.14.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_lic unihash changed to e44c96b2b45739d36c5a652bff3b9cf01c27af24551fcf391fdafd716b15e00b
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2295 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2296 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_configure)
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2452 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata)
NOTE: recipe libwpe-1.14.0-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_packagedata: Failed
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_configure: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2298 tasks of which 2145 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libwpe/1.14.0-r0/temp/log.do_packagedata.2929447
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata) failed with exit code '1'

--===============5910531899350582821==
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
DISTRO_VERSION       = "4.1+snapshot-a49d0624c7dbfe335306e6c115d5c8c921781ffc"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a49d0624c7dbfe335306e6c115d5c8c921781ffc"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 21 Mirrors 0 Missed 105 Current 575 (16% match, 85% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 598 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1255 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_fetch)
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Started
NOTE: Running task 1542 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgpg-error-1.46-r0: task do_fetch: Succeeded
NOTE: Running task 1543 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_unpack)
NOTE: Running task 1544 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_prepare_recipe_sysroot)
NOTE: recipe iso-codes-4.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1665 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1786 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 1859 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 1864 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Started
NOTE: Running task 1873 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1877 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_fetch)
NOTE: Running task 1910 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_fetch)
NOTE: Running task 1930 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 1931 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1932 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 1933 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1934 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 1937 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: Running task 1970 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1971 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 1972 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_fetch)
NOTE: Running task 1973 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_fetch)
NOTE: Running task 1974 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_fetch)
NOTE: Running task 1975 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 1976 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_fetch)
NOTE: Running task 1977 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 1979 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 1980 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_fetch)
NOTE: Running task 2010 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: Running task 2063 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 2064 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2077 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 2078 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_write_config)
NOTE: Running task 2079 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_write_config)
NOTE: Running task 2080 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_write_config)
NOTE: Running task 2081 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: Running task 2106 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 2107 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2108 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.51.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.14.0-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: Running task 2136 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Started
NOTE: Running task 2137 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.46-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Started
NOTE: Running task 2138 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Started
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_fetch: Succeeded
NOTE: Running task 2139 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_write_config: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2140 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2141 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_unpack)
NOTE: Running task 2142 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2143 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2144 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2145 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2146 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2147 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2148 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2149 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2150 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: Running task 2151 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_unpack)
NOTE: Running task 2152 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_unpack)
NOTE: Running task 2153 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_unpack)
NOTE: Running task 2154 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2155 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_unpack)
NOTE: Running task 2156 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: Running task 2157 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running task 2158 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_unpack)
NOTE: recipe libwpe-1.14.0-r0: task do_unpack: Started
NOTE: Running task 2159 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_unpack)
NOTE: Running task 2160 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2161 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Started
NOTE: Running task 2162 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2163 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: Running task 2164 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2165 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2166 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: Running task 2167 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 2168 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe libwpe-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2169 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Started
NOTE: Running task 2170 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_patch)
NOTE: Running task 2171 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Started
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 2172 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe libgpg-error-1.46-r0: task do_patch: Succeeded
NOTE: Running task 2173 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 2174 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_patch)
NOTE: Running task 2175 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: Running task 2176 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: Running task 2177 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_patch: Started
NOTE: Running task 2178 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_patch)
NOTE: Running task 2179 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2180 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2181 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2182 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 2183 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libsoup-3.2.2-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Started
NOTE: Running task 2184 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_patch)
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2185 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2186 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: Running task 2187 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: Running task 2188 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: recipe nghttp2-1.51.0-r0: task do_unpack: Succeeded
NOTE: Running task 2189 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_patch)
NOTE: recipe libnotify-0.8.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2190 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2191 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: Running task 2192 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2193 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_unpack: Succeeded
NOTE: Running task 2194 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2195 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: Running task 2196 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 2197 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2198 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2199 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2200 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_patch: Started
NOTE: Running task 2201 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_configure)
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2202 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: Running task 2203 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2204 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2205 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_generate_toolchain_file)
NOTE: Running task 2206 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2207 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.37-r0: task do_patch: Succeeded
NOTE: Running task 2208 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2209 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.51.0-r0: task do_patch: Succeeded
NOTE: Running task 2210 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_generate_toolchain_file)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2211 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2212 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2213 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.14.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2214 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-3.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0695e9e8b2f4b8b2c4715d4c53efa9be70d0de573463e5a5169889555f05fbb7
NOTE: Running task 2232 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: Running task 2234 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2235 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_configure)
NOTE: recipe libxslt-1.1.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2236 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2237 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.37.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: Running task 2238 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: Running task 2239 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: Running task 2240 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe nghttp2-1.51.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2241 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb:do_configure)
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_configure: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2242 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Started
NOTE: Running task 2243 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2244 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe nghttp2-1.51.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2245 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2246 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2247 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libwpe-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2248 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 046205aa66778148b3471ca4f7fc14af418b4fb272b1d1f1c69cf6355dc24e4e
NOTE: recipe libnotify-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2255 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_configure)
NOTE: recipe libwpe-1.14.0-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Started
NOTE: recipe libwpe-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2256 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_install)
NOTE: recipe libwpe-1.14.0-r0: task do_install: Started
NOTE: recipe libwpe-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 2257 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.38.5-r0: task do_unpack: Succeeded
NOTE: Running task 2258 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_patch)
NOTE: Running task 2259 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_package)
NOTE: recipe libwpe-1.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Started
NOTE: recipe libwpe-1.14.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_patch: Succeeded
NOTE: Running task 2260 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2261 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_generate_toolchain_file)
NOTE: Running task 2262 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.38.5-r0: task do_populate_lic: Started
NOTE: recipe libwpe-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.38.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2263 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.38.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_lic unihash changed to e44c96b2b45739d36c5a652bff3b9cf01c27af24551fcf391fdafd716b15e00b
NOTE: recipe webkitgtk-2.38.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2264 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.1.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2265 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb:do_configure)
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwpe-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 2266 of 2416 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata)
NOTE: recipe libwpe-1.14.0-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.14.0-r0: task do_packagedata: Failed
NOTE: recipe wpebackend-fdo-1.14.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: recipe nghttp2-1.51.0-r0: task do_configure: Succeeded
NOTE: recipe libnotify-0.8.1-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe libxslt-1.1.37-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2266 tasks of which 2121 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.14.1-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: libwpe-1.14.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libwpe/1.14.0-r0/temp/log.do_packagedata.2975970
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.14.0.bb:do_packagedata) failed with exit code '1'

--===============5910531899350582821==--

