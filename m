Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E7CC77B62
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:31 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.12140.1678895725213396804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ArwKF6ZK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010186e5fbc247-4350ce22-81f9-4c5d-8640-78816b245ef8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P1kjdrTdGNTLGhNnl9nkaYWrN6uqT8KY5GsXynDTk2k=;
	b=ArwKF6ZKGDqX0M1hhxYJIBnH98MEa552VO8DNmYYOGC3rarvyTkqhpiqrPlhl2hz
	6p107128RJix2la66LPsmhkB28M/kqmYsdBJXtDSen+1sO7250XnH3b6rLQUR8OI35A
	gHS76DP3VUl6qrjXQLd5WICC4fL+bynVe8ZnhCA8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P1kjdrTdGNTLGhNnl9nkaYWrN6uqT8KY5GsXynDTk2k=;
	b=a2Tox/Kr+yra3bs2G6dNPzftc7Z+/T8Ud3R4eYvIoOfMSI3OBsQlj6haZ572t257
	4+PO7HSOTm18wPEJ0pU2EMEKqWSD5yWLGKeegduZ2aZrc6UmfZvYppZx1LdLtQwUIEL
	Nbp2KxAe0mapHhyfLbEgcz9q91j5xty+Bj/1MVlk=
Content-Type: multipart/mixed; boundary="===============9138371476899334662=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.10.1 SUCCEEDED
Message-ID: <01010186e5fbc247-4350ce22-81f9-4c5d-8640-78816b245ef8-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178635

--===============9138371476899334662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk4* to *4.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.10.0-4.10.1.patch
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
--===============9138371476899334662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 56 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-abacd6e418e82dc34e102c5e155a2216eba9d64e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:abacd6e418e82dc34e102c5e155a2216eba9d64e"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 138 Local 16 Mirrors 0 Missed 122 Current 695 (11% match, 85% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 805 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1531 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1824 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1853 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1877 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_fetch)
NOTE: Running task 1901 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1920 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 1923 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 1924 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1925 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_fetch)
NOTE: Running task 1926 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1985 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 2000 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_patch)
NOTE: Running task 2018 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 2019 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2040 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2045 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 2087 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 2088 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: Running task 2163 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2164 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: Running task 2175 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2176 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_fetch: Succeeded
NOTE: Running task 2187 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2188 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2189 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2190 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_fetch: Started
NOTE: Running task 2209 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: Running task 2210 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_unpack)
NOTE: Running task 2211 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2212 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 2213 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 2214 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.88.1-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2215 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 2216 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 2217 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: Running task 2218 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2219 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2220 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2221 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2222 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: Running task 2223 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: Running task 2256 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2269 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: Running task 2270 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: Running task 2290 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 2291 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2292 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2293 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2296 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: Running task 2297 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 2298 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2299 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2300 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: Running task 2306 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 2330 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: Running task 2338 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2340 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: recipe vala-0.56.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2354 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe curl-7.88.1-r0: task do_unpack: Started
NOTE: Running task 2355 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2365 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_fetch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2378 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: Running task 2379 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2380 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 2385 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: Running task 2440 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: Running task 2441 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 2475 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: Running task 2496 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 2513 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_write_config)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: Running task 2628 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: Running task 2629 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2630 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: Running task 2631 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 2632 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2633 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2634 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: Running task 2635 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: Running task 2636 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2637 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2638 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: Running task 2639 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: Running task 2640 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: Running task 2641 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: Running task 2642 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2643 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: Running task 2644 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2645 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 2646 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2647 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: Running task 2648 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_create_wrappers)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2649 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 2650 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2651 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: Running task 2652 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_gen_targets)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2653 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: Running task 2654 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2655 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2656 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2657 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2658 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: Running task 2659 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: Running task 2660 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2661 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 2662 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe curl-7.88.1-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2663 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2664 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_patch)
NOTE: Running task 2665 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2666 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: Running task 2667 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2668 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2669 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2670 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 2671 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2672 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2673 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: Running task 2674 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2675 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.4-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2676 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe curl-7.88.1-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.88.1-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: Running task 2677 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2678 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2679 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 2680 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2681 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2682 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: Running task 2683 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 2684 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_patch: Started
NOTE: Running task 2685 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2686 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_patch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2687 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2688 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2689 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2690 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2691 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: Running task 2692 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 2693 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 2694 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: Running task 2695 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2696 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2697 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2698 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2699 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2700 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2701 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2fd978f842589a9292ce3577cfe1ab7c53ed8d97f867e72db23eaab6315cd0df
NOTE: Running task 2715 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2720 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 2721 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2723 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2724 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2725 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2726 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: Running task 2727 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.4-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2736 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 2737 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2738 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running task 2739 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 8c9163c9df5aab90477d2fc57e5646c02f7ff0089ef42ac2f71d262b21c2bfa0
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2752 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2753 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2754 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2755 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_patch)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2756 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2757 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2758 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2759 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2760 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_configure)
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 2761 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic unihash changed to 10de89ca5718493f2dbbdfe938f79ca6291232312b05f7a87898b8ba03490e64
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 2762 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 2763 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 2764 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2765 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 2766 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2767 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 2768 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: Running task 2769 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: Running task 2770 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2771 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2772 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2773 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2774 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2775 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2776 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Succeeded
NOTE: Running task 2777 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2778 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2779 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2780 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: Running task 2781 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2782 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2783 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 2784 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_configure: Succeeded
NOTE: Running task 2785 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: Running task 2786 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_compile)
NOTE: Running task 2787 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe vala-0.56.4-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2788 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2789 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2790 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2791 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2792 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2793 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: Running task 2794 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2795 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2796 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2797 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2798 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2799 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2800 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2801 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2802 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: Running task 2803 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 2804 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: Running task 2805 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2806 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2807 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2808 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2809 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2810 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: Running task 2811 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2812 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2813 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2814 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2815 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2816 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2817 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2818 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2819 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2820 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2821 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2822 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2823 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2824 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2825 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2826 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2827 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2828 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2829 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2830 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2831 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2832 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2833 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2834 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2835 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2836 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2837 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2838 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2839 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2840 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2841 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 2842 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: Running task 2843 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: Running task 2844 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2845 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 2846 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 2847 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2848 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Started
NOTE: recipe vala-0.56.4-r0: task do_compile: Succeeded
NOTE: Running task 2849 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_install)
NOTE: recipe vala-0.56.4-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Succeeded
NOTE: Running task 2850 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Succeeded
NOTE: Running task 2851 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package)
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2857 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Succeeded
NOTE: Running task 2858 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_install)
NOTE: recipe vala-0.56.4-r0: task do_install: Succeeded
NOTE: Running task 2859 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_populate_sysroot)
NOTE: Running task 2860 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_package)
NOTE: recipe libstd-rs-1.67.1-r0: task do_install: Started
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_package: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_install: Succeeded
NOTE: Running task 2861 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_populate_sysroot)
NOTE: Running task 2862 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_package)
NOTE: recipe libstd-rs-1.67.1-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_package: Started
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2863 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2864 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2865 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2866 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2867 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2868 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libstd-rs-1.67.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2869 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2870 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2871 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe libstd-rs-1.67.1-r0: task do_package: Succeeded
NOTE: Running task 2872 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.4-r0: task do_package: Succeeded
NOTE: Running task 2873 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2874 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: Running task 2875 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2876 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2877 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2878 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Succeeded
NOTE: Running task 2879 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Failed
NOTE: recipe libical-3.0.16-r0: task do_compile: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2879 tasks of which 2601 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata
Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gtk+3/3.24.36-r0/temp/log.do_packagedata.3765914
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata) failed with exit code '1'

