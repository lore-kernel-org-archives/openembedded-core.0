Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2372C2BB41
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:37 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.3949.1659679408763091031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TiZCBGOU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101826c9a026a-188f8498-cd0e-47f7-84bb-a5e108eb514e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679409;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UUMcOqZdkzWcXhwMlwgnnG9THWZQ+jkIfXRqk++H+98=;
	b=TiZCBGOUb1TFdvgMyEp/44DIt9oY82tioTCAfrAEnRa33y0jKmEFdLurB3EOnCCG
	Mwon3vxnQEQP0GR+/iS4MZDKDt0UjMx4gS/tauW9xEwm4GayTOX/0yC2pk4eYAUhvfw
	aIVLinMT4XIdvfitF5TIC2CtCn16qHdfpmF3YIq0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679409;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UUMcOqZdkzWcXhwMlwgnnG9THWZQ+jkIfXRqk++H+98=;
	b=GafYWNUhhhahILuFCkX33qah9WCci754u9CgSx1Mkel67QbvtD/KGz7v6HGbIOgI
	bQLKiOjGTViSMz/7MxdRBUlH6fHbg9/LeNXL5649pxwmqOHDFFgMKHk6LbD353db7La
	XG0p07XQ3sKWdS2azARxkESPMcOMjw03Ffl6zs0o=
Content-Type: multipart/mixed; boundary="===============4545487028202098188=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.36.5 SUCCEEDED
Message-ID: 
 <010101826c9a026a-188f8498-cd0e-47f7-84bb-a5e108eb514e-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168921

--===============4545487028202098188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.36.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.36.4-2.36.5.patch
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
--===============4545487028202098188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 53 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-f8e7e9bdadbe5a619a816ba74342e4ea4fd3292e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8e7e9bdadbe5a619a816ba74342e4ea4fd3292e"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 13 Mirrors 0 Missed 95 Current 594 (12% match, 86% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 682 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1501 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1686 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_fetch)
NOTE: Running task 1870 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_write_config)
NOTE: Running task 1873 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1892 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: Running task 1948 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 1949 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1950 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1952 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1953 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_fetch)
NOTE: Running task 1954 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1955 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_fetch)
NOTE: Running task 1958 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 1992 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 1993 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_fetch)
NOTE: Running task 1994 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_fetch)
NOTE: Running task 1995 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 1996 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: Running task 1997 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 1998 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1999 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 2001 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 2002 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 2032 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_fetch)
NOTE: Running task 2057 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Started
NOTE: Running task 2093 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: Running task 2094 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_write_config)
NOTE: Running task 2095 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: Running task 2096 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 2098 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 2150 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe iso-codes-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Started
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2152 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_unpack)
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: Running task 2153 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe vala-0.56.2-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2154 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2155 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2156 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: Running task 2157 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2158 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2159 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2160 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.2-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Succeeded
NOTE: Running task 2161 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 2162 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_unpack)
NOTE: Running task 2163 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 2164 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2165 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_fetch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 2166 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_unpack)
NOTE: Running task 2167 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2168 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_unpack)
NOTE: Running task 2169 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_unpack)
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: Running task 2170 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2171 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2172 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: recipe webkitgtk-2.36.5-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: Running task 2173 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2174 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: Running task 2175 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 2176 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running task 2177 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running task 2178 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2179 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: Running task 2180 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2181 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2182 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2183 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2184 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: Running task 2185 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.2-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.0-r0: task do_unpack: Started
NOTE: Running task 2186 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2188 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: Running task 2189 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2190 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2191 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: Running task 2192 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: Running task 2193 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2194 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: Running task 2195 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2196 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2197 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2198 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: Running task 2199 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: Running task 2200 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2201 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: Running task 2202 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: Running task 2203 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_patch)
NOTE: recipe libnotify-0.8.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: Running task 2204 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_patch)
NOTE: Running task 2205 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2206 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: Running task 2207 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2208 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: Running task 2209 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_patch)
NOTE: Running task 2210 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Started
NOTE: Running task 2211 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2212 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2213 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2214 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2215 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: Running task 2216 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2217 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 2218 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2219 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2220 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_unpack: Succeeded
NOTE: Running task 2221 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: Running task 2222 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_patch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2223 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2224 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 2225 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2226 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2227 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.2-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2228 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2229 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.56.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2230 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2231 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 31aeafc9bdefb849a0d9799a7a1cf5dd0a031fa6b225e0337804f44f7a3a2263
NOTE: Running task 2255 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2256 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_configure)
NOTE: Running task 2257 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2263 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2264 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: Running task 2265 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2266 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2267 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_configure)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2268 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: Running task 2269 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2270 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: Running task 2271 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe vala-0.56.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Started
NOTE: Running task 2272 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2273 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe vala-0.56.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2274 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2275 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b2218f556211d104deaba5f8560d1304b0f810691e2f5684aa350a9247ccff14
NOTE: recipe libnotify-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2286 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_configure)
NOTE: recipe libnotify-0.8.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2287 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_unpack: Succeeded
NOTE: Running task 2288 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_patch)
NOTE: recipe webkitgtk-2.36.5-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 2289 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe webkitgtk-2.36.5-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2291 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_generate_toolchain_file)
NOTE: Running task 2292 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_populate_lic)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe webkitgtk-2.36.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_populate_lic: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_populate_lic: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_populate_lic unihash changed to 4cee016c16de66a012c525d2b11633472df24b644a28608805703e17e4833e31
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2294 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2295 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2296 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2297 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_compile: Started
NOTE: Running task 2298 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 2299 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2300 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Failed
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2300 tasks of which 2159 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libwpe/1.12.0-r0/temp/log.do_packagedata.2413724
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata) failed with exit code '1'