--===============9138371476899334662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PKGSIZE changed from 62348 to 71808 (+15%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGSIZE changed from 128684 to 145527 (+13%)
packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1000.0", added "/usr/lib/libgtk-4.so.1.1000.1"
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1000.0 to libgtk-4.so.1.1000.1
  /usr/lib/libgtk-4.so.1.1000.0 moved to /usr/lib/libgtk-4.so.1.1000.1

--===============9138371476899334662==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.10.0-4.10.1.patch"

RnJvbSA4Mzc5ODA5MThhNTYyMDdiMDI2ZDFmYWYzMjFmNzgwODczZWI5ZDRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTE6MjM6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMTAuMCAtPiA0LjEwLjEKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4xMC4wLmJiID0+IGd0azRfNC4xMC4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMTAuMC5iYiA9PiBndGs0XzQuMTAuMS5iYn0gKDk4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAuMC5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMC4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAuMS5iYgppbmRleCBkNThmZTE0OWVjLi5k
Mjg2MzBhZDBiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAuMS5iYgpAQCAtMzcs
NyArMzcsNyBAQCBNQUpfVkVSID0gIiR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAy
KX0iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJndGstKD9QPHB2ZXI+XGQrXC4oXGQqWzAyNDY4
XSkrKFwuXGQrKSspXC50YXIueHoiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2Z0cC5nbm9tZS5vcmcv
cHViL2dub21lL3NvdXJjZXMvZ3RrLyR7TUFKX1ZFUn0vZ3RrLSR7UFZ9LnRhci54eiIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4ZGMxZTdjM2IzYTQ2NzcyZjBmYTQxNmE4Y2EzZmQyMWQwZDBiM2Iw
M2ZiMzA3ZDJlNzMyN2ViZWU2OTYyNmU0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU4ZmNhYzA0
YmM3NzE1YjlkYTY2N2M5MTFhNWVlOGYyNjJlMjAwZDFkNmE1MGFkZjIzNjQ1Y2E4Y2ZjZDAzMTEi
CiAKIFMgPSAiJHtXT1JLRElSfS9ndGstJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============9138371476899334662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-abacd6e418e82dc34e102c5e155a2216eba9d64e"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:abacd6e418e82dc34e102c5e155a2216eba9d64e"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 134 Local 16 Mirrors 0 Missed 118 Current 689 (11% match, 85% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 795 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1521 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1812 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1841 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1865 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_fetch)
NOTE: Running task 1889 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1908 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 1911 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 1912 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_fetch)
NOTE: Running task 1913 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1914 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1973 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 1988 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_patch)
NOTE: Running task 2006 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 2007 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2028 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2033 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 2075 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: Running task 2144 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2145 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: Running task 2152 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2153 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2167 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_unpack)
NOTE: Running task 2168 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: Running task 2169 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 2170 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 2171 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2172 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: recipe curl-7.88.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: Running task 2173 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 2174 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_unpack)
NOTE: Running task 2175 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2176 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2177 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 2182 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2183 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 2184 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2185 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2217 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2218 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2219 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2231 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 2265 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 2272 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2273 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 2274 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 2275 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: Running task 2276 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2277 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running task 2299 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_unpack: Started
NOTE: Running task 2325 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2326 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: Running task 2327 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2333 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_fetch)
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 2346 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2347 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: recipe curl-7.88.1-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2383 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2384 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2385 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2393 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2409 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2410 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2412 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: Running task 2413 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 2447 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: Running task 2474 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2485 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_write_config)
NOTE: Running task 2492 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: Running task 2493 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2509 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2510 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2511 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: Running task 2549 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2550 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2551 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: Running task 2552 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_unpack)
NOTE: Running task 2553 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 2554 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: Running task 2555 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2556 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2599 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 2600 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 2608 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2616 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2617 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_create_wrappers)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: Running task 2618 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2619 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2620 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_gen_targets)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 2621 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: Running task 2622 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running task 2623 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2624 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: Running task 2625 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Started
NOTE: Running task 2626 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2627 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: Running task 2628 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: Running task 2629 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 2630 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2631 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Started
NOTE: Running task 2632 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: Running task 2633 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe curl-7.88.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2634 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2635 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.4-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2636 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_patch)
NOTE: Running task 2637 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 2638 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2639 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2640 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2641 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2642 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2643 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2644 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: Running task 2645 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2646 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2647 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.88.1-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2648 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.4-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 2649 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2650 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe curl-7.88.1-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2651 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2652 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2653 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_configure)
NOTE: Running task 2654 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2655 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: Running task 2656 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2657 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2658 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.88.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2659 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2660 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2661 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2662 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2663 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2664 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: Running task 2665 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe curl-7.88.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2666 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: Running task 2667 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2668 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 2669 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_configure)
NOTE: Running task 2670 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_compile)
NOTE: Running task 2671 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 57e05b1499454abd49dd45af1df120eadc692acf40aa62d7cc69ba8fcf025471
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: Running task 2685 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2690 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2692 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.4-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2701 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2702 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: Running task 2703 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2704 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: Running task 2705 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2706 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 2707 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2708 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6a240e84473ce5d69e3e5bb6e4806cca62ac409bd2721dac7f09fd6cb938d81c
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2721 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2722 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2723 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_patch)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running task 2724 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2725 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2726 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2727 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2728 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic unihash changed to 10de89ca5718493f2dbbdfe938f79ca6291232312b05f7a87898b8ba03490e64
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 2729 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_configure)
NOTE: Running task 2730 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 2731 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 2732 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2733 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2734 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 2735 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2736 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2737 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2738 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2739 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2740 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Succeeded
NOTE: Running task 2741 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2742 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2743 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2744 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2745 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2746 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 2747 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.4-r0: task do_configure: Succeeded
NOTE: Running task 2748 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_compile)
NOTE: recipe vala-0.56.4-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2749 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2750 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2751 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2752 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2753 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2754 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2755 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2756 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2757 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2758 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2759 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: Running task 2760 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: Running task 2761 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2762 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2763 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2764 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2765 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2766 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2767 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2768 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2769 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2770 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2771 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2772 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2773 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2774 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2775 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2776 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 2777 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2778 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install)
NOTE: Running task 2779 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2780 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2781 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: Running task 2782 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2783 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2784 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2785 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2786 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2787 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2788 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2789 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: Running task 2790 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2791 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2792 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2793 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2794 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2795 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2796 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2797 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2798 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2799 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2800 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2801 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: Running task 2802 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: Running task 2803 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2804 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2805 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2806 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 2807 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: Running task 2808 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2809 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2810 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 2811 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Succeeded
NOTE: Running task 2812 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Succeeded
NOTE: Running task 2813 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_compile)
NOTE: Running task 2814 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_install: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_install: Succeeded
NOTE: Running task 2815 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_populate_sysroot)
NOTE: Running task 2816 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_package)
NOTE: recipe libstd-rs-1.67.1-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Succeeded
NOTE: Running task 2817 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package)
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_compile: Succeeded
NOTE: Running task 2823 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_install)
NOTE: recipe vala-0.56.4-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2824 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_package: Succeeded
NOTE: Running task 2825 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_packagedata)
NOTE: recipe libstd-rs-1.67.1-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_install: Succeeded
NOTE: Running task 2826 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_populate_sysroot)
NOTE: Running task 2827 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_package)
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2828 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2829 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2830 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2831 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2832 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2833 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2834 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2835 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2836 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2837 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.4-r0: task do_package: Succeeded
NOTE: Running task 2838 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_packagedata)
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: Running task 2839 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2840 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Succeeded
NOTE: Running task 2841 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2842 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2843 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Failed
NOTE: recipe libical-3.0.16-r0: task do_compile: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2843 tasks of which 2577 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata
Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gtk+3/3.24.36-r0/temp/log.do_packagedata.3949363
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata) failed with exit code '1'