--===============4545487028202098188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1659 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f8e7e9bdadbe5a619a816ba74342e4ea4fd3292e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8e7e9bdadbe5a619a816ba74342e4ea4fd3292e"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 13 Mirrors 0 Missed 95 Current 598 (12% match, 86% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 686 of 706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1501 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe iso-codes-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1688 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_fetch)
NOTE: Running task 1888 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_write_config)
NOTE: Running task 1891 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1910 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: Running task 1966 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 1967 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1969 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1970 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_fetch)
NOTE: Running task 1971 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1972 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1973 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_fetch)
NOTE: Running task 1976 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 2010 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 2011 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: Running task 2012 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 2013 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 2014 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2015 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_fetch)
NOTE: Running task 2016 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 2017 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2018 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_fetch)
NOTE: Running task 2020 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 2050 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_fetch)
NOTE: Running task 2073 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 2111 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: Running task 2112 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: Running task 2113 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 2114 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 2115 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_write_config)
NOTE: Running task 2169 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Started
NOTE: Running task 2171 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_unpack)
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 2172 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe vala-0.56.2-r0: task do_fetch: Started
NOTE: Running task 2173 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 2174 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: Running task 2175 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe vala-0.56.2-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: Running task 2176 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2177 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 2178 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2179 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_unpack)
NOTE: Running task 2180 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: Running task 2181 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: Running task 2182 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_unpack)
NOTE: Running task 2183 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 2184 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2185 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 2186 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2187 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: Running task 2188 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: Running task 2189 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: Running task 2190 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2191 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: Running task 2192 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_unpack)
NOTE: recipe libnotify-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: Running task 2193 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running task 2194 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2195 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.36.5-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.0-r0: task do_write_config: Started
NOTE: Running task 2196 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2197 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 2198 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_write_config: Succeeded
NOTE: Running task 2199 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_unpack)
NOTE: Running task 2200 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2201 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Started
NOTE: Running task 2202 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: Running task 2203 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: Running task 2204 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Started
NOTE: recipe vala-0.56.2-r0: task do_unpack: Started
NOTE: Running task 2205 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.0-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2206 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: Running task 2207 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_unpack: Started
NOTE: recipe vala-0.56.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2208 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2209 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2210 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 2211 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: Running task 2212 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: Running task 2213 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2214 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libnotify-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2215 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_patch)
NOTE: Running task 2216 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2217 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_patch)
NOTE: Running task 2218 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2219 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: Running task 2220 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2221 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: Running task 2222 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2223 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: Running task 2224 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2225 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2226 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: Running task 2227 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_patch)
NOTE: recipe libnotify-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2228 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: Running task 2229 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2230 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.2-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Started
NOTE: Running task 2231 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2232 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2233 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe libnotify-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.2-r0: task do_patch: Started
NOTE: Running task 2234 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2235 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2236 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2237 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2238 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: Running task 2239 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2240 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2241 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2242 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: Running task 2243 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 2244 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2245 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2246 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0cb395d3538a9407268bc0b3afe0fcee44c439360721ee60d8257140abbfcb76
NOTE: Running task 2265 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2271 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2272 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2278 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2279 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_configure)
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2280 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2281 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2282 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: Running task 2283 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2284 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2285 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2286 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: Running task 2287 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Started
NOTE: Running task 2288 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2289 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: Running task 2290 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: Running task 2291 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: Running task 2292 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2293 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 363e0d1bb995f81bceb8d8e9d6d721c4c6eec23d0d2d5e0a2bbfe50c79d95211
NOTE: recipe libnotify-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2304 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_configure)
NOTE: recipe libnotify-0.8.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2305 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_unpack: Succeeded
NOTE: Running task 2306 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_patch)
NOTE: recipe webkitgtk-2.36.5-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_patch: Succeeded
NOTE: Running task 2307 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2308 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_generate_toolchain_file)
NOTE: Running task 2309 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_populate_lic)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2310 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe webkitgtk-2.36.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_populate_lic unihash changed to 4cee016c16de66a012c525d2b11633472df24b644a28608805703e17e4833e31
NOTE: recipe webkitgtk-2.36.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 2311 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2312 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2313 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2314 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe libnotify-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2316 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2318 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 2319 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 2320 of 2440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Failed
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2320 tasks of which 2177 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libwpe/1.12.0-r0/temp/log.do_packagedata.2365064
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata) failed with exit code '1'

--===============4545487028202098188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.0.so.18 changed symlink target from libjavascriptcoregtk-4.0.so.18.20.8 to libjavascriptcoregtk-4.0.so.18.20.9
  /usr/lib/libwebkit2gtk-4.0.so.37 changed symlink target from libwebkit2gtk-4.0.so.37.56.8 to libwebkit2gtk-4.0.so.37.56.9
  /usr/lib/libjavascriptcoregtk-4.0.so.18.20.8 moved to /usr/lib/libjavascriptcoregtk-4.0.so.18.20.9
  /usr/lib/libwebkit2gtk-4.0.so.37.56.8 moved to /usr/lib/libwebkit2gtk-4.0.so.37.56.9
packages/core2-32-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libjavascriptcoregtk-4.0.so.18.20.8 /usr/lib/libwebkit2gtk-4.0.so.37.56.8", added "/usr/lib/libwebkit2gtk-4.0.so.37.56.9 /usr/lib/libjavascriptcoregtk-4.0.so.18.20.9"

--===============4545487028202098188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/webkitgtk: SRC_URI changed from "https://www.webkitgtk.org/releases/webkitgtk-2.36.4.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch file://0001-Fix-build-without-opengl-or-es.patch file://reproducibility.patch file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch" to "https://www.webkitgtk.org/releases/webkitgtk-2.36.5.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch file://0001-Fix-build-without-opengl-or-es.patch file://reproducibility.patch file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch"
packages/core2-32-poky-linux/webkitgtk: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk: PV changed from "2.36.4" to "2.36.5"
Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.0.so.18 changed symlink target from libjavascriptcoregtk-4.0.so.18.20.8 to libjavascriptcoregtk-4.0.so.18.20.9
  /usr/lib/libwebkit2gtk-4.0.so.37 changed symlink target from libwebkit2gtk-4.0.so.37.56.8 to libwebkit2gtk-4.0.so.37.56.9
  /usr/lib/libjavascriptcoregtk-4.0.so.18.20.8 moved to /usr/lib/libjavascriptcoregtk-4.0.so.18.20.9
  /usr/lib/libwebkit2gtk-4.0.so.37.56.8 moved to /usr/lib/libwebkit2gtk-4.0.so.37.56.9
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGSIZE changed from 3335099424 to 3335204388 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: FILELIST: removed "/usr/lib/.debug/libwebkit2gtk-4.0.so.37.56.8 /usr/lib/.debug/libjavascriptcoregtk-4.0.so.18.20.8", added "/usr/lib/.debug/libwebkit2gtk-4.0.so.37.56.9 /usr/lib/.debug/libjavascriptcoregtk-4.0.so.18.20.9"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hr: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hr: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGSIZE changed from 144848813 to 144863157 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: FILELIST: directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Platform/classifier -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Platform/classifier, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/API/c/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/API/c/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/JavaScriptCore/PrivateHeaders/JavaScriptCore -> /usr/src/debug/webkitgtk/2.36.5-r0/build/JavaScriptCore/PrivateHeaders/JavaScriptCore, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/streams -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/streams, dire
 ctory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebStorage -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/WebStorage, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/rendering/svg -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/rendering/svg, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/editing/atspi -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/editing/atspi, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/MediaCache -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/MediaCache, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/interpreter -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/interpreter, directory renamed /usr/src/debug/webkitgtk/
 2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/FileAPI -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/FileAPI, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/glx -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/glx, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/page -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/page, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/loader/soup -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/loader/soup, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/harfbuzz -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/harfbuzz, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf/threads
  -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf/threads, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/builtins -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/builtins, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/API/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/API/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/sql -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/sql, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/InjectedBundle/API/gtk/DOM -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.3
 6.5/Source/WebKit/WebProcess/InjectedBundle/API/gtk/DOM, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/gstreamer/mse -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/gstreamer/mse, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/PAL/pal/text -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/PAL/pal/text, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/PAL/pal -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/PAL/pal, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebPage/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebK
 it/WebProcess/WebPage/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/image-decoders/cairo -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/image-decoders/cairo, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/crypto/keys -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/crypto/keys, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/WebsiteData -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/WebsiteData, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/mediacapabilities -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/mediacapabilities, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/SharedWorker -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/
 Source/WebKit/NetworkProcess/SharedWorker, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/workers/service -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/workers/service, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf/text/icu -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf/text/icu, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/parser -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/parser, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WTF/Headers/wtf/unicode/icu -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WTF/Headers/wtf/unicode/icu, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Tools/MiniBrowser/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Tools/MiniBrowser/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/W
 ebCore/inspector/agents/page -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/inspector/agents/page, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/disassembler -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/disassembler, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WTF/Headers/wtf/text -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WTF/Headers/wtf/text, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/indexeddb -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/indexeddb, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/PAL/Headers/pal/crypto -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/PAL/pal/crypto, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/push-api -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/M
 odules/push-api, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/CoordinatedGraphics -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/CoordinatedGraphics, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/PAL/pal/system -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/PAL/pal/system, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/PrivateClickMeasurement -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/PrivateClickMeasurement, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/crypto/algorithms -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.3
 6.5/Source/WebCore/crypto/algorithms, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/storage -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/storage, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/notifications -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/notifications, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/gstreamer -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/gstreamer, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/image-decoders/ico -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/image-d
 ecoders/ico, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/mediacapabilities -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/mediacapabilities, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/indexeddb/server -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/indexeddb/server, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/include/GLES -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/include/GLES, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/accessibility -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/accessibility, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/bindings/js -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/bindings/js, dire
 ctory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/html/shadow -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/html/shadow, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/FullScreen -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/FullScreen, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/API/cpp -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/API/cpp, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/JavaScriptCore/Headers/JavaScriptCor
 e -> /usr/src/debug/webkitgtk/2.36.5-r0/build/JavaScriptCore/Headers/JavaScriptCore, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/linux -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/linux, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/x11 -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/x11, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops/vulkan -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops/vulkan, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/webdatabase -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/webdatabase, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/MiniBrowser/Deriv
 edSources -> /usr/src/debug/webkitgtk/2.36.5-r0/build/MiniBrowser/DerivedSources, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/API -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/API, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/storage -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/storage, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/layout/integration -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/layout/integration, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/ANGLE/Headers/KHR -> /usr/src/debug/webkitgtk/2.36.5-r0/build/ANGLE/Headers/KHR, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/PAL/Headers/pal/graphics/WebGPU -> /usr/src/debug/webkitgtk/2.36.5-r0/build/PAL/Headers/pal/graphics/WebGPU, directory renamed /usr/src/debug/webk
 itgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/replay -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/replay, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/contentextensions -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/contentextensions, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebCoreSupport/soup -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/WebCoreSupport/soup, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/image-decoders/jpeg -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/image-decoders/jpeg, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/webaudio -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/webaudio, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0
 /webkitgtk-2.36.4/Source/WebCore/page/linux -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/page/linux, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/cairo -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/cairo, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/bindings -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/bindings, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebCoreSupport -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/WebCoreSupport, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/text -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/text, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCo
 re/API -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/API, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/cairo -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/cairo, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/texmap/coordinated -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/texmap/coordinated, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/opentype -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/opentype, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebCoreSupport/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/WebCoreSupport/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.
 4/Source/WebKit/WebProcess/Network/webrtc -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Network/webrtc, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/src/common/spirv -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/src/common/spirv, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/webdriver -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/webdriver, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/CoordinatedGraphics -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/CoordinatedGraphics, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/
 WebKit/UIProcess/Inspector/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Inspector/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/loader/cache -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/loader/cache, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/fetch -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/fetch, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf/dtoa -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf/dtoa, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/WebsiteData -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/WebsiteData, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/css/parser -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36
 .5/Source/WebCore/css/parser, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/Inspector/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Inspector/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Platform/IPC -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Platform/IPC, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Platform/IPC/unix -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Platform/IPC/unix, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/linux -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/linux, directory renamed /usr/src/de
 bug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/image-decoders -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/image-decoders, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/mock/mediasource -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/mock/mediasource, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WTF/Headers/wtf/dtoa -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WTF/Headers/wtf/dtoa, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Inspector/Agents -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Inspector/Agents, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Automation -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Automation, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2
 .36.4/Source/WebCore/mathml -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/mathml, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/Notifications -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/Notifications, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/audio/gstreamer -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/audio/gstreamer, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebCoreSupport/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/WebCoreSupport/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/src/common -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/src/common, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/
 WebKit/NetworkProcess/Classifier -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/Classifier, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/Cache -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Cache, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Network -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Network, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/inspector/remote/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/inspector/remote/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/API/C/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/API/C/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WTF/Headers/wtf/persi
 stence -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WTF/Headers/wtf/persistence, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/Network -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Network, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebPage/gstreamer -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/WebPage/gstreamer, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/opengl -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/opengl, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/css/calc -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/css/calc, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/unix -> /usr/src/debug/webkitgtk/2.36.5-r0
 /webkitgtk-2.36.5/Source/WebKit/Shared/unix, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/llint -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/llint, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/Databases/IndexedDB -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Databases/IndexedDB, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/PAL/pal/crypto -> /usr/src/debug/webkitgtk/2.36.5-r0/build/PAL/Headers/pal/crypto, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/yarr -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/yarr, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/PAL/Headers/pal -> /usr/src/debug/webkitgtk/2.36.5-r0/build/PAL/Headers/pal, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/
 Source/WebCore/xml/parser -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/xml/parser, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/soup -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/soup, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/iso -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/iso, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/bridge/jsc -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/bridge/jsc, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Platform -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Platform, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/ANGLE/Headers/ANGLE -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANG
 LE/include/GLSLANG, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/inspector/remote -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/inspector/remote, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/xdgmime/src -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/xdgmime/src, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/tools -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/tools, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/rendering/style -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/rendering/style, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/Model -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Model, directory renamed /usr/src/de
 bug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/src/compiler/translator/tree_util -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/src/compiler/translator/tree_util, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/dfg -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/dfg, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/Inspector -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Inspector, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/css -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/css, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Inspector -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Inspector, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0
 /webkitgtk-2.36.4/Source/WebCore/platform/graphics/nicosia/cairo -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/nicosia/cairo, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/animation -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/animation, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/workers/shared -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/workers/shared, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebPage/libwpe -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/WebPage/libwpe, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProce
 ss/Automation/cairo -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Automation/cairo, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/PAL/pal/system/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/PAL/pal/system/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/InjectedBundle/API/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/InjectedBundle/API/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WebKit2Gtk/Headers/webkit2 -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WebKit2Gtk/Headers/webkit2, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/include/GLSLANG -> /usr/src/debug/webkitgtk/2.36.5-r0/build/ANGLE/Headers/ANGLE, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/svg/animation -> /usr/src/debug/webkitgtk/2.36
 .5-r0/webkitgtk-2.36.5/Source/WebCore/svg/animation, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/animation -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/animation, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/html/canvas -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/html/canvas, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/WebGPU -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/WebGPU, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/EntryPoint/unix -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/EntryPoint/unix, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/image-decoders/png -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/W
 ebCore/platform/image-decoders/png, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/mediastream/libwebrtc -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/mediastream/libwebrtc, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/domjit -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/domjit, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/InjectedBundle/API/c -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/InjectedBundle/API/c, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/WebsiteData/unix -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/WebsiteData/unix, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/fileapi -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5
 /Source/WebCore/fileapi, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/API/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/API/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebPage/atk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/WebPage/atk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/contact-picker -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/contact-picker, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/soup -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/soup, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/indexeddb/client -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/indexeddb/cl
 ient, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebPage/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/WebPage/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WTF/Headers/wtf -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WTF/Headers/wtf, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/egl -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/egl, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/svg/graphics -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/svg/graphics, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Launcher/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Launcher/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/S
 ource/WebKit/UIProcess/gstreamer -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/gstreamer, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Platform/unix -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Platform/unix, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/soup -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/soup, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/style -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/style, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/workers/service/server -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-
 2.36.5/Source/WebCore/workers/service/server, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WebCore/DerivedSources -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WebCore/DerivedSources, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/dom -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/dom, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WebKit2Gtk/Headers/webkit2gtk-webextension/webkit2 -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WebKit2Gtk/Headers/webkit2gtk-webextension/webkit2, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/cairo -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/cairo, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/wayland -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/wayland, directory renamed /usr/src/debug/webkitgtk/
 2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Launcher -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Launcher, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/loader -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/loader, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/plugins -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/plugins, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WebKit2Gtk/Headers/webkit2gtk-4.0/webkit2 -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/API/gtk3, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/JavaScriptCoreGLib/Headers/jsc -> /usr/src/debug/webkitgtk/2.36.5-r0/build/JavaScriptCoreGLib/Headers/jsc, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/image-decoders/bmp -> /usr/src/debug/webkitgtk/2.36.5-r0
 /webkitgtk-2.36.5/Source/WebCore/platform/image-decoders/bmp, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/bindings -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/bindings, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/jit -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/jit, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/texmap -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/texmap, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/JavaScriptCore/DerivedSources/inspector -> /usr/src/debug/webkitgtk/2.36.5-r0/build/JavaScriptCore/DerivedSources/inspector,
  directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/storage -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/storage, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/domjit -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/domjit, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/API/C/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/API/C/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/EntryPoint/unix -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/EntryPoint/unix, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/svg/graphics/filters -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/svg/graphics/filters, directory rename
 d /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/bytecode -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/bytecode, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/page/csp -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/page/csp, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf/posix -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf/posix, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/webcodecs -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/webcodecs, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/src/common/third_party/base/anglebase/numerics -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/src/common/third_party/base/anglebase/numerics, directory renamed /usr/
 src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/geolocation -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/geolocation, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WebDriver/DerivedSources -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WebDriver/DerivedSources, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/history -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/history, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/page/scrolling -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/page/scrolling, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/API/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/API/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/xml -> /usr/src/debug/webkitgtk/2.36.5-
 r0/webkitgtk-2.36.5/Source/WebCore/xml, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/assembler -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/assembler, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/CustomProtocols -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/CustomProtocols, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/heap -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/heap, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/InjectedBundle/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/InjectedBundle/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf/unix -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF
 /wtf/unix, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/audio/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/audio/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/API/c -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/API/c, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/API/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/API/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/IndexedDB -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/IndexedDB, directory renamed /usr/src/debug/webki
 tgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/rendering -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/rendering, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/rendering/line -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/rendering/line, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/html/parser -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/html/parser, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/libwpe -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/libwpe, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/mediastream -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/mediastream, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/page
 /gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/page/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/Geolocation -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Geolocation, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WTF/Headers/wtf/unicode -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WTF/Headers/wtf/unicode, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/async-clipboard -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/async-clipboard, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/CoordinatedGraphics/threadedcompositor -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/CoordinatedGraphics/threadedcompositor, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/API/gtk3 -> /usr
 /src/debug/webkitgtk/2.36.5-r0/build/WebKit2Gtk/Headers/webkit2gtk-4.0/webkit2, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/API -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/API, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/page/scrolling/nicosia -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/page/scrolling/nicosia, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/svg -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/svg, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/debugger -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/debugger, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/freetype -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore
 /platform/graphics/freetype, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/dom/messageports -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/dom/messageports, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/model-element -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/model-element, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/GPU/webrtc -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/mediarecorder, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/permissions -> /usr/src/debug/webkitgtk/2.36.5-r0/webk
 itgtk-2.36.5/Source/WebCore/Modules/permissions, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/crypto -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/crypto, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/mediastream -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/mediastream, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/UserContent -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/UserContent, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/src/compiler/preprocessor -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/src/compiler/preprocessor, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Sourc
 e/WebKit/Shared/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/Notifications -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Notifications, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/InjectedBundle/API/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/InjectedBundle/API/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/UserContent -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/UserContent, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/image-decoders/webp -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.
 5/Source/WebCore/platform/image-decoders/webp, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/accessibility/atspi -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/accessibility/atspi, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/include/EGL -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/include/EGL, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/filesystemaccess -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/filesystemaccess, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/PAL/Headers/pal/text -> /usr/src/debug/webkitgtk/2.36.5-r0/build/PAL/Headers/pal/text, directory renamed /u
 sr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/image-decoders/gif -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/image-decoders/gif, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/inspector/agents/worker -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/inspector/agents/worker, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/beacon -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/beacon, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/wasm -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/wasm, directory renamed /usr/src/debug/we
 bkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/html/forms -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/html/forms, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Inspector/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Inspector/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf/linux -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf/linux, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebDriver -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebDriver, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/JavaScriptCore/DerivedSources -> /usr/src/debug/webkitgtk/2.36.5-r0/build/JavaScriptCore/DerivedSources, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/InjectedBundle/API -> /usr/src/debug/webkitgtk/2.36.5-r0/webkit
 gtk-2.36.5/Source/WebKit/WebProcess/InjectedBundle/API, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/PAL/pal/system/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/PAL/pal/system/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/soup -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/soup, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Authentication -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Authentication, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/workers -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/workers, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Media -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Media, direc
 tory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/runtime -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/runtime, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/filters -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/filters, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebDriver/soup -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebDriver/soup, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/PAL/Headers/pal/crypto/gcrypt -> /usr/src/debug/webkitgtk/2.36.5-r0/build/PAL/Headers/pal/crypto/gcrypt, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebPro
 cess/Storage -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Storage, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/profiler -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/profiler, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/speech -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/speech, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf/unicode -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf/unicode, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/text/enchant -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/text/enchant, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/inspector/agents -> /usr/src/debug/webkitgtk/2.36.5-r0/we
 bkitgtk-2.36.5/Source/JavaScriptCore/inspector/agents, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/model-element/dummy -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/model-element/dummy, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/html/track -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/html/track, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WebKit2Gtk/DerivedSources/webkit -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WebKit2Gtk/DerivedSources/webkit, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/GPU/media -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/GPU/media, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WebKit2Gtk/DerivedSources -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WebKit2Gtk/DerivedSources, directory renamed /usr/src/deb
 ug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/inspector/agents -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/inspector/agents, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebDriver/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebDriver/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WTF/Headers/wtf/threads -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WTF/Headers/wtf/threads, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/InjectedBundle -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/InjectedBundle, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/rendering/mathml -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/rendering/mathml, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/editing -> /usr/src/debug/webkitgtk/
 2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/editing, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/rendering/shapes -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/rendering/shapes, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/xdg -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/xdg, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/PAL/Headers/pal/crypto/tasn1 -> /usr/src/debug/webkitgtk/2.36.5-r0/build/PAL/Headers/pal/crypto/tasn1, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WebCore/PrivateHeaders/WebCore -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WebCore/PrivateHeaders/WebCore, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/bridge -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/bridge, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source
 /WebCore/Modules/websockets -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/websockets, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/API/c/cairo -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/API/c/cairo, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebDriver/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebDriver/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/Databases -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Databases, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/web-locks -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/web-locks, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf/generic -> /usr/src/debug/webkitgtk/2.36.5-r
 0/webkitgtk-2.36.5/Source/WTF/wtf/generic, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/svg/properties -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/svg/properties, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/indexeddb/shared -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/indexeddb/shared, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/API/C -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/API/C, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Downloads -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Downloads, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/Authentication -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/
 Authentication, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/JavaScriptCore/DerivedSources/yarr -> /usr/src/debug/webkitgtk/2.36.5-r0/build/JavaScriptCore/DerivedSources/yarr, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/generic -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/generic, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WTF/Headers/wtf/text/icu -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WTF/Headers/wtf/text/icu, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/GPUProcess/graphics -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/GPUProcess/graphics, directory renamed /usr/src/de
 bug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/src/compiler/translator -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/src/compiler/translator, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/loader/archive/mhtml -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/loader/archive/mhtml, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Shared/Databases/IndexedDB -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Shared/Databases/IndexedDB, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Notifications -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Notifications, direct
 ory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/WebsiteData/soup -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/WebsiteData/soup, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WTF/Headers/wtf/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WTF/Headers/wtf/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/DerivedSources/WebKit -> /usr/src/debug/webkitgtk/2.36.5-r0/build/DerivedSources/WebKit, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/nicosia -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/nicosia, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/include/KHR -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/include/KHR, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProc
 ess/Downloads -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/Downloads, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/workers/service/context -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/workers/service/context, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/calc -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/calc, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/adwaita -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/adwaita, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/crypto/parameters -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/crypto/parameters, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/Automation/gtk -> /usr/s
 rc/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/Automation/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/highlight -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/highlight, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/cookie-consent -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/cookie-consent, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/InjectedBundle/DOM -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/InjectedBundle/DOM, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/Platform/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/Platform/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/PAL/Headers/pal/system -> /usr/src/debug/webkitgtk/2.36.5-r0/b
 uild/PAL/Headers/pal/system, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/Automation -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Automation, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/editing/gtk -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/editing/gtk, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops/apple -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops/apple, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/bytecompiler -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/bytecompiler, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/html -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36
 .5/Source/WebCore/html, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/WebStorage -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/WebStorage, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/inspector -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/inspector, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/rendering/updating -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/rendering/updating, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/PAL/pal/crypto/tasn1 -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/PAL/pal/crypto/tasn1, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf/text -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf/text, directory renamed /usr/src/debug/
 webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/cache -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/cache, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/cache -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/cache, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/audio -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/audio, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/Cookies/soup -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/Cookies/soup, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WTF/wtf/text/unix -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf/text/unix, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WebKit2Gtk/Headers/
 webkit2gtk-webextension/webkitdom -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WebKit2Gtk/Headers/webkit2gtk-webextension/webkitdom, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/mediarecorder -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/GPU/webrtc, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/transforms -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/transforms, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/mediacontrols -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/mediacontrols, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/glib -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/glib, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.3
 6.4/Source/WTF/wtf/persistence -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf/persistence, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/UIProcess/geoclue -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/UIProcess/geoclue, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/worklets -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/worklets, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/PAL/pal/crypto/gcrypt -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/PAL/pal/crypto/gcrypt, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/workers/shared/context -> /usr/src/debug/webkitgtk/2.36.5-r0
 /webkitgtk-2.36.5/Source/WebCore/workers/shared/context, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/mediasource -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/mediasource, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/JavaScriptCore/inspector -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/JavaScriptCore/inspector, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/Plugins -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/Plugins, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops/gl -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops/gl, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/nicosia/texma
 p -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/nicosia/texmap, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/crypto/gcrypt -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/crypto/gcrypt, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/loader/appcache -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/loader/appcache, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/filters/software -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/filters/software, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/InjectedBundle/API/glib/DOM -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/InjectedBundle/API/glib/DOM, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgt
 k-2.36.4/Source/WTF/wtf/unicode/icu -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WTF/wtf/unicode/icu, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/ServiceWorker -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/ServiceWorker, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/Modules/entriesapi -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/Modules/entriesapi, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/NetworkProcess/Cookies -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/NetworkProcess/Cookies, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/loader/archive -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/loader/archive, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/p
 latform/mock -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/mock, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WTF/Headers/wtf/linux -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WTF/Headers/wtf/linux, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/loader/icon -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/loader/icon, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/build/WebKit2Gtk/DerivedSources/webkit2 -> /usr/src/debug/webkitgtk/2.36.5-r0/build/WebKit2Gtk/DerivedSources/webkit2, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebKit/WebProcess/WebPage -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebKit/WebProcess/WebPage, directory renamed /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/graphics/displaylists -> /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/graphics/dis
 playlists, removed "/usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/ResourceRequestSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/ResourceHandleSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/ResourceResponseSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/WebKitFormDataInputStream.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/SoupNetworkSession.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/ResourceRequest.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/URLSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/ResourceResponse.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/GU
 niquePtrSoup.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/SoupNetworkSession.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/CredentialSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/CookieStorageSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/CertificateInfoSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/WebKitFormDataInputStream.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/URLSoup.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/AuthenticationChallengeSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/SoupVersioning.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/SocketSt
 reamHandleImpl.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/ResourceErrorSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/CertificateInfo.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/CredentialSoup.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/SynchronousLoaderClientSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/CookieSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/AuthenticationChallenge.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/SoupNetworkProxySettings.h /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/NetworkStorageSessionSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/netwo
 rk/soup/CredentialStorageSoup.cpp /usr/src/debug/webkitgtk/2.36.4-r0/webkitgtk-2.36.4/Source/WebCore/platform/network/soup/ResourceError.h", added "/usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/CredentialSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/SoupNetworkSession.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/AuthenticationChallenge.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/NetworkStorageSessionSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/WebKitAutoconfigProxyResolver.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/SynchronousLoaderClientSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/ResourceHandleSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgt
 k-2.36.5/Source/WebCore/platform/network/soup/URLSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/ResourceRequest.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/SoupVersioning.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/CookieSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/WebKitFormDataInputStream.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/CredentialStorageSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/SocketStreamHandleImpl.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/CookieStorageSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/GUniquePtrSoup.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Sourc
 e/WebCore/platform/network/soup/URLSoup.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/CertificateInfo.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/ResourceError.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/AuthenticationChallengeSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/WebKitAutoconfigProxyResolver.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/WebKitFormDataInputStream.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/ResourceResponse.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/ResourceErrorSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/CertificateInfoSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.
 5/Source/WebCore/platform/network/soup/SoupNetworkSession.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/ResourceRequestSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/CredentialSoup.h /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/ResourceResponseSoup.cpp /usr/src/debug/webkitgtk/2.36.5-r0/webkitgtk-2.36.5/Source/WebCore/platform/network/soup/SoupNetworkProxySettings.h"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PV changed from "2.36.4" to "2.36.5"
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PKGSIZE changed from 78883755 to 78891947 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PKGV changed from 2.36.4 [default] to 2.36.5 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libwebkit2gtk-4.0.so.37.56.8 /usr/lib/libjavascriptcoregtk-4.0.so.18.20.8", added "/usr/lib/libwebkit2gtk-4.0.so.37.56.9 /usr/lib/libjavascriptcoregtk-4.0.so.18.20.9"
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PV changed from "2.36.4" to "2.36.5"