--===============9138371476899334662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gtk4/gtk4-dbg: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.1000.0", added "/usr/lib/.debug/libgtk-4.so.1.1000.1"
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 28338208 to 28367256 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-dev: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 13929559 to 13929842 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-doc: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PKGSIZE changed from 126085 to 126148 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PKGSIZE changed from 102060 to 102027 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PKGSIZE changed from 100824 to 101153 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PKGSIZE changed from 97459 to 97730 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PKGSIZE changed from 101931 to 101986 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PKGSIZE changed from 101411 to 101426 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PKGSIZE changed from 101177 to 101193 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PKGSIZE changed from 62348 to 71808 (+15%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PKGSIZE changed from 92119 to 92854 (+1%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PKGSIZE changed from 101487 to 101548 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PKGSIZE changed from 102394 to 102455 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGSIZE changed from 128684 to 145527 (+13%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PKGSIZE changed from 100135 to 100145 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PKGSIZE changed from 102120 to 102178 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PKGSIZE changed from 101445 to 101507 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PKGSIZE changed from 97952 to 97969 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PKGSIZE changed from 99016 to 99027 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PKGSIZE changed from 121566 to 121583 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-src: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 38151478 to 38173498 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1000.0", added "/usr/lib/libgtk-4.so.1.1000.1"
packages/core2-32-poky-linux/gtk4/gtk4: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4: PKGSIZE changed from 13403247 to 13411439 (+0%)
packages/core2-32-poky-linux/gtk4: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk/4.10/gtk-4.10.0.tar.xz" to "http://ftp.gnome.org/pub/gnome/sources/gtk/4.10/gtk-4.10.1.tar.xz"
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1000.0 to libgtk-4.so.1.1000.1
  /usr/lib/libgtk-4.so.1.1000.0 moved to /usr/lib/libgtk-4.so.1.1000.1

--===============9138371476899334662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1792 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1791 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-abacd6e418e82dc34e102c5e155a2216eba9d64e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:abacd6e418e82dc34e102c5e155a2216eba9d64e"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 137 Local 15 Mirrors 0 Missed 122 Current 700 (10% match, 85% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 809 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1531 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1830 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1871 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1895 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_fetch)
NOTE: Running task 1919 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1938 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 1941 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 1942 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1943 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1944 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_fetch)
NOTE: Running task 2003 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 2018 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_patch)
NOTE: Running task 2036 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2037 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 2058 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2063 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 2105 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 2106 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: Running task 2181 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2182 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2189 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2190 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2205 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2206 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 2207 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe curl-7.88.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: Running task 2208 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_unpack)
NOTE: Running task 2209 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 2210 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 2211 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 2212 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 2213 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2214 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2215 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 2216 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_unpack)
NOTE: Running task 2217 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2218 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 2219 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2244 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 2246 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2247 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: Running task 2248 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: Running task 2272 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 2275 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: Running task 2284 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: Running task 2285 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2286 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2312 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: Running task 2313 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 2314 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2315 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: Running task 2316 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2330 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2332 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2346 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: Running task 2369 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_unpack: Started
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 2370 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2380 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_fetch)
NOTE: Running task 2393 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: Running task 2394 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 2395 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe curl-7.88.1-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2419 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: Running task 2455 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: Running task 2456 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2457 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: Running task 2459 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: Running task 2490 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2491 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 2529 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 2531 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_write_config)
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: Running task 2566 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: Running task 2567 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: Running task 2597 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2598 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: Running task 2599 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: Running task 2631 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2632 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 2633 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: Running task 2634 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 2635 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: Running task 2649 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running task 2650 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2651 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 2652 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_unpack)
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: Running task 2660 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2661 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2662 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2663 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 2664 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: Running task 2665 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2666 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2667 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running task 2668 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_create_wrappers)
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 2669 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2670 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_gen_targets)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: Running task 2671 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2672 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2673 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: Running task 2674 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: Running task 2675 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: Running task 2676 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: Running task 2677 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2678 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2679 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2680 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: Running task 2681 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Started
NOTE: Running task 2682 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: Running task 2683 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2684 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe curl-7.88.1-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2685 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: Running task 2686 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2687 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2688 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2689 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 2690 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2691 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: Running task 2692 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.4-r0: task do_unpack: Succeeded
NOTE: Running task 2693 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2694 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2695 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2696 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2697 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2698 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2699 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2700 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2701 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_configure)
NOTE: recipe vala-0.56.4-r0: task do_patch: Started
NOTE: Running task 2702 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 2703 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2704 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: Running task 2705 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2706 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.88.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2707 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2708 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2709 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2710 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2711 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: Running task 2712 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2713 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2714 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: Running task 2715 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 2716 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2717 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2718 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: Running task 2719 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2720 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to eaf3c63a2d7616fe02c0eaebdb7f288f8e8723f59c959bf3069afcb602f96417
NOTE: Running task 2734 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2739 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2741 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2742 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2743 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: Running task 2744 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2753 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: Running task 2754 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: Running task 2755 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: Running task 2756 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to bc44602d23f5e90668311c9434de006378849ba78d836815fdaf065c3fe5268c
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2769 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2770 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2771 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: Running task 2772 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2773 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2774 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Started
NOTE: Running task 2775 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2776 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running task 2777 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic unihash changed to 10de89ca5718493f2dbbdfe938f79ca6291232312b05f7a87898b8ba03490e64
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 2778 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2779 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_configure)
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 2780 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 2781 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 2782 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2783 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 2784 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2785 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 2786 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: Running task 2787 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: Running task 2788 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2789 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2790 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2791 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2792 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2793 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2794 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Succeeded
NOTE: Running task 2795 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2796 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2797 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2798 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2799 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2800 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: Running task 2801 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2802 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe vala-0.56.4-r0: task do_configure: Succeeded
NOTE: Running task 2803 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_compile)
NOTE: recipe vala-0.56.4-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2804 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2805 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2806 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2807 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2808 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2809 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2810 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2811 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2812 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2813 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2814 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2815 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2816 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2817 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: Running task 2818 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2819 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2820 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2821 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2822 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2823 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2824 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2825 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: Running task 2826 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: Running task 2827 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: Running task 2828 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2829 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2830 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2831 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2832 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2833 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2834 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2835 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2836 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2837 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2838 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2839 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2840 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2841 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2842 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2843 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2844 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2845 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2846 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2847 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2848 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2849 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2850 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2851 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: Running task 2852 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2853 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2854 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2855 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2856 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2857 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Started
NOTE: Running task 2858 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: Running task 2859 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: Running task 2860 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2861 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2862 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2863 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 2864 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: Running task 2865 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Succeeded
NOTE: Running task 2866 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Started
NOTE: recipe vala-0.56.4-r0: task do_compile: Succeeded
NOTE: Running task 2867 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_install)
NOTE: recipe vala-0.56.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2868 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Succeeded
NOTE: Running task 2869 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package)
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2875 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe vala-0.56.4-r0: task do_install: Succeeded
NOTE: Running task 2876 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_populate_sysroot)
NOTE: Running task 2877 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_package)
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_package: Started
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2878 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2879 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2880 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2881 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2882 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2883 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Succeeded
NOTE: Running task 2884 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_install)
NOTE: recipe libstd-rs-1.67.1-r0: task do_install: Started
NOTE: recipe vala-0.56.4-r0: task do_package: Succeeded
NOTE: Running task 2885 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_packagedata)
NOTE: recipe libstd-rs-1.67.1-r0: task do_install: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Started
NOTE: Running task 2886 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_populate_sysroot)
NOTE: Running task 2887 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_package)
NOTE: recipe libstd-rs-1.67.1-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_package: Started
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2888 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2889 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: Running task 2890 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2891 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2892 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_package: Succeeded
NOTE: Running task 2893 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_packagedata)
NOTE: recipe libstd-rs-1.67.1-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2894 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Succeeded
NOTE: Running task 2895 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2896 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2897 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Failed
NOTE: recipe libical-3.0.16-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2897 tasks of which 2619 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata
Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gtk+3/3.24.36-r0/temp/log.do_packagedata.3578447
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata) failed with exit code '1'

--===============9138371476899334662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 73 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-abacd6e418e82dc34e102c5e155a2216eba9d64e"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:abacd6e418e82dc34e102c5e155a2216eba9d64e"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 138 Local 16 Mirrors 0 Missed 122 Current 695 (11% match, 85% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 805 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1531 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1824 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1853 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1877 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_fetch)
NOTE: Running task 1901 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1920 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 1923 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 1924 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_fetch)
NOTE: Running task 1925 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1926 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1985 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 2000 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_patch)
NOTE: Running task 2018 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 2019 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2040 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2045 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: Running task 2087 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 2088 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe vala-0.56.4-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: Running task 2118 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2119 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2136 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 2137 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe curl-7.88.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 2138 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_unpack)
NOTE: Running task 2139 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 2140 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Started
NOTE: Running task 2141 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 2142 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 2143 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2144 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2145 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_unpack)
NOTE: Running task 2146 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: Running task 2158 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2159 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 2168 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: Running task 2169 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2180 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2182 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2202 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2203 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2204 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2205 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: Running task 2227 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running task 2228 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: Running task 2229 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: Running task 2259 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: Running task 2260 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: Running task 2294 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2295 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2296 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: Running task 2297 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 2298 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2326 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: recipe curl-7.88.1-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: Running task 2358 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_fetch)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 2371 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 2372 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: Running task 2431 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: Running task 2432 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2441 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2442 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: Running task 2443 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2444 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2445 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2446 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2447 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: Running task 2448 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 2449 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 2473 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: Running task 2494 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2508 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: Running task 2509 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: Running task 2515 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_write_config)
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2550 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2551 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 2560 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2561 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 2562 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: Running task 2563 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_unpack)
NOTE: Running task 2564 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2565 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: Running task 2566 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: Running task 2571 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: Running task 2573 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: Running task 2574 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2575 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: Running task 2576 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2590 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running task 2623 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 2639 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running task 2647 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Succeeded
NOTE: Running task 2648 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: Running task 2649 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_create_wrappers)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Started
NOTE: Running task 2650 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2651 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2652 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_gen_targets)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 2653 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: Running task 2654 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2655 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 2656 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 2657 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: Running task 2658 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2659 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: Running task 2660 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2661 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Started
NOTE: Running task 2662 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2663 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: Running task 2664 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.88.1-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2665 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_patch)
NOTE: Running task 2666 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2667 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: Running task 2668 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 2669 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2670 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.4-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2671 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2672 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2673 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.88.1-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 2674 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 2675 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2676 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2677 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2678 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.4-r0: task do_patch: Started
NOTE: Running task 2679 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2680 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2681 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_patch: Succeeded
NOTE: Running task 2682 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2683 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2684 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2685 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: Running task 2686 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.88.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2687 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: Running task 2688 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 2689 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 2690 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2691 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2692 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2693 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 2694 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2695 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2696 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2697 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: Running task 2698 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2699 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2700 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: Running task 2701 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_configure)
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2702 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 218417b2dfed6baddf94a3ec9119553c544706652ce46c0b749bf3d2d59be9e5
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Started
NOTE: Running task 2716 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 2721 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.4-r0: task do_configure: Started
NOTE: Running task 2723 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2732 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: Running task 2733 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: Running task 2734 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2735 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 2736 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: Running task 2737 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2738 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2739 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 939d37d6158c1b021c4a4e87625a2c6699a2cf612100fe6402822e98ca499105
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2752 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2753 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: Running task 2754 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_patch)
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: Running task 2755 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2756 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2757 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic)
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Started
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2758 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2759 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic unihash changed to 10de89ca5718493f2dbbdfe938f79ca6291232312b05f7a87898b8ba03490e64
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2760 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2761 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_configure)
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 2762 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 2763 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 2764 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2765 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 2766 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2767 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 2768 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: Running task 2769 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: Running task 2770 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2771 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2772 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2773 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2774 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2775 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2776 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Succeeded
NOTE: Running task 2777 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2778 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2779 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2780 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: Running task 2781 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2782 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2783 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 2784 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe vala-0.56.4-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: Running task 2785 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_compile)
NOTE: recipe vala-0.56.4-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2786 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2787 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2788 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2789 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2790 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2791 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2792 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2793 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2794 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2795 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2796 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2797 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2798 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: Running task 2799 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2800 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: Running task 2801 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2802 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2803 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2804 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2805 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2806 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2807 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2808 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2809 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2810 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: Running task 2811 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2812 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2813 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: Running task 2814 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2815 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2816 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2817 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2818 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install_ptest_base)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2819 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2820 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2821 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: Running task 2822 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2823 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2824 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2825 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2826 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2827 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2828 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2829 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2830 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2831 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: Running task 2832 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2833 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2834 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2835 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2836 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2837 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2838 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2839 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2840 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 2841 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: Running task 2842 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2843 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2844 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2845 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: Running task 2846 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 2847 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2848 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Started
NOTE: recipe vala-0.56.4-r0: task do_compile: Succeeded
NOTE: Running task 2849 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_install)
NOTE: recipe vala-0.56.4-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Succeeded
NOTE: Running task 2850 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Succeeded
NOTE: Running task 2851 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_install)
NOTE: recipe libstd-rs-1.67.1-r0: task do_install: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_install: Succeeded
NOTE: Running task 2852 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_populate_sysroot)
NOTE: Running task 2853 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_package)
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Succeeded
NOTE: Running task 2854 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2860 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe libstd-rs-1.67.1-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe vala-0.56.4-r0: task do_install: Succeeded
NOTE: Running task 2861 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_populate_sysroot)
NOTE: Running task 2862 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_package)
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_package: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2863 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2864 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2865 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2866 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2867 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2868 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2869 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2870 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2871 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_package: Succeeded
NOTE: Running task 2872 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_packagedata)
NOTE: recipe libstd-rs-1.67.1-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2873 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe vala-0.56.4-r0: task do_package: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: Running task 2874 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_packagedata)
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: Running task 2875 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2876 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2877 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2878 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Succeeded
NOTE: Running task 2879 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Failed
NOTE: recipe libical-3.0.16-r0: task do_compile: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2879 tasks of which 2601 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata
Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gtk+3/3.24.36-r0/temp/log.do_packagedata.4137531
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata) failed with exit code '1'