--===============4545487028202098188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 63 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-f8e7e9bdadbe5a619a816ba74342e4ea4fd3292e"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8e7e9bdadbe5a619a816ba74342e4ea4fd3292e"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 103 Local 12 Mirrors 0 Missed 91 Current 589 (11% match, 86% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 672 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1492 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1676 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_fetch)
NOTE: Running task 1858 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_write_config)
NOTE: Running task 1861 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1880 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: Running task 1938 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_fetch)
NOTE: Running task 1939 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 1940 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1941 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1942 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1944 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_fetch)
NOTE: Running task 1945 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 1978 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 1979 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1980 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 1982 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 1983 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 1984 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_fetch)
NOTE: Running task 1985 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 1986 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: Running task 1987 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 1988 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_fetch)
NOTE: Running task 2018 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_fetch)
NOTE: Running task 2068 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 2069 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 2070 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_write_config)
NOTE: Running task 2071 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: Running task 2072 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Started
NOTE: Running task 2124 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 2126 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_unpack)
NOTE: Running task 2127 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Started
NOTE: recipe vala-0.56.2-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Started
NOTE: recipe vala-0.56.2-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 2128 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running task 2129 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: Running task 2130 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.8.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: Running task 2131 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_unpack)
NOTE: recipe webkitgtk-2.36.5-r0: task do_fetch: Started
NOTE: Running task 2132 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2133 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2134 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libnotify-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2135 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: Running task 2136 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_unpack)
NOTE: Running task 2137 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2138 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_fetch: Succeeded
NOTE: recipe iso-codes-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2139 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: recipe libnotify-0.8.0-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: Running task 2140 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2141 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 2142 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: Running task 2143 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: Running task 2144 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_unpack)
NOTE: Running task 2145 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2146 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Started
NOTE: Running task 2147 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2148 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2149 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_unpack)
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: Running task 2150 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.2-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2151 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2152 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Started
NOTE: Running task 2153 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2154 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2155 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: Running task 2156 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2157 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2158 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: Running task 2160 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: recipe vala-0.56.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_unpack: Started
NOTE: Running task 2161 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: Running task 2162 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: Running task 2163 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2164 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2165 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2166 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libnotify-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 2167 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2168 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: Running task 2169 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: Running task 2170 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2171 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2172 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: Running task 2173 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_patch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2174 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2175 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_patch: Started
NOTE: Running task 2176 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: Running task 2177 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2178 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2179 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2180 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: Running task 2181 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2182 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2183 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: Running task 2184 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2185 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2186 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: Running task 2187 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_patch)
NOTE: Running task 2188 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2189 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 2190 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2191 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: Running task 2192 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2193 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.2-r0: task do_patch: Started
NOTE: Running task 2194 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 2195 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2196 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2197 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2198 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2199 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2200 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2201 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_configure)
NOTE: Running task 2202 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e2665d5f03cb6fc520c75cd2518639a763c662566b293b9f3dcb58f2c6be1e08
NOTE: recipe vala-0.56.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2227 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2228 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2233 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2234 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2235 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2236 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2237 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_configure)
NOTE: recipe libnotify-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2238 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2239 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2240 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: Running task 2241 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_configure)
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2242 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe vala-0.56.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2243 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Started
NOTE: Running task 2244 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 309b648185e6cc4f5620a0968a1a475507070ebf20b3816503c836a3a5695faf
NOTE: recipe libnotify-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2255 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2256 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe libnotify-0.8.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_unpack: Succeeded
NOTE: Running task 2257 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_patch)
NOTE: recipe webkitgtk-2.36.5-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2258 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe webkitgtk-2.36.5-r0: task do_patch: Succeeded
NOTE: Running task 2259 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2260 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_generate_toolchain_file)
NOTE: Running task 2261 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_populate_lic)
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_populate_lic unihash changed to 4cee016c16de66a012c525d2b11633472df24b644a28608805703e17e4833e31
NOTE: recipe webkitgtk-2.36.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2262 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2263 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2264 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2265 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2266 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe libnotify-0.8.0-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2267 of 2386 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Failed
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2267 tasks of which 2135 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libwpe/1.12.0-r0/temp/log.do_packagedata.2459164
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata) failed with exit code '1'

--===============4545487028202098188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1660 targets, 49 skipped, 0 masked, 0 errors.
Removing 114 recipes from the core2-32 sysroot...done.
Removing 113 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f8e7e9bdadbe5a619a816ba74342e4ea4fd3292e"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8e7e9bdadbe5a619a816ba74342e4ea4fd3292e"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 459 Local 364 Mirrors 0 Missed 95 Current 222 (79% match, 86% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 223 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 226 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 876 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_fetch)
NOTE: Running task 941 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_write_config)
NOTE: Running task 942 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 945 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: Running task 949 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 950 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 951 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 953 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 954 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_fetch)
NOTE: Running task 955 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 956 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_fetch)
NOTE: Running task 957 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 961 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 962 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 963 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: Running task 964 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 965 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 966 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_fetch)
NOTE: Running task 967 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 968 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 969 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 970 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_fetch)
NOTE: Running task 977 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_fetch)
NOTE: Running task 982 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1003 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 1004 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: Running task 1005 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: Running task 1006 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 1007 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_write_config)
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Started
NOTE: recipe vala-0.56.2-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe vala-0.56.2-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: Running task 1040 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_unpack)
NOTE: Running task 1042 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1043 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 1044 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 1045 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_unpack)
NOTE: Running task 1046 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: Running task 1047 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_unpack)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 1048 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_fetch: Started
NOTE: Running task 1049 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Started
NOTE: Running task 1050 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 1051 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 1052 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: Running task 1053 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Succeeded
NOTE: Running task 1054 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_unpack)
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.0-r0: task do_write_config: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: Running task 1055 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: Running task 1056 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1061 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: Running task 1062 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_fetch: Succeeded
NOTE: Running task 1063 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running setscene task 331 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata_setscene)
NOTE: Running task 1064 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running setscene task 333 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_populate_sysroot_setscene)
NOTE: Running task 1069 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: recipe vala-0.56.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1070 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1071 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: Running task 1072 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1074 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: Running task 1075 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: Running task 1076 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1077 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1078 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1079 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: Running task 1080 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: Running task 1085 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 1086 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: Running task 1087 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: Running task 1088 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: Running task 1093 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 1094 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1095 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe libnotify-0.8.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: Running task 1096 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: Running task 1097 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1098 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 1099 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1100 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 1101 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_patch)
NOTE: Running task 1102 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1103 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1104 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1105 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1106 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1107 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1108 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: Running task 1109 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_unpack: Succeeded
NOTE: Running task 1110 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: Running task 1111 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1112 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1113 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1114 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1115 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 341 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1120 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1121 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.2-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1122 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_deploy_source_date_epoch)
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 1137 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 376 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running task 1148 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 404 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 409 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 418 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.112.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.112.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.112-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 452 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 453 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.112-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 455 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.112-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.112-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1265 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 501 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 505 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running task 1288 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1289 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 517 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1315 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1316 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running task 1326 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1331 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1332 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1333 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_generate_toolchain_file)
NOTE: Running task 1334 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1335 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe webkitgtk-2.36.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_populate_lic: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe webkitgtk-2.36.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_populate_lic unihash changed to 4cee016c16de66a012c525d2b11633472df24b644a28608805703e17e4833e31
NOTE: recipe webkitgtk-2.36.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1360 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 555 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 572 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 579 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1428 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5a89c44da463ec41c5f401958d01582fe28bb9a0d7b3e33c212f155080793543
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1936 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2010 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2078 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2101 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2118 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2119 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2120 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2122 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2123 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2124 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2146 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2147 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2148 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2149 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2172 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2174 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2104397955e4af8dee6de52beaac2cb17ebfc96735377f3f545c0b373f3382b2
NOTE: Running task 2196 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2197 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2208 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2209 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2210 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2211 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2212 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: Running task 2213 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_configure)
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: Running task 2214 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2215 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe vala-0.56.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2216 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: Running task 2217 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_configure)
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2218 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Started
NOTE: recipe vala-0.56.2-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2219 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_configure)
NOTE: recipe libnotify-0.8.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2220 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2221 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: Running task 2222 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2224 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2225 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2226 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_compile)
NOTE: recipe libnotify-0.8.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 2227 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2228 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2229 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: Running task 2230 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 2231 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2232 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2233 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 2234 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2235 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2236 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_install)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2237 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2238 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_package)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2239 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_install)
NOTE: recipe libnotify-0.8.0-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2240 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 2241 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Succeeded
NOTE: Running task 2242 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: Running task 2243 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.0-r0: task do_install: Succeeded
NOTE: Running task 2244 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_populate_sysroot)
NOTE: Running task 2245 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_package)
NOTE: recipe libnotify-0.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2246 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_compile)
NOTE: recipe libnotify-0.8.0-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Started
NOTE: Running task 2247 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2248 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libnotify-0.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_configure: Succeeded
NOTE: Running task 2249 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2250 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2251 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2252 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2253 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2254 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2255 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2256 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2257 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libnotify-0.8.0-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2258 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_packagedata)
NOTE: Running task 2259 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2260 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libnotify-0.8.0-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libxslt-1.1.35-r0: task do_compile: Succeeded
NOTE: Running task 2261 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2262 of 2351 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libnotify-0.8.0-r0: task do_packagedata: Failed
NOTE: recipe libxslt-1.1.35-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_install: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_compile: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2262 tasks of which 2082 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libnotify-0.8.0-r0 do_packagedata: QA Issue: Package version for package libnotify-src went backwards which would break package feeds (from 0:0.8.1-r0 to 0:0.8.0-r0) [version-going-backwards]
ERROR: libnotify-0.8.0-r0 do_packagedata: QA Issue: Package version for package libnotify-dbg went backwards which would break package feeds (from 0:0.8.1-r0 to 0:0.8.0-r0) [version-going-backwards]
ERROR: libnotify-0.8.0-r0 do_packagedata: QA Issue: Package version for package libnotify-staticdev went backwards which would break package feeds (from 0:0.8.1-r0 to 0:0.8.0-r0) [version-going-backwards]
ERROR: libnotify-0.8.0-r0 do_packagedata: QA Issue: Package version for package libnotify-dev went backwards which would break package feeds (from 0:0.8.1-r0 to 0:0.8.0-r0) [version-going-backwards]
ERROR: libnotify-0.8.0-r0 do_packagedata: QA Issue: Package version for package libnotify-doc went backwards which would break package feeds (from 0:0.8.1-r0 to 0:0.8.0-r0) [version-going-backwards]
ERROR: libnotify-0.8.0-r0 do_packagedata: QA Issue: Package version for package libnotify-locale went backwards which would break package feeds (from 0:0.8.1-r0 to 0:0.8.0-r0) [version-going-backwards]
ERROR: libnotify-0.8.0-r0 do_packagedata: QA Issue: Package version for package libnotify went backwards which would break package feeds (from 0:0.8.1-r0 to 0:0.8.0-r0) [version-going-backwards]
ERROR: libnotify-0.8.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libnotify/0.8.0-r0/temp/log.do_packagedata.2665035
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_packagedata) failed with exit code '1'