--===============9138371476899334662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1791 targets, 50 skipped, 0 masked, 0 errors.
Removing 118 recipes from the core2-32 sysroot...done.
Removing 122 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-abacd6e418e82dc34e102c5e155a2216eba9d64e"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:abacd6e418e82dc34e102c5e155a2216eba9d64e"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 518 Local 382 Mirrors 0 Missed 136 Current 312 (73% match, 83% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 313 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.50.13-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: Running task 959 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 960 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 961 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: Running task 980 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 994 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_fetch)
NOTE: Running task 1006 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1016 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 1017 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 1018 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: Running task 1021 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: Running task 1022 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1023 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1024 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_fetch)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1077 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 1089 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_patch)
NOTE: Running task 1101 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1102 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1116 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 1123 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1148 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 1149 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1206 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1207 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: Running task 1219 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 1223 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: recipe vala-0.56.4-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: Running task 1224 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 1225 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 1226 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1250 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_unpack)
NOTE: recipe curl-7.88.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1251 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 1252 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: Running task 1253 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 1254 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: Running task 1266 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 1267 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: Running task 1268 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Started
NOTE: Running task 1279 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 1280 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: recipe curl-7.88.1-r0: task do_fetch: Succeeded
NOTE: Running task 1297 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 1298 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 1299 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 1300 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: Running task 1301 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 1302 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_unpack)
NOTE: Running task 1321 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 1336 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_fetch)
NOTE: Running task 1349 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 1350 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 538 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 539 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running task 1383 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 1384 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1385 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 1386 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1399 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: Running task 1408 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 1409 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 1412 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 1413 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: Running task 1429 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_write_config)
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1434 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1435 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running setscene task 543 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: Running task 1442 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe vala-0.56.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running task 1443 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: Running task 1457 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe curl-7.88.1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1473 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: Running task 1474 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 1476 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1492 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1511 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 1512 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running task 1527 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1528 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 1529 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: Running task 1530 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_unpack)
NOTE: recipe mesa-2_22.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 557 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running task 1534 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 1538 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_unpack)
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: Running task 1554 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1587 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running task 1590 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_write_config: Succeeded
NOTE: Running task 1592 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 1594 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 568 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 570 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Started
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1599 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 575 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running setscene task 576 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 1605 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1607 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1608 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 1609 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: Running task 1610 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: Running task 1611 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 1612 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 1613 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1614 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 582 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1628 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1629 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 1630 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: Running setscene task 588 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: Running task 1631 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: Running task 1632 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1633 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: Running task 1634 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1635 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1636 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_gen_targets)
NOTE: Running task 1637 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 597 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 599 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 600 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: Running task 1641 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1644 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: Running task 1648 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.88.1-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1649 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_patch)
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 606 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: Running task 1651 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1652 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: Running task 1653 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: Running task 1654 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_unpack: Succeeded
NOTE: Running task 1655 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1656 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 608 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 609 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: Running task 1661 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: Running task 1670 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: Running task 1673 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 1674 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 615 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1679 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1680 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1681 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.88.1-r0: task do_patch: Started
NOTE: Running task 1682 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1684 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1687 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1690 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.4-r0: task do_patch: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 621 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 625 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_patch: Succeeded
NOTE: Running task 1700 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.88.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1701 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.4-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 631 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1702 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 1703 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 1704 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1705 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 637 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 643 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.88.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: Running task 1733 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1738 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: Running task 1739 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1740 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1741 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 647 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1747 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 653 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running setscene task 657 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1752 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1758 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe vala-0.56.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: recipe curl-7.88.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1759 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 672 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1782 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1783 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_unpack: Succeeded
NOTE: Running task 1792 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1806 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_patch: Succeeded
NOTE: Running setscene task 708 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1824 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1845 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_patch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1846 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1851 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1880 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1894 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1899 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1900 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic unihash changed to 10de89ca5718493f2dbbdfe938f79ca6291232312b05f7a87898b8ba03490e64
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1946 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 805 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ba3746df05eabf3927798dd94e2320be4e35e0260cfd0af69bed798de504f77f
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2399 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2484 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2485 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2496 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2499 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2507 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2511 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2547 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2564 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2597 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2606 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2614 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2615 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2616 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2617 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2669 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 985103717a83f6077abb0e5a0edc91148f672ca0f9b79af2d10d906cde13d811
NOTE: Running task 2678 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: Running task 2679 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_configure)
NOTE: Running task 2689 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2690 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: Running task 2691 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_configure: Started
NOTE: Running task 2700 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2701 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2702 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2703 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: Running task 2704 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe vala-0.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2705 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2706 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2707 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe vala-0.56.4-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2708 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 2709 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2710 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_configure)
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 2711 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 2712 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 2713 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 2714 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2715 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 2716 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 2717 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: Running task 2718 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure_ptest_base)
NOTE: Running task 2719 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: Running task 2720 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2721 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_configure: Succeeded
NOTE: Running task 2722 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_compile)
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2723 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2724 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: Running task 2725 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2726 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2727 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Succeeded
NOTE: Running task 2728 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2729 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Succeeded
NOTE: Running task 2730 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot)
NOTE: Running task 2731 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2732 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: Running task 2733 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2734 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2735 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 2736 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2737 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2738 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2739 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Succeeded
NOTE: Running task 2740 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: Running task 2741 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2742 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2743 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2744 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2745 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2746 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2747 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2748 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2749 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe vala-0.56.4-r0: task do_configure: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: Running task 2750 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe vala-0.56.4-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2751 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: Running task 2752 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2753 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: Running task 2754 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: Running task 2755 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2756 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2757 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2758 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2759 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2760 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2761 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 2762 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2763 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 2764 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: Running task 2765 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2766 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2767 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2768 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2769 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Started
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2770 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: Running task 2771 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2772 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2773 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2774 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2775 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Succeeded
NOTE: Running task 2776 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2777 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2778 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2779 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2780 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2781 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2782 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2783 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Succeeded
NOTE: Running task 2784 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_install)
NOTE: recipe libunwind-1.6.2-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2785 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2786 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2787 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libunwind-1.6.2-r0: task do_install: Succeeded
NOTE: Running task 2788 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot)
NOTE: Running task 2789 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2790 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2791 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libunwind-1.6.2-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2792 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2793 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2794 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2795 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_rust_create_wrappers)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe libunistring-1.1-r0: task do_configure: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2796 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_compile)
NOTE: Running task 2797 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_configure)
NOTE: recipe libunistring-1.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2798 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 2799 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: recipe libstd-rs-1.67.1-r0: task do_configure: Succeeded
NOTE: Running task 2800 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: Running task 2801 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb:do_compile)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2802 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2803 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libunwind-1.6.2-r0: task do_package: Succeeded
NOTE: Running task 2804 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2805 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2806 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 2807 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: Running task 2808 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_compile)
NOTE: recipe eudev-3.2.11-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2809 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2810 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe eudev-3.2.11-r0: task do_compile: Succeeded
NOTE: Running task 2811 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_install)
NOTE: recipe eudev-3.2.11-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2812 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2813 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2814 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.11-r0: task do_install: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2815 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot)
NOTE: Running task 2816 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_package)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2817 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2818 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2819 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2820 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2821 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_compile: Succeeded
NOTE: Running task 2822 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_install)
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2823 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.4-r0: task do_compile: Succeeded
NOTE: Running task 2824 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_install: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Succeeded
NOTE: Running task 2825 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_install: Succeeded
NOTE: Running task 2826 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2832 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe vala-0.56.4-r0: task do_install: Succeeded
NOTE: Running task 2833 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_populate_sysroot)
NOTE: Running task 2834 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_package)
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.4-r0: task do_package: Started
NOTE: recipe vala-0.56.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2835 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2836 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_configure)
NOTE: recipe libical-3.0.16-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2837 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2838 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2839 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.4-r0: task do_package: Succeeded
NOTE: Running task 2840 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.4.bb:do_packagedata)
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2841 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2842 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2843 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libical-3.0.16-r0: task do_configure: Succeeded
NOTE: Running task 2844 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_compile)
NOTE: recipe libical-3.0.16-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2845 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2846 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2847 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2848 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2849 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2850 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2851 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_package: Succeeded
NOTE: Running task 2852 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2853 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Failed
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.67.1-r0: task do_compile: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2853 tasks of which 2534 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata
Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gtk+3/3.24.36-r0/temp/log.do_packagedata.180509
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata) failed with exit code '1'

--===============9138371476899334662==--