--===============4545487028202098188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-f8e7e9bdadbe5a619a816ba74342e4ea4fd3292e"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f8e7e9bdadbe5a619a816ba74342e4ea4fd3292e"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 107 Local 12 Mirrors 0 Missed 95 Current 595 (11% match, 86% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 682 of 702 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1503 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe iso-codes-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1686 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_fetch)
NOTE: Running task 1870 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_write_config)
NOTE: Running task 1873 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1892 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: Running task 1950 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 1951 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_fetch)
NOTE: Running task 1952 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1953 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_fetch)
NOTE: Running task 1954 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1955 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1956 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1958 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 1993 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 1994 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_fetch)
NOTE: Running task 1995 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_fetch)
NOTE: Running task 1996 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 1997 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 1998 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1999 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_fetch)
NOTE: Running task 2000 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_fetch)
NOTE: Running task 2001 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_fetch)
NOTE: Running task 2002 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 2032 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_fetch)
NOTE: Running task 2059 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 2094 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 2095 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: Running task 2096 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_write_config)
NOTE: Running task 2097 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_write_config)
NOTE: Running task 2098 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Started
NOTE: Running task 2151 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: Running task 2153 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_unpack)
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Started
NOTE: Running task 2154 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2155 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2156 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: Running task 2157 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Started
NOTE: Running task 2158 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2159 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2160 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2161 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running task 2162 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Started
NOTE: recipe vala-0.56.2-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: Running task 2163 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_unpack)
NOTE: recipe enchant2-2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 2164 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Started
NOTE: Running task 2165 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: Running task 2166 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 2167 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2168 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Started
NOTE: Running task 2169 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_unpack)
NOTE: Running task 2170 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2171 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.35-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: Running task 2172 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: recipe libsecret-0.20.5-r0: task do_fetch: Succeeded
NOTE: Running task 2173 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_unpack)
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2174 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 2175 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_write_config: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Started
NOTE: recipe libsecret-0.20.5-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2176 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_unpack)
NOTE: Running task 2177 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_unpack)
NOTE: Running task 2178 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_unpack)
NOTE: Running task 2179 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 2180 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_unpack)
NOTE: Running task 2181 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Started
NOTE: Running task 2182 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2183 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2184 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2185 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Started
NOTE: Running task 2186 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.2-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: Running task 2187 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe vala-0.56.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.0-r0: task do_unpack: Started
NOTE: Running task 2188 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Started
NOTE: Running task 2189 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_patch)
NOTE: Running task 2190 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2191 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2192 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2193 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2194 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 2195 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: recipe libnotify-0.8.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2196 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: Running task 2197 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_patch)
NOTE: recipe libsecret-0.20.5-r0: task do_unpack: Succeeded
NOTE: Running task 2198 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: Running task 2199 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2200 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2201 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2202 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 2203 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: Running task 2204 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2205 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_patch)
NOTE: Running task 2206 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2207 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_patch: Started
NOTE: Running task 2208 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2209 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxslt-1.1.35-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: Running task 2210 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2211 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.8.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2212 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.5-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: Running task 2213 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2214 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2215 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2216 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2217 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_patch)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2218 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: Running task 2219 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2220 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2221 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 2222 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.35-r0: task do_patch: Succeeded
NOTE: Running task 2223 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2224 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 2225 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2226 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe enchant2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2227 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.2-r0: task do_patch: Started
NOTE: Running task 2228 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2229 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2230 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2231 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: Running task 2232 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cc1926fa9d57f281491422a9bd2d4f6e330abfd3c21cd9108fee7200caeb4829
NOTE: Running task 2257 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: Running task 2258 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_configure)
NOTE: Running task 2259 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe libxslt-1.1.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2260 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2261 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2262 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: Running task 2263 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: Running task 2264 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2266 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2267 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe libnotify-0.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2268 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2272 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.2.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2273 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe vala-0.56.2-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2274 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2275 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1006c1302494e77886f06831cbd7fe5cb6aa2f4bc4e883ca4ef9716f85e10d63
NOTE: recipe libnotify-0.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2286 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_configure)
NOTE: Running task 2287 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe libnotify-0.8.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_unpack: Succeeded
NOTE: Running task 2288 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_patch)
NOTE: recipe webkitgtk-2.36.5-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2289 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: Running task 2291 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2292 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_generate_toolchain_file)
NOTE: Running task 2293 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.36.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.36.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe webkitgtk-2.36.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb:do_populate_lic unihash changed to 4cee016c16de66a012c525d2b11633472df24b644a28608805703e17e4833e31
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2294 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2295 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe webkitgtk-2.36.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2296 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 2298 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe libnotify-0.8.0-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2299 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.8.0.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe libnotify-0.8.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2300 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 2301 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 2302 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Failed
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.2-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_configure: Succeeded
NOTE: recipe libnotify-0.8.0-r0: task do_compile: Succeeded
NOTE: recipe libxslt-1.1.35-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2302 tasks of which 2159 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.12.2-r0 to 0:1.12.0-r0) [version-going-backwards]
ERROR: libwpe-1.12.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libwpe/1.12.0-r0/temp/log.do_packagedata.2525764
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata) failed with exit code '1'

--===============4545487028202098188==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.36.4-2.36.5.patch"

RnJvbSBkMWU0MTcyMzUxYTliMDExYzY5YzYxOGQyNmJiNTE1OWUzMDdmZThmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwNDowNzoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
YmtpdGd0azogdXBncmFkZSAyLjM2LjQgLT4gMi4zNi41CgotLS0KIC4uLi93ZWJraXQve3dlYmtp
dGd0a18yLjM2LjQuYmIgPT4gd2Via2l0Z3RrXzIuMzYuNS5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zYXRvL3dlYmtpdC97d2Via2l0Z3RrXzIuMzYuNC5iYiA9PiB3ZWJraXRndGtfMi4z
Ni41LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJr
aXRndGtfMi4zNi40LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0a18yLjM2
LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXNhdG8v
d2Via2l0L3dlYmtpdGd0a18yLjM2LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC93ZWJraXRndGtfMi4zNi41LmJiCmluZGV4IGRmNGZmNjMxMjEuLmIzZmUzNTcwMTAgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi4zNi40LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi4zNi41LmJiCkBAIC0xNyw3
ICsxNyw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cud2Via2l0Z3RrLm9yZy9yZWxlYXNlcy8k
e0JQTn0tJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtV2hlbi1idWlsZGlu
Zy1pbnRyb3NwZWN0aW9uLWZpbGVzLWRvLW5vdC1xdW90ZS1DRkxBRy5wYXRjaCBcCiAgICAgICAg
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImI2YmViZTFmODVhNDc5ZDk2OGMxOWU0NGE0
NzA0NjIyZWY4Y2VmNjE2MzZhZDFiMjQwNmI3N2QxNmFlMmUyYTgiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDU1MzJmYTg4NGM5NDNkYzQ4ZjE5MTE0NzNkZDY2M2FiYTQwN2EzYjM1Y2FhN2IwNGJh
YzE0MTliNDFlNTkwOCIKIAogaW5oZXJpdCBjbWFrZSBwa2djb25maWcgZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uIHBlcmxuYXRpdmUgZmVhdHVyZXNfY2hlY2sgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVu
IGd0ay1kb2MKIAotLSAKMi4zMS4xCgo=

--===============4545487028202098188==--

